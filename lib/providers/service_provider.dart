import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/legacy.dart';
import '../models/video_object.dart';
import '../services/video_service.dart';

final videoBoxProvider = Provider<Box<video_object>>((ref) {
  return Hive.box<video_object>('videoBox');
});

final videoServiceProvider =
StateNotifierProvider<VideoService, List<video_object>>((ref) {
  final box = ref.watch(videoBoxProvider);
  return VideoService(box);
});
