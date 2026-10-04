import 'package:isar_community/isar.dart';

part 'batch_settings_dto.g.dart';

@embedded
class BatchSettingsDto {
  int numberOfPhrases = 40;
  int batchSizeTranslate = 70;
  int batchSizeTokenize = 70;
  int batchSizeMorphemes = 70;
  int batchSizeGrammarRole = 70;
  int audioChunkDurationMinutes = 3;
  int transcriptionOverlapSeconds = 10;
  bool autoTranslateOnImport = false;
}
