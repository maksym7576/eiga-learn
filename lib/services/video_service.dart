import 'package:hive/hive.dart';
import 'package:hooks_riverpod/legacy.dart';
import '../models/video_object.dart';

class VideoService extends StateNotifier<List<video_object>> {
  final Box<video_object> _box;

  VideoService(this._box) : super([]) {
    _init();
  }

  void _init() {
    state = _box.values.toList();
  }

  Future<void> addVideo(video_object video) async {
    await _box.add(video);
    state = [...state, video];
  }

  Future<void> updateVideo(int index, String newName) async {
    final v = state[index];
    v.name = newName;
    await v.save();
    final newList = [...state];
    newList[index] = v;
    state = newList;
  }

  Future<void> deleteVideo(int index) async {
    final v = state[index];
    await v.delete();
    final newList = [...state];
    newList.removeAt(index);
    state = newList;
  }
}
