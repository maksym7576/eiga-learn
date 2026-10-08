import 'package:eiga/data/repositories/ai_model_repository.dart';
import 'package:eiga/data/repositories/ai_model_score_repository.dart';
import 'package:eiga/data/repositories/ai_model_daily_stat_repository.dart';
import 'package:eiga/data/repositories/step_model_preference_repository.dart';
import 'package:eiga/database/models/ai_model.dart';

class ModelSelector {
  ModelSelector({
    required this.aiModelRepo,
    required this.scoreRepo,
    required this.statRepo,
    required this.preferenceRepo,
  });

  final AiModelRepository aiModelRepo;
  final AiModelScoreRepository scoreRepo;
  final AiModelDailyStatRepository statRepo;
  final StepModelPreferenceRepository preferenceRepo;

  Future<AiModel?> selectModelForStep(String stepId) async {
    final pref = await preferenceRepo.getForStep(stepId);
    if (pref != null && !pref.isAuto && pref.modelName != null) {
      final model = await aiModelRepo.getByName(pref.modelName!);
      if (model != null && model.isEnabled) {
        return model;
      }
    }

    final candidates = await aiModelRepo.getSupportingStep(stepId);
    if (candidates.isEmpty) return null;

    candidates.sort((a, b) => (b.capabilities.quality ?? 0).compareTo(a.capabilities.quality ?? 0));
    return candidates.firstOrNull;
  }
}
