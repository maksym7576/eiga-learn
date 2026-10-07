import 'package:isar_community/isar.dart';
import '../../database/models/ai_model_daily_stat.dart';

class AiModelDailyStatRepository {
  AiModelDailyStatRepository(this.isar);
  final Isar isar;

  Future<void> save(AiModelDailyStat stat) async {
    await isar.writeTxn(() async {
      await isar.aiModelDailyStats.put(stat);
    });
  }

  Future<void> saveAll(List<AiModelDailyStat> stats) async {
    await isar.writeTxn(() async {
      await isar.aiModelDailyStats.putAll(stats);
    });
  }

  Future<AiModelDailyStat?> getById(Id id) async {
    return await isar.aiModelDailyStats.get(id);
  }

  Future<List<AiModelDailyStat>> getAll() async {
    return await isar.aiModelDailyStats.where().findAll();
  }

  Stream<List<AiModelDailyStat>> watchAll() {
    return isar.aiModelDailyStats.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.aiModelDailyStats.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.aiModelDailyStats.clear();
    });
  }
}
