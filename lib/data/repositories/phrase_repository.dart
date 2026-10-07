import 'package:isar_community/isar.dart';
import '../../database/models/phrase.dart';

class PhraseRepository {
  PhraseRepository(this.isar);
  final Isar isar;

  Future<void> save(Phrase phrase) async {
    await isar.writeTxn(() async {
      await isar.phrases.put(phrase);
    });
  }

  Future<void> saveAll(List<Phrase> phrases) async {
    await isar.writeTxn(() async {
      await isar.phrases.putAll(phrases);
    });
  }

  Future<Phrase?> getById(Id id) async {
    return await isar.phrases.get(id);
  }

  Future<List<Phrase>> getAll() async {
    return await isar.phrases.where().findAll();
  }

  Stream<List<Phrase>> watchAll() {
    return isar.phrases.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.phrases.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.phrases.clear();
    });
  }
}
