import 'package:isar_community/isar.dart';
import '../../database/models/lemma_usage.dart';

class LemmaUsageRepository {
  LemmaUsageRepository(this.isar);
  final Isar isar;

  Future<void> save(LemmaUsage usage) async {
    await isar.writeTxn(() async {
      await isar.lemmaUsages.put(usage);
    });
  }

  Future<void> saveAll(List<LemmaUsage> usages) async {
    await isar.writeTxn(() async {
      await isar.lemmaUsages.putAll(usages);
    });
  }

  Future<LemmaUsage?> getById(Id id) async {
    return await isar.lemmaUsages.get(id);
  }

  Future<List<LemmaUsage>> getAll() async {
    return await isar.lemmaUsages.where().findAll();
  }

  Stream<List<LemmaUsage>> watchAll() {
    return isar.lemmaUsages.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.lemmaUsages.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.lemmaUsages.clear();
    });
  }
}
