import 'package:isar_community/isar.dart';
import '../../database/models/lemma_gloss.dart';

class LemmaGlossRepository {
  LemmaGlossRepository(this.isar);
  final Isar isar;

  Future<void> save(LemmaGloss gloss) async {
    await isar.writeTxn(() async {
      await isar.lemmaGloss.put(gloss);
    });
  }

  Future<void> saveAll(List<LemmaGloss> glosses) async {
    await isar.writeTxn(() async {
      await isar.lemmaGloss.putAll(glosses);
    });
  }

  Future<LemmaGloss?> getById(Id id) async {
    return await isar.lemmaGloss.get(id);
  }

  Future<List<LemmaGloss>> getAll() async {
    return await isar.lemmaGloss.where().findAll();
  }

  Stream<List<LemmaGloss>> watchAll() {
    return isar.lemmaGloss.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.lemmaGloss.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.lemmaGloss.clear();
    });
  }
}
