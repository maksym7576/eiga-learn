import 'package:isar_community/isar.dart';
import '../../database/models/ai_model_score.dart';

class AiModelScoreRepository {
  AiModelScoreRepository(this.isar);
  final Isar isar;

  Future<void> save(AiModelScore score) async {
    await isar.writeTxn(() async {
      await isar.aiModelScores.put(score);
    });
  }

  Future<void> saveAll(List<AiModelScore> scores) async {
    await isar.writeTxn(() async {
      await isar.aiModelScores.putAll(scores);
    });
  }

  Future<AiModelScore?> getById(Id id) async {
    return await isar.aiModelScores.get(id);
  }

  Future<List<AiModelScore>> getAll() async {
    return await isar.aiModelScores.where().findAll();
  }

  Stream<List<AiModelScore>> watchAll() {
    return isar.aiModelScores.where().watch(fireImmediately: true);
  }

  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.aiModelScores.delete(id);
    });
  }

  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.aiModelScores.clear();
    });
  }
}
