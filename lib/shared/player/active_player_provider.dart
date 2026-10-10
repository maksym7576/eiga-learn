import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class ActivePlayerState {
  final Player? player;
  final VideoController? controller;
  final String? videoPath;
  final bool isPlaying;
  final Duration position;
  final Duration duration;
  final int? width;
  final int? height;
  final double volume;
  final List<Map<String, String>> audioTracks;
  final List<Map<String, String>> subtitleTracks;

  const ActivePlayerState({
    this.player,
    this.controller,
    this.videoPath,
    this.isPlaying = false,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.width,
    this.height,
    this.volume = 1.0,
    this.audioTracks = const [],
    this.subtitleTracks = const [],
  });

  bool get hasVideo => player != null && videoPath != null;

  ActivePlayerState copyWith({
    Player? player,
    VideoController? controller,
    String? videoPath,
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    int? width,
    int? height,
    double? volume,
    List<Map<String, String>>? audioTracks,
    List<Map<String, String>>? subtitleTracks,
  }) {
    return ActivePlayerState(
      player: player ?? this.player,
      controller: controller ?? this.controller,
      videoPath: videoPath ?? this.videoPath,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      width: width ?? this.width,
      height: height ?? this.height,
      volume: volume ?? this.volume,
      audioTracks: audioTracks ?? this.audioTracks,
      subtitleTracks: subtitleTracks ?? this.subtitleTracks,
    );
  }
}

class ActivePlayerNotifier extends Notifier<ActivePlayerState> {
  StreamSubscription? _posSub;
  StreamSubscription? _durSub;
  StreamSubscription? _playSub;
  StreamSubscription? _tracksSub;
  StreamSubscription? _volSub;
  StreamSubscription? _widthSub;
  StreamSubscription? _heightSub;

  @override
  ActivePlayerState build() {
    ref.onDispose(() {
      _cleanup();
    });
    return const ActivePlayerState();
  }

  Future<void> openVideo(String path) async {
    // Якщо відео вже відкрите і грає — залишаємо поточний стан
    if (state.videoPath == path && state.player != null) {
      return;
    }

    _cleanup();

    try {
      final player = Player();
      final controller = VideoController(player);

      state = ActivePlayerState(
        player: player,
        controller: controller,
        videoPath: path,
        isPlaying: true,
      );

      _posSub = player.stream.position.listen((pos) {
        state = state.copyWith(position: pos);
      });
      _durSub = player.stream.duration.listen((dur) {
        if (dur > Duration.zero) {
          state = state.copyWith(duration: dur);
        }
      });
      _playSub = player.stream.playing.listen((playing) {
        state = state.copyWith(isPlaying: playing);
      });
      _volSub = player.stream.volume.listen((v) {
        state = state.copyWith(volume: (v / 100).clamp(0.0, 1.0));
      });
      _widthSub = player.stream.width.listen((w) {
        state = state.copyWith(width: w);
      });
      _heightSub = player.stream.height.listen((h) {
        state = state.copyWith(height: h);
      });
      _tracksSub = player.stream.tracks.listen((tracks) {
        final audio = tracks.audio
            .where((t) => t.id != 'auto' && t.id != 'no')
            .map((t) => {
                  't': (t.title != null && t.title!.isNotEmpty)
                      ? t.title!
                      : (t.language != null ? 'Audio (${t.language})' : 'Audio Track'),
                  'l': t.language ?? 'und',
                })
            .toList();

        final subtitle = tracks.subtitle
            .where((t) => t.id != 'auto' && t.id != 'no')
            .map((t) => {
                  't': (t.title != null && t.title!.isNotEmpty)
                      ? t.title!
                      : (t.language != null ? 'Subtitle (${t.language})' : 'Subtitle Track'),
                  'l': t.language ?? 'und',
                })
            .toList();

        state = state.copyWith(audioTracks: audio, subtitleTracks: subtitle);
      });

      await player.open(Media(path));
      await player.setSubtitleTrack(SubtitleTrack.no());
      await player.play();
    } catch (_) {}
  }

  /// Метод для встановлення на паузу
  void pause() {
    state.player?.pause();
  }

  /// Метод для продовження відтворення
  void play() {
    state.player?.play();
  }

  /// Метод для перемикання Play/Pause
  void togglePlayPause() {
    state.player?.playOrPause();
  }

  /// Перемотка на потрібну позицію
  void seek(Duration position) {
    state.player?.seek(position);
  }

  /// Зміна гучності (0.0 .. 1.0)
  void setVolume(double volume) {
    final v = volume.clamp(0.0, 1.0);
    state.player?.setVolume(v * 100);
    state = state.copyWith(volume: v);
  }

  /// Зміна швидкості відтворення
  void setRate(double rate) {
    state.player?.setRate(rate);
  }

  /// Вибір аудіодоріжки
  void setAudioTrack(int index) {
    final player = state.player;
    if (player == null) return;
    final tracks = player.state.tracks.audio
        .where((t) => t.id != 'auto' && t.id != 'no')
        .toList();
    if (index >= 0 && index < tracks.length) {
      player.setAudioTrack(tracks[index]);
    }
  }

  /// Вибір субтитрів
  void setSubtitleTrack(int index) {
    final player = state.player;
    if (player == null) return;
    final tracks = player.state.tracks.subtitle
        .where((t) => t.id != 'auto' && t.id != 'no')
        .toList();
    if (index >= 0 && index < tracks.length) {
      player.setSubtitleTrack(tracks[index]);
    }
  }

  /// Метод для повного вивантаження і очищення провайдера та ресурсів плеєра
  void clear() {
    _cleanup();
    state = const ActivePlayerState();
  }

  void _cleanup() {
    _posSub?.cancel();
    _durSub?.cancel();
    _playSub?.cancel();
    _tracksSub?.cancel();
    _volSub?.cancel();
    _widthSub?.cancel();
    _heightSub?.cancel();

    _posSub = null;
    _durSub = null;
    _playSub = null;
    _tracksSub = null;
    _volSub = null;
    _widthSub = null;
    _heightSub = null;

    final p = state.player;
    if (p != null) {
      p.stop();
      p.dispose();
    }
  }
}

final activePlayerProvider =
    NotifierProvider<ActivePlayerNotifier, ActivePlayerState>(() {
  return ActivePlayerNotifier();
});
