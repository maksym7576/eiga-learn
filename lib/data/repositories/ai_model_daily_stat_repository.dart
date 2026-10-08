import 'package:isar_community/isar.dart';
import '../../database/models/ai_model_daily_stat.dart';
import 'base_repository.dart';

class AiModelDailyStatRepository extends BaseRepository<AiModelDailyStat> {
  AiModelDailyStatRepository(super.isar);

  @override
  IsarCollection<AiModelDailyStat> get collection => isar.aiModelDailyStats;

  Future<AiModelDailyStat?> getToday(String modelName, String stepId) async {
    final dateStr = DateTime.now().toIso8601String().split('T').first;
    final key = '$modelName#$dateStr#$stepId';
    return await isar.aiModelDailyStats.filter().keyEqualTo(key).findFirst();
  }

  Future<void> upsertIncrement(
    String modelName,
    String stepId, {
    bool success = true,
    int tokensIn = 0,
    int tokensOut = 0,
    double cost = 0.0,
    int durationMs = 0,
    int phrasesRequested = 0,
    int phrasesAccepted = 0,
  }) async {
    final dateStr = DateTime.now().toIso8601String().split('T').first;
    final key = '$modelName#$dateStr#$stepId';

    await isar.writeTxn(() async {
      var stat = await isar.aiModelDailyStats.filter().keyEqualTo(key).findFirst();
      if (stat == null) {
        stat = AiModelDailyStat()
          ..key = key
          ..modelName = modelName
          ..date = dateStr
          ..step = stepId;
      }
      stat.requests += 1;
      if (success) {
        stat.successCount += 1;
      } else {
        stat.errorCount += 1;
      }
      stat.tokensIn += tokensIn;
      stat.tokensOut += tokensOut;
      stat.cost += cost;
      stat.phrasesRequested += phrasesRequested;
      stat.phrasesAccepted += phrasesAccepted;

      if (durationMs > 0) {
        stat.avgDurationMs = stat.avgDurationMs == null
            ? durationMs
            : ((stat.avgDurationMs! * (stat.requests - 1) + durationMs) ~/ stat.requests);
        stat.maxDurationMs = stat.maxDurationMs == null || durationMs > stat.maxDurationMs!
            ? durationMs
            : stat.maxDurationMs;
      }

      await isar.aiModelDailyStats.put(stat);
    });
  }

  Future<List<AiModelDailyStat>> getRange(String modelName, DateTime from, DateTime to) async {
    final fromStr = from.toIso8601String().split('T').first;
    final toStr = to.toIso8601String().split('T').first;
    return await isar.aiModelDailyStats
        .filter()
        .modelNameEqualTo(modelName)
        .and()
        .dateBetween(fromStr, toStr)
        .findAll();
  }

  Future<void> deleteOlderThan(DateTime date) async {
    final dateStr = date.toIso8601String().split('T').first;
    await isar.writeTxn(() async {
      final old = await isar.aiModelDailyStats.filter().dateLessThan(dateStr).findAll();
      final ids = old.map((e) => e.id).toList();
      await isar.aiModelDailyStats.deleteAll(ids);
    });
  }
}
