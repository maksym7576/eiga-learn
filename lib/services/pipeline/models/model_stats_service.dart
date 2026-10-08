import 'package:eiga/data/repositories/ai_model_event_repository.dart';
import 'package:eiga/data/repositories/ai_model_daily_stat_repository.dart';
import 'package:eiga/data/repositories/ai_model_score_repository.dart';
import 'package:eiga/database/models/ai_model_event.dart';

class ModelStatsService {
  ModelStatsService({
    required this.eventRepo,
    required this.statRepo,
    required this.scoreRepo,
  });

  final AiModelEventRepository eventRepo;
  final AiModelDailyStatRepository statRepo;
  final AiModelScoreRepository scoreRepo;

  Future<void> recordEvent({
    required String modelName,
    required String stepId,
    required String result,
    String? errorType,
    int? httpCode,
    String? message,
    int? durationMs,
    int? tokensIn,
    int? tokensOut,
    int? phrasesRequested,
    int? phrasesAccepted,
    int? jobId,
    int? attempt,
    int? batchSize,
  }) async {
    final event = AiModelEvent()
      ..modelName = modelName
      ..step = stepId
      ..timestamp = DateTime.now()
      ..result = result
      ..errorType = errorType
      ..httpCode = httpCode
      ..message = message
      ..durationMs = durationMs
      ..tokensIn = tokensIn ?? 0
      ..tokensOut = tokensOut ?? 0
      ..phrasesRequested = phrasesRequested ?? 0
      ..phrasesAccepted = phrasesAccepted ?? 0
      ..jobId = jobId
      ..attempt = attempt
      ..batchSize = batchSize;

    await eventRepo.save(event);

    await statRepo.upsertIncrement(
      modelName,
      stepId,
      success: result == 'success',
      tokensIn: tokensIn ?? 0,
      tokensOut: tokensOut ?? 0,
      durationMs: durationMs ?? 0,
      phrasesRequested: phrasesRequested ?? 0,
      phrasesAccepted: phrasesAccepted ?? 0,
    );
  }

  Future<void> cleanupOlderThan(DateTime date) async {
    await eventRepo.deleteOlderThan(date);
    await statRepo.deleteOlderThan(date);
  }
}
