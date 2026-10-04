import 'package:isar_community/isar.dart';

part 'ai_model_event.g.dart';

@collection
class AiModelEvent {
  Id id = Isar.autoIncrement;

  late String modelName;
  late String step;
  late DateTime timestamp;
  late String result;
  String? errorType;
  int? httpCode;
  String? message;
  int? durationMs;
  int? tokensIn;
  int? tokensOut;
  int? phrasesRequested;
  int? phrasesAccepted;
  int? jobId;
}
