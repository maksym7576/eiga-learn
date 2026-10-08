import 'package:isar_community/isar.dart';
import '../../database/models/lemma_usage.dart';
import 'base_repository.dart';

class LemmaUsageRepository extends BaseRepository<LemmaUsage> {
  LemmaUsageRepository(super.isar);

  @override
  IsarCollection<LemmaUsage> get collection => isar.lemmaUsages;

  Future<LemmaUsage?> getByUsageKey(String key) async {
    return await isar.lemmaUsages.filter().usageKeyEqualTo(key).findFirst();
  }

  Future<List<LemmaUsage>> getByVideo(int videoId) async {
    return await isar.lemmaUsages.filter().videoIdEqualTo(videoId).findAll();
  }

  Future<void> deleteByVideo(int videoId) async {
    await isar.writeTxn(() async {
      final items = await isar.lemmaUsages.filter().videoIdEqualTo(videoId).findAll();
      final ids = items.map((e) => e.id).toList();
      await isar.lemmaUsages.deleteAll(ids);
    });
  }
}
