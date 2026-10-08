import 'package:eiga/data/repositories/video_repository.dart';
import 'package:eiga/database/models/job.dart';
import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/services/pipeline/definitions/pipeline_registry.dart';
import 'package:eiga/services/pipeline/models/model_selector.dart';
import 'package:eiga/services/pipeline/models/model_stats_service.dart';
import 'package:eiga/services/pipeline/policy/failure_type.dart';
import 'package:eiga/services/pipeline/policy/retry_policy.dart';
import 'package:eiga/services/pipeline/steps/step_catalog.dart';
import 'package:eiga/services/pipeline/execution/phrase_progress_service.dart';
import 'step_context.dart';
import 'step_outcome.dart';

class Runner {
  Runner({
    required this.videoRepo,
    required this.modelSelector,
    required this.statsService,
    required this.progressService,
    required this.retryPolicy,
  });

  final VideoRepository videoRepo;
  final ModelSelector modelSelector;
  final ModelStatsService statsService;
  final PhraseProgressService progressService;
  final RetryPolicy retryPolicy;

  Future<StepOutcome> runJob(Job job, List<Phrase> batchPhrases) async {
    final pipeline = PipelineRegistry.getPipeline(job.pipelineId);
    final video = await videoRepo.getById(job.videoId);
    if (video == null) {
      return StepOutcome.failure(failureType: FailureType.unknown, errorMessage: 'Video not found');
    }

    String? currentStepId = job.resumeFromStep;
    if (currentStepId == null) {
      for (final stepId in pipeline.stepIds) {
        final stepDef = StepCatalog.get(stepId);
        if (stepDef != null && batchPhrases.any((p) => !stepDef.isDone(p))) {
          currentStepId = stepId;
          break;
        }
      }
    }

    if (currentStepId == null) {
      return StepOutcome.success(acceptedPhrasesCount: batchPhrases.length);
    }

    final stepDef = StepCatalog.get(currentStepId);
    if (stepDef == null) {
      return StepOutcome.failure(failureType: FailureType.unknown, errorMessage: 'Step definition not found: $currentStepId');
    }

    final model = await modelSelector.selectModelForStep(currentStepId);
    if (model == null) {
      return StepOutcome.failure(failureType: FailureType.noApiKey, errorMessage: 'No enabled model found for step $currentStepId');
    }

    int attempt = job.attempt ?? 1;
    bool success = false;
    StepOutcome? finalOutcome;

    while (!success && attempt <= 3) {
      final stopwatch = Stopwatch()..start();
      try {
        for (final phrase in batchPhrases) {
          await progressService.markStarted(phrase.id, currentStepId, modelName: model.name, jobId: job.id);
        }

        final stepContext = StepContext(
          video: video,
          phrases: batchPhrases,
          previousResults: {},
          runningGlossary: video.researchInformation?.glossary ?? [],
        );

        final prompt = await stepDef.buildPrompt(stepContext);
        final rawResponse = simulatedAiCall(prompt);

        int accepted = 0;
        for (final phrase in batchPhrases) {
          final outcome = await stepDef.parseAndApply(phrase, rawResponse);
          if (outcome.isSuccess) {
            accepted++;
            await progressService.markCompleted(phrase.id, currentStepId);
          } else {
            await progressService.markFailed(phrase.id, currentStepId, errorType: outcome.failureType?.toString(), errorMessage: outcome.errorMessage);
          }
        }

        stopwatch.stop();
        await statsService.recordEvent(
          modelName: model.name,
          stepId: currentStepId,
          result: accepted == batchPhrases.length ? 'success' : 'partial',
          durationMs: stopwatch.elapsedMilliseconds,
          phrasesRequested: batchPhrases.length,
          phrasesAccepted: accepted,
          jobId: job.id,
          attempt: attempt,
          batchSize: batchPhrases.length,
        );

        success = true;
        finalOutcome = StepOutcome.success(acceptedPhrasesCount: accepted);
      } catch (e, st) {
        stopwatch.stop();
        final failureType = parseFailureType('exception', 500, e.toString());
        await statsService.recordEvent(
          modelName: model.name,
          stepId: currentStepId,
          result: 'error',
          errorType: failureType.toString(),
          message: e.toString(),
          durationMs: stopwatch.elapsedMilliseconds,
          jobId: job.id,
          attempt: attempt,
          batchSize: batchPhrases.length,
        );

        final action = retryPolicy.decide(failureType: failureType, attempt: attempt, batchSize: batchPhrases.length);
        if (action == RetryAction.stop) {
          for (final phrase in batchPhrases) {
            await progressService.markFailed(phrase.id, currentStepId, errorType: failureType.toString(), errorMessage: e.toString());
          }
          return StepOutcome.failure(failureType: failureType, errorMessage: e.toString());
        } else if (action == RetryAction.splitBatch && batchPhrases.length > 1) {
          final mid = batchPhrases.length ~/ 2;
          await runJob(job, batchPhrases.sublist(0, mid));
          await runJob(job, batchPhrases.sublist(mid));
          return StepOutcome.success(acceptedPhrasesCount: batchPhrases.length);
        }
        attempt++;
        job.attempt = attempt;
      }
    }

    return finalOutcome ?? StepOutcome.failure(failureType: FailureType.unknown, errorMessage: 'Max retries exceeded');
  }

  String simulatedAiCall(String prompt) {
    return '{}';
  }
}
