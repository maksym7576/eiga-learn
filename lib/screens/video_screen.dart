import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/video_time_provider.dart';
import '../providers/subtitle_time_provider.dart';
import '../providers/subtitle_sync_provider.dart';
import '../widgets/video_palayer_widget.dart';
import '../widgets/subtitle_widget.dart';
import 'dart:developer' as developer;

class VideoScreen extends ConsumerStatefulWidget {
  const VideoScreen({super.key});
  @override
  ConsumerState<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<VideoScreen> {
  bool _inited = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_inited) {
      final conf = GoRouter.of(context).routerDelegate.currentConfiguration;
      final args = conf.extra as Map<String, dynamic>?;
      if (args != null) {
        final videoPath = args['videoPath'] as String;
        final srtPath = args['srtPath'] as String?;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          developer.log('VideoScreen: initializing video and subtitles', name: 'VideoScreen');
          ref.read(videoProvider.notifier).initializeVideo(videoPath);
          if (srtPath != null && File(srtPath).existsSync()) {
            ref.read(subtitleProvider.notifier).loadFromSrt(srtPath);
          } else {
            developer.log('VideoScreen: no srtPath or file not found: $srtPath', name: 'VideoScreen');
          }
          ref.read(subtitleSyncProvider);
        });
      }
      _inited = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final v = ref.watch(videoProvider);
    final subState = ref.watch(subtitleProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Video Player'),
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
          developer.log('Back pressed: invalidating videoProvider', name: 'VideoScreen');
          // Безпечне звільнення ресурсів у Riverpod — invalidation
          try {
            ref.invalidate(videoProvider);
          } catch (e, st) {
            developer.log('Error invalidating videoProvider: $e', name: 'VideoScreen', error: e, stackTrace: st);
          }
          context.go('/main');
        }),
        actions: [
          if (v.initialized)
            Padding(padding: const EdgeInsets.only(right: 12), child: Center(child: Text(_format(v.controller?.value.duration ?? Duration.zero), style: const TextStyle(color: Colors.white70)))),
        ],
      ),
      body: Column(
        children: [
          const VideoPlayerWidget(),
          Expanded(child: subState.list.isNotEmpty ? const SubtitleWidget() : Container(color: Colors.grey[900], child: const Center(child: Text('No subtitles', style: TextStyle(color: Colors.white70))))),
        ],
      ),
    );
  }

  String _format(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return h > 0 ? '${h.toString().padLeft(2,'0')}:$m:$s' : '$m:$s';
  }
}