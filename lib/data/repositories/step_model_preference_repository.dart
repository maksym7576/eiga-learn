import 'package:isar_community/isar.dart';
import '../../database/models/step_model_preference.dart';
import 'base_repository.dart';

class StepModelPreferenceRepository extends BaseRepository<StepModelPreference> {
  StepModelPreferenceRepository(super.isar);

  @override
  IsarCollection<StepModelPreference> get collection => isar.stepModelPreferences;

  Future<StepModelPreference?> getForStep(String stepId) async {
    return await isar.stepModelPreferences.filter().stepIdEqualTo(stepId).findFirst();
  }

  Future<void> setForStep(String stepId, String? modelName, {bool isAuto = true}) async {
    await isar.writeTxn(() async {
      var pref = await isar.stepModelPreferences.filter().stepIdEqualTo(stepId).findFirst();
      if (pref == null) {
        pref = StepModelPreference()
          ..stepId = stepId;
      }
      pref.modelName = modelName;
      pref.isAuto = isAuto;
      await isar.stepModelPreferences.put(pref);
    });
  }
}
