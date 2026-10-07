import '../models/lemma.dart';
import '../../data/repositories/lemma_repository.dart';
import '../embedded/reading_item.dart';
import '../embedded/sync_meta.dart';

class WordSeed {
  static List<Lemma> get sampleLemmas => [
        Lemma()
          ..key = '食べる|verb'
          ..versions = [
            ReadingItem()
              ..key = 'original'
              ..text = '食べる',
            ReadingItem()
              ..key = 'kana'
              ..text = 'たべる',
            ReadingItem()
              ..key = 'romaji'
              ..text = 'taberu',
          ]
          ..posTag = 'дієслово'
          ..jlptLevel = 'N5'
          ..synonymKeys = ['召し上がる|verb', '食う|verb']
          ..antonymKeys = ['飲む|verb']
          ..sync = (SyncMeta()
            ..syncId = 'sync_taberu'
            ..ownerId = 'local'
            ..isSynced = true
            ..updatedAt = DateTime.now()),
        Lemma()
          ..key = '飲む|verb'
          ..versions = [
            ReadingItem()
              ..key = 'original'
              ..text = '飲む',
            ReadingItem()
              ..key = 'kana'
              ..text = 'のむ',
            ReadingItem()
              ..key = 'romaji'
              ..text = 'nomu',
          ]
          ..posTag = 'дієслово'
          ..jlptLevel = 'N5'
          ..synonymKeys = []
          ..antonymKeys = ['食べる|verb']
          ..sync = (SyncMeta()
            ..syncId = 'sync_nomu'
            ..ownerId = 'local'
            ..isSynced = true
            ..updatedAt = DateTime.now()),
      ];

  static Future<void> seedIfEmpty(LemmaRepository repository) async {
    final existing = await repository.getAll();
    if (existing.isEmpty) {
      await repository.saveAll(sampleLemmas);
    }
  }
}
