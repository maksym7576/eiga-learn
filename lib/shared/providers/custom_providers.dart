import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/cards/custom_library_row.dart';
import '../../database/seeds/sample_words.dart';
import '../../database/models/word_models.dart';

class WordStatusNotifier extends Notifier<Map<String, WordStatus>> {
  @override
  Map<String, WordStatus> build() {
    return {
      '食べる|verb': WordStatus.learning,
    };
  }

  void setStatus(String key, WordStatus status) {
    if (status == WordStatus.none) {
      final updated = {...state};
      updated.remove(key);
      state = updated;
    } else {
      state = {...state, key: status};
    }
  }
}

final wordStatusesProvider = NotifierProvider<WordStatusNotifier, Map<String, WordStatus>>(WordStatusNotifier.new);

/// Provider supplying vocabulary custom items with live reactive status updates.
final customItemsProvider = Provider<List<CustomItem>>((ref) {
  final statuses = ref.watch(wordStatusesProvider);
  final items = sampleWords.values.map((w) => CustomItem(
        id: w.key,
        title: w.original,
        subtitle: '${w.kana} · ${w.translation ?? w.pos}',
        status: statuses[w.key] ?? WordStatus.none,
        jlpt: w.jlpt,
        pos: w.pos,
        occurrences: w.occurrences,
        note: w.note,
      )).toList();
  return items;
});
