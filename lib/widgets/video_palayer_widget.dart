import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/video_time_provider.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerWidget extends ConsumerWidget {
  const VideoPlayerWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = ref.watch(videoProvider);
    return Container(
      height: 250,
      color: Colors.black,
      child: v.initialized && v.chewie != null ? Chewie(controller: v.chewie!) : const Center(child: CircularProgressIndicator()),
    );
  }
}
