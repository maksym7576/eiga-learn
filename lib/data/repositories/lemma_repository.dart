import 'package:isar_community/isar.dart';
import '../../database/models/lemma.dart';
import 'base_repository.dart';

class LemmaRepository extends BaseRepository<Lemma> {
  LemmaRepository(super.isar);

  @override
  IsarCollection<Lemma> get collection => isar.lemmas;

  Future<Lemma?> getByKey(String key) async {
    return await isar.lemmas.filter().keyEqualTo(key).findFirst();
  }

  Future<List<Lemma>> getByKeys(List<String> keys) async {
    return await isar.lemmas
        .filter()
        .anyOf(keys, (q, key) => q.keyEqualTo(key))
        .findAll();
  }

  Future<void> upsertByKey(Lemma lemma) async {
    await isar.writeTxn(() async {
      final existing = await isar.lemmas.filter().keyEqualTo(lemma.key).findFirst();
      if (existing != null) {
        lemma.id = existing.id;
      }
      await isar.lemmas.put(lemma);
    });
  }
}
