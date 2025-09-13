import 'dart:developer' as developer;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nihongona/providers/subtitle_time_provider.dart';
import 'package:nihongona/providers/video_time_provider.dart';

final subtitleSyncProvider = Provider<void>((ref) {
  ref.listen<VideoState>(videoProvider, (prev, next) {
    if (next == null) return;
    final pos = next.currentPosition;
    ref.read(subtitleProvider.notifier).updatePosition(pos);
  });
});
