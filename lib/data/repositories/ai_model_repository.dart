import 'package:isar_community/isar.dart';
import '../../database/models/ai_model.dart';
import '../../database/embedded/model_capabilities.dart';
import 'base_repository.dart';

class AiModelRepository extends BaseRepository<AiModel> {
  AiModelRepository(super.isar);

  @override
  IsarCollection<AiModel> get collection => isar.aiModels;

  Future<AiModel?> getByName(String name) async {
    return await isar.aiModels.filter().nameEqualTo(name).findFirst();
  }

  Future<List<AiModel>> getEnabled() async {
    return await isar.aiModels.filter().isEnabledEqualTo(true).findAll();
  }

  Future<List<AiModel>> getSupportingStep(String stepId) async {
    return await isar.aiModels
        .filter()
        .isEnabledEqualTo(true)
        .and()
        .capabilities((c) => c.supportedStepsElementEqualTo(stepId))
        .findAll();
  }
}
