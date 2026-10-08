import 'package:isar_community/isar.dart';

part 'step_model_preference.g.dart';

@collection
class StepModelPreference {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String stepId;

  String? modelName;
  bool isAuto = true;
}
