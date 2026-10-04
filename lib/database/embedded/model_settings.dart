import 'package:isar_community/isar.dart';

part 'model_settings.g.dart';

@embedded
class ModelSettings {
  int? overrideLimit;
  int? overrideDailyLimit;
  int? overridePhrasesPerRequest;
  bool? overrideStreaming;
}
