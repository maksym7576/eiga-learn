import 'dart:async';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoState {
  final VideoPlayerController? controller;
  final ChewieController? chewie;
  final Duration currentPosition;
  final bool initialized;

  VideoState({
    this.controller,
    this.chewie,
    this.currentPosition = Duration.zero,
    this.initialized = false,
  });

  VideoState copyWith({
    VideoPlayerController? controller,
    ChewieController? chewie,
    Duration? currentPosition,
    bool? initialized,
  }) =>
      VideoState(
        controller: controller ?? this.controller,
        chewie: chewie ?? this.chewie,
        currentPosition: currentPosition ?? this.currentPosition,
        initialized: initialized ?? this.initialized,
      );
}

class VideoNotifier extends StateNotifier<VideoState> {
  final Ref ref;
  Timer? _timer;

  VideoNotifier(this.ref) : super(VideoState());

  Future<void> initializeVideo(String path) async {
    final file = File(path);
    if (!file.existsSync()) return;

    final vc = VideoPlayerController.file(file);
    await vc.initialize();
    final cc = ChewieController(videoPlayerController: vc, autoPlay: true);

    state = state.copyWith(controller: vc, chewie: cc, initialized: true);
    _startPositionLoop();
  }

  void _startPositionLoop() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
      final c = state.controller;
      if (c != null && c.value.isInitialized) {
        final pos = c.value.position;
        if (pos != state.currentPosition) state = state.copyWith(currentPosition: pos);
      }
    });
  }

  void seekTo(Duration pos) {
    state.controller?.seekTo(pos);
  }

  @override
  void dispose() {
    _timer?.cancel();
    state.chewie?.dispose();
    state.controller?.dispose();
    super.dispose();
  }
}

final videoProvider = StateNotifierProvider<VideoNotifier, VideoState>((ref) => VideoNotifier(ref));
