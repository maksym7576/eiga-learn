import 'dart:developer' as developer;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import '../models/subtitle_object.dart';
import '../services/subtitle_service.dart';

final subtitleServiceProvider = Provider((_) => SubtitleService());

class SubtitleState {
  final List<SubtitleObject> list;
  final bool followVideo;

  SubtitleState({this.list = const [], this.followVideo = true});

  SubtitleState copyWith({List<SubtitleObject>? list, bool? followVideo}) =>
      SubtitleState(list: list ?? this.list, followVideo: followVideo ?? this.followVideo);
}

class SubtitleNotifier extends StateNotifier<SubtitleState> {
  final Ref ref;

  SubtitleNotifier(this.ref) : super(SubtitleState());

  void loadFromSrt(String path) {
    developer.log('loadFromSrt: $path', name: 'SubtitleNotifier');
    final svc = ref.read(subtitleServiceProvider);
    final parsed = svc.parseSrtFile(path);
    developer.log('loadFromSrt parsed ${parsed.length} subtitles', name: 'SubtitleNotifier');
    state = state.copyWith(list: parsed);
  }

  void updatePosition(Duration pos) {
    if (!state.followVideo) return;

    final svc = ref.read(subtitleServiceProvider);
    final updated = svc.updateActiveSubtitle(state.list, pos);
    state = state.copyWith(list: updated);
  }

  void setActiveIndex(int index) {
    final newList = state.list.asMap().entries.map((e) {
      final i = e.key;
      final s = e.value;
      return s.copyWith(isActive: i == index);
    }).toList();
    state = state.copyWith(list: newList);
  }

  void toggleFollow() {
    state = state.copyWith(followVideo: !state.followVideo);
  }
}

final subtitleProvider = StateNotifierProvider<SubtitleNotifier, SubtitleState>(
        (ref) => SubtitleNotifier(ref));
