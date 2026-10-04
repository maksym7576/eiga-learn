import 'package:isar_community/isar.dart';

part 'model_capabilities.g.dart';

@embedded
class ModelCapabilities {
  int? quality;
  int? speed;
  int? contextWindow;
  int? maxOutputTokens;
  bool supportsStreaming = false;
  bool supportsJsonMode = false;
  bool supportsSystemPrompt = true;
  List<String> supportedInputs = [];
  List<String> supportedSteps = [];
  double? inputPricePerMTok;
  double? outputPricePerMTok;
  int? tpmLimit;
  int? defaultLimit;
  int? defaultDailyLimit;
  int? defaultPhrasesPerRequest;
  bool? defaultStreaming;
}
