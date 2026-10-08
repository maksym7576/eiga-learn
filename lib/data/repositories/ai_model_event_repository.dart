import 'package:isar_community/isar.dart';
import '../../database/models/ai_model_event.dart';
import 'base_repository.dart';

class AiModelEventRepository extends BaseRepository<AiModelEvent> {
  AiModelEventRepository(super.isar);

  @override
  IsarCollection<AiModelEvent> get collection => isar.aiModelEvents;

  Future<List<AiModelEvent>> getRecent(String modelName, String stepId, int limit) async {
    return await isar.aiModelEvents
        .filter()
        .modelNameEqualTo(modelName)
        .and()
        .stepEqualTo(stepId)
        .sortByTimestampDesc()
        .limit(limit)
        .findAll();
  }

  Future<void> deleteOlderThan(DateTime date) async {
    await isar.writeTxn(() async {
      final old = await isar.aiModelEvents.filter().timestampLessThan(date).findAll();
      final ids = old.map((e) => e.id).toList();
      await isar.aiModelEvents.deleteAll(ids);
    });
  }

  Future<List<AiModelEvent>> getByJob(int jobId) async {
    return await isar.aiModelEvents.filter().jobIdEqualTo(jobId).findAll();
  }
}
