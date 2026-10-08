import 'package:isar_community/isar.dart';
import '../../database/models/phrase.dart';
import 'base_repository.dart';

class PhraseRepository extends BaseRepository<Phrase> {
  PhraseRepository(super.isar);

  @override
  IsarCollection<Phrase> get collection => isar.phrases;

  Future<List<Phrase>> getByVideo(int videoId) async {
    return await isar.phrases.filter().videoIdEqualTo(videoId).sortByPhraseOrder().findAll();
  }

  Stream<List<Phrase>> watchByVideo(int videoId) {
    return isar.phrases.filter().videoIdEqualTo(videoId).sortByPhraseOrder().watch(fireImmediately: true);
  }

  Future<List<Phrase>> getByIds(List<Id> ids) async {
    return await isar.phrases.getAll(ids).then((list) => list.whereType<Phrase>().toList());
  }

  Future<List<Phrase>> getByOrders(int videoId, List<int> orders) async {
    return await isar.phrases
        .filter()
        .videoIdEqualTo(videoId)
        .and()
        .anyOf(orders, (q, order) => q.phraseOrderEqualTo(order))
        .findAll();
  }

  Future<List<Phrase>> getWindow(int videoId, int fromOrder, int limit) async {
    return await isar.phrases
        .filter()
        .videoIdEqualTo(videoId)
        .and()
        .phraseOrderGreaterThan(fromOrder - 1)
        .sortByPhraseOrder()
        .limit(limit)
        .findAll();
  }

  Future<List<Phrase>> getWithActiveJob() async {
    return await isar.phrases.filter().activeJobIdIsNotNull().findAll();
  }

  Future<void> updateMany(List<Id> ids, void Function(Phrase phrase) mutate) async {
    await isar.writeTxn(() async {
      final phrases = await isar.phrases.getAll(ids);
      for (final p in phrases) {
        if (p != null) {
          mutate(p);
        }
      }
      final validPhrases = phrases.whereType<Phrase>().toList();
      if (validPhrases.isNotEmpty) {
        await isar.phrases.putAll(validPhrases);
      }
    });
  }
}
