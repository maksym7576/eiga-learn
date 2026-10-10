import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:window_manager/window_manager.dart';
import 'active_player_provider.dart';
import 'player_rail.dart';
import 'player_bottom_bar.dart';
import 'player_overlays.dart';
import 'subtitle_settings_panel.dart';

class FullscreenPlayerPage extends StatelessWidget {
  final String? videoPath;
  const FullscreenPlayerPage({super.key, this.videoPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: VideoPlayerContainer(
        initialFullScreen: true,
        videoPath: videoPath,
      ),
    );
  }
}

class VideoPlayerContainer extends ConsumerStatefulWidget {
  final bool initialFullScreen;
  final VoidCallback? onFullscreenToggle;
  final String? videoPath;
  final Function(List<Map<String, String>> audioTracks, List<Map<String, String>> subtitleTracks)? onTracksLoaded;
  final void Function(Duration duration, int? width, int? height)? onMetaLoaded;

  const VideoPlayerContainer({
    Key? key,
    this.initialFullScreen = false,
    this.onFullscreenToggle,
    this.videoPath,
    this.onTracksLoaded,
    this.onMetaLoaded,
  }) : super(key: key);

  @override
  ConsumerState<VideoPlayerContainer> createState() => _VideoPlayerContainerState();
}

class _VideoPlayerContainerState extends ConsumerState<VideoPlayerContainer> {
  /// Від цієї "меншої сторони" екран вважається великим (планшет/ПК) → показуємо гучність.
  static const double _largeScreenBreakpoint = 600;
  static const List<double> _speeds = [1.0, 0.85, 0.75];

  late bool _isFullScreen;
  PlayerLockPhase _lock = PlayerLockPhase.unlocked;
  bool _isPanelOpen = false;
  bool _wasPlayingBeforePanel = false;
  bool _isVisible = true;
  bool _isSeeking = false;
  int _speedIndex = 0;
  double _volumeBeforeMute = 1.0;

  int _skipLeft = 0, _skipRight = 0;
  DateTime? _lastTapAt;
  int _lastSide = 0;
  double _playerWidth = 1;

  Timer? _hideTimer;
  Timer? _singleTapTimer;
  Timer? _idleLockTimer;
  int _autoLockTrigger = 0;
  int _cancelLockTrigger = 0;
  bool _isTransitioning = false;

  void _cancelAutoLockIfPending() {
    if (_lock == PlayerLockPhase.pending) {
      setState(() => _cancelLockTrigger++);
      _resetIdleTimer();
    }
  }

  late final FocusNode _focusNode = FocusNode();

  bool get _isLocked => _lock == PlayerLockPhase.locked;

  bool _isLargeScreen(BuildContext context) {
    const desktop = {TargetPlatform.windows, TargetPlatform.linux, TargetPlatform.macOS};
    return desktop.contains(defaultTargetPlatform) ||
        MediaQuery.sizeOf(context).shortestSide >= _largeScreenBreakpoint;
  }

  @override
  void initState() {
    super.initState();
    _isFullScreen = widget.initialFullScreen;
    if (_isFullScreen) {
      _setOsFullScreen(true);
      _resetIdleTimer();
    }
    if (widget.videoPath != null && !_isFullScreen) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && widget.videoPath != null) {
          ref.read(activePlayerProvider.notifier).openVideo(widget.videoPath!);
        }
      });
    } else {
      _bump();
    }
  }

  @override
  void didUpdateWidget(covariant VideoPlayerContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoPath != oldWidget.videoPath && widget.videoPath != null && !_isFullScreen) {
      ref.read(activePlayerProvider.notifier).openVideo(widget.videoPath!);
    }
  }

  Future<void> _setOsFullScreen(bool isFullScreen) async {
    try {
      const desktop = {TargetPlatform.windows, TargetPlatform.linux, TargetPlatform.macOS};
      if (desktop.contains(defaultTargetPlatform)) {
        await windowManager.setBackgroundColor(const Color(0xFF09031A));
        await windowManager.setFullScreen(isFullScreen);
      } else {
        if (isFullScreen) {
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          await SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        } else {
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          await SystemChrome.setPreferredOrientations([]);
        }
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _idleLockTimer?.cancel();
    if (_isFullScreen) {
      _setOsFullScreen(false);
    }
    _hideTimer?.cancel();
    _singleTapTimer?.cancel();
    super.dispose();
  }

  // ───────── таймер неактивності (авто-блокування через 7 с + 3 с відлік у фуллскрін) ─────────

  void _resetIdleTimer() {
    _idleLockTimer?.cancel();
    if (_isFullScreen && _lock == PlayerLockPhase.unlocked) {
      _idleLockTimer = Timer(const Duration(seconds: 7), () {
        if (mounted && _isFullScreen && _lock == PlayerLockPhase.unlocked) {
          setState(() {
            _autoLockTrigger++;
          });
        }
      });
    }
  }

  // ───────── показ/ховання контролів (як bump() в HTML) ─────────

  void _scheduleHide() {
    _hideTimer?.cancel();
    final isPlaying = ref.read(activePlayerProvider).isPlaying;
    final delay = Duration(seconds: _isLocked ? 2 : 3);
    _hideTimer = Timer(delay, () {
      if (mounted && (isPlaying || _isLocked) && !_isSeeking) {
        setState(() => _isVisible = false);
      }
    });
  }

  void _bump() {
    if (!mounted) return;
    if (!_isVisible) {
      setState(() => _isVisible = true);
    }
    _scheduleHide();
  }

  void _onHover() {
    _cancelAutoLockIfPending();
    _resetIdleTimer();
    if (_isPanelOpen) return;
    if (!_isVisible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_isVisible) {
          _bump();
        }
      });
    } else {
      _scheduleHide();
    }
  }

  // ───────── дії ─────────

  void _setPlaying(bool play) {
    if (play) {
      ref.read(activePlayerProvider.notifier).play();
    } else {
      ref.read(activePlayerProvider.notifier).pause();
    }
  }

  void _togglePlayPause() {
    _cancelAutoLockIfPending();
    ref.read(activePlayerProvider.notifier).togglePlayPause();
    _bump();
    _resetIdleTimer();
  }

  void _seekTo(double seconds) {
    _cancelAutoLockIfPending();
    ref.read(activePlayerProvider.notifier).seek(Duration(milliseconds: (seconds * 1000).round()));
    _resetIdleTimer();
  }

  void _skip(double delta) {
    _cancelAutoLockIfPending();
    final curPos = ref.read(activePlayerProvider).position.inMilliseconds / 1000.0;
    final dur = ref.read(activePlayerProvider).duration.inMilliseconds / 1000.0;
    _seekTo((curPos + delta).clamp(0.0, dur > 0 ? dur : 1420.0));
    setState(() => delta < 0 ? _skipLeft++ : _skipRight++);
    _resetIdleTimer();
  }

  void _setVolume(double v) {
    _cancelAutoLockIfPending();
    v = v.clamp(0.0, 1.0).toDouble();
    if (v > 0) _volumeBeforeMute = v;
    ref.read(activePlayerProvider.notifier).setVolume(v);
    _scheduleHide();
    _resetIdleTimer();
  }

  void _toggleMute() {
    final curVol = ref.read(activePlayerProvider).volume;
    _setVolume(curVol > 0 ? 0 : (_volumeBeforeMute > 0 ? _volumeBeforeMute : 1));
  }

  Future<void> _toggleFullscreen() async {
    _cancelAutoLockIfPending();
    if (_isTransitioning) return;
    if (widget.onFullscreenToggle != null) {
      widget.onFullscreenToggle!();
      return;
    }

    _isTransitioning = true;
    try {
      if (!_isFullScreen) {
        if (!mounted) return;

        await Navigator.of(context).push(
          PageRouteBuilder(
            opaque: true,
            barrierColor: Colors.black,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
            pageBuilder: (context, _, __) {
              return FullscreenPlayerPage(videoPath: widget.videoPath);
            },
          ),
        );
      } else {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      }
    } finally {
      _isTransitioning = false;
    }
  }

  void _openPanel() {
    _cancelAutoLockIfPending();
    _singleTapTimer?.cancel();
    _wasPlayingBeforePanel = ref.read(activePlayerProvider).isPlaying;
    _setPlaying(false);
    _hideTimer?.cancel();
    setState(() {
      _isPanelOpen = true;
      _isVisible = false;
    });
    _resetIdleTimer();
  }

  void _closePanel() {
    _cancelAutoLockIfPending();
    setState(() => _isPanelOpen = false);
    _setPlaying(_wasPlayingBeforePanel);
    _bump();
    _resetIdleTimer();
  }

  /// один тап — показати/сховати; подвійний по краях — ∓10 с
  void _onTapUp(TapUpDetails d) {
    _cancelAutoLockIfPending();
    _resetIdleTimer();
    if (_isPanelOpen) {
      _closePanel();
      return;
    }
    final x = d.localPosition.dx / _playerWidth;
    final side = x < 0.32 ? -1 : (x > 0.68 ? 1 : 0);
    final now = DateTime.now();

    if (!_isLocked &&
        side != 0 &&
        side == _lastSide &&
        _lastTapAt != null &&
        now.difference(_lastTapAt!).inMilliseconds < 320) {
      _singleTapTimer?.cancel();
      _skip(side < 0 ? -10 : 10);
      _lastTapAt = null;
      _lastSide = 0;
      return;
    }
    _lastTapAt = now;
    _lastSide = side;
    _singleTapTimer?.cancel();

    void single() {
      if (!mounted) return;
      if (_isLocked) {
        _bump();
      } else if (_isVisible) {
        _hideTimer?.cancel();
        setState(() => _isVisible = false);
      } else {
        _bump();
      }
    }

    if (side == 0 || _isLocked) {
      single();
    } else {
      _singleTapTimer = Timer(const Duration(milliseconds: 300), single);
    }
  }

  Map<ShortcutActivator, VoidCallback> get _keyboardShortcuts => {
        const SingleActivator(LogicalKeyboardKey.space): () {
          _resetIdleTimer();
          if (!_isLocked) _togglePlayPause();
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          _resetIdleTimer();
          if (!_isLocked) {
            _skip(-10);
            _bump();
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          _resetIdleTimer();
          if (!_isLocked) {
            _skip(10);
            _bump();
          }
        },
        const SingleActivator(LogicalKeyboardKey.keyM): () {
          _resetIdleTimer();
          if (!_isLocked) _toggleMute();
        },
        const SingleActivator(LogicalKeyboardKey.escape): () {
          _resetIdleTimer();
          if (_isPanelOpen) {
            _closePanel();
          } else if (_isFullScreen) {
            _toggleFullscreen();
          }
        },
      };

  // ───────── UI ─────────

  @override
  Widget build(BuildContext context) {
    ref.listen<ActivePlayerState>(activePlayerProvider, (previous, next) {
      if (next.audioTracks != previous?.audioTracks || next.subtitleTracks != previous?.subtitleTracks) {
        widget.onTracksLoaded?.call(next.audioTracks, next.subtitleTracks);
      }
      if (next.duration > Duration.zero &&
          (next.duration != previous?.duration || next.width != previous?.width || next.height != previous?.height)) {
        widget.onMetaLoaded?.call(next.duration, next.width, next.height);
      }
    });

    return Material(
      type: MaterialType.canvas,
      color: Colors.black,
      child: CallbackShortcuts(
        bindings: _keyboardShortcuts,
        child: Focus(
          focusNode: _focusNode,
          autofocus: true,
          child: MouseRegion(
            cursor: _isVisible ? SystemMouseCursors.basic : SystemMouseCursors.none,
            onHover: (_) => _onHover(),
            child: GestureDetector(
              onTapUp: _onTapUp,
              child: _isFullScreen
                  ? SizedBox.expand(child: _buildPlayerContent())
                  : AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.85),
                              blurRadius: 60,
                              spreadRadius: -16,
                              offset: const Offset(0, 24),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: _buildPlayerContent(),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerContent() {
    final playerState = ref.watch(activePlayerProvider);
    final controller = playerState.controller;

    return LayoutBuilder(builder: (context, c) {
      _playerWidth = c.maxWidth;
      final large = _isLargeScreen(context);
      final isPending = _lock == PlayerLockPhase.pending;
      final show = _isVisible && !_isLocked && !isPending;
      final railVisible = _isVisible || isPending;
      final railTop = _isFullScreen ? math.max(10.0, MediaQuery.of(context).padding.top) : 10.0;
      const anim = Duration(milliseconds: 250);

      final isPlaying = playerState.isPlaying;
      final currentPos = playerState.position.inMilliseconds / 1000.0;
      final totalDur = playerState.duration.inMilliseconds / 1000.0;
      final volume = playerState.volume;

      return Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (controller != null && playerState.hasVideo)
              Video(controller: controller, controls: NoVideoControls)
            else
              const PlayerPlaceholderVideo(),

            // ==========================================
            // TODO: Subtitles inside the video player
            // (позиція: bottom = vo*100% + (show ? 10% : 0))
            // ==========================================

            PlayerSkipFeedback(left: true, trigger: _skipLeft),
            PlayerSkipFeedback(left: false, trigger: _skipRight),

            // Центральна кнопка
            Center(
              child: IgnorePointer(
                ignoring: !show,
                child: AnimatedOpacity(
                  opacity: show ? 1 : 0,
                  duration: anim,
                  child: PlayerHeroButton(
                    isPlaying: isPlaying,
                    isFullScreen: _isFullScreen,
                    onPressed: _togglePlayPause,
                  ),
                ),
              ),
            ),

            // Rail
            Positioned(
              top: railTop,
              right: 10,
              child: IgnorePointer(
                ignoring: !railVisible,
                child: AnimatedSlide(
                  offset: Offset(0, railVisible ? 0 : -0.4),
                  duration: anim,
                  child: AnimatedOpacity(
                    opacity: railVisible ? 1 : 0,
                    duration: anim,
                    child: PlayerRail(
                      isPanelOpen: _isPanelOpen,
                      currentSpeed: _speeds[_speedIndex],
                      autoLockTrigger: _autoLockTrigger,
                      cancelLockTrigger: _cancelLockTrigger,
                      onToggleSettings: () {
                        _cancelAutoLockIfPending();
                        _isPanelOpen ? _closePanel() : _openPanel();
                      },
                      onToggleSpeed: () {
                        _cancelAutoLockIfPending();
                        setState(() => _speedIndex = (_speedIndex + 1) % _speeds.length);
                        ref.read(activePlayerProvider.notifier).setRate(_speeds[_speedIndex]);
                        _bump();
                        _resetIdleTimer();
                      },
                      onLockChanged: (p) => setState(() => _lock = p),
                      onInteraction: () {
                        _bump();
                        _resetIdleTimer();
                      },
                    ),
                  ),
                ),
              ),
            ),

            // Нижня панель
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: IgnorePointer(
                ignoring: !show,
                child: AnimatedSlide(
                  offset: Offset(0, show ? 0 : 0.5),
                  duration: anim,
                  child: AnimatedOpacity(
                    opacity: show ? 1 : 0,
                    duration: anim,
                    child: PlayerBottomBar(
                      currentPosition: currentPos,
                      duration: totalDur > 0 ? totalDur : 1420.0,
                      isFullScreen: _isFullScreen,
                      onSeekStart: () {
                        _isSeeking = true;
                        _hideTimer?.cancel();
                        _resetIdleTimer();
                      },
                      onSeek: _seekTo,
                      onSeekEnd: () {
                        _isSeeking = false;
                        _bump();
                        _resetIdleTimer();
                      },
                      onToggleFullscreen: _toggleFullscreen,
                      showVolume: large,
                      volume: volume,
                      onVolumeChanged: _setVolume,
                      onToggleMute: _toggleMute,
                    ),
                  ),
                ),
              ),
            ),

            // Панель налаштувань субтитрів (поверх усього)
            SubtitleSettingsPanel(
              isOpen: _isPanelOpen,
              isFullScreen: _isFullScreen,
              onClose: _closePanel,
            ),
          ],
        ),
      );
    });
  }
}
