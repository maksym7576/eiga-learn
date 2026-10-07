import 'package:isar_community/isar.dart';
import '../../database/models/lemma.dart';

class LemmaRepository {
  LemmaRepository(this.isar);
  final Isar isar;

  Future<void> save(Lemma lemma) async {
    await isar.writeTxn(() async {
      await isar.lemmas.put(lemma);
    });
  }

  Future<void> saveAll(List<Lemma> lemmas) async {
    await isar.writeTxn(() async {
      await isar.lemmas.putAll(lemmas);
    });
  }

  Future<Lemma?> getById(Id id) async {
    return await isar.lemmas.get(id);
  }

  Future<List<Lemma>> getAll() async {
    return await isar.lemmas.where().findAll();
  }

  Stream<List<Lemma>> watchAll() {
    return isar.lemmas.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.lemmas.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.lemmas.clear();
    });
  }
}
