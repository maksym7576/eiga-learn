import 'package:isar_community/isar.dart';
import '../../database/models/ai_model_score.dart';
import 'base_repository.dart';

class AiModelScoreRepository extends BaseRepository<AiModelScore> {
  AiModelScoreRepository(super.isar);

  @override
  IsarCollection<AiModelScore> get collection => isar.aiModelScores;

  Future<AiModelScore?> getByKey(String modelName, String stepId) async {
    final key = '$modelName#$stepId';
    return await isar.aiModelScores.filter().keyEqualTo(key).findFirst();
  }

  Future<List<AiModelScore>> getForStep(String stepId) async {
    return await isar.aiModelScores.filter().stepEqualTo(stepId).findAll();
  }
}
