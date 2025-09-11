import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:nihongona/models/video_object.dart';

final video_box_provider = Provider<Box<video_object>>((ref) {
  return Hive.box<video_object>('videoBox');
});
