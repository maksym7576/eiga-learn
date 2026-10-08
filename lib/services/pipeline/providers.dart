import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../database/isar_service.dart';
import '../../data/repositories/job_repository.dart';
import '../../data/repositories/phrase_repository.dart';
import '../../data/repositories/video_repository.dart';
import '../../data/repositories/ai_model_repository.dart';
import '../../data/repositories/ai_model_score_repository.dart';
import '../../data/repositories/ai_model_daily_stat_repository.dart';
import '../../data/repositories/ai_model_event_repository.dart';
import '../../data/repositories/step_model_preference_repository.dart';
import '../../database/models/job.dart';
import '../../shared/providers/language_profile_providers.dart';

import 'execution/job_scheduler.dart';
import 'execution/job_service.dart';
import 'execution/phrase_progress_service.dart';
import 'execution/runner.dart';
import 'models/model_selector.dart';
import 'models/model_stats_service.dart';
import 'planning/planner.dart';
import 'policy/retry_policy.dart';
import 'recovery/recovery_service.dart';
import 'pipeline_service.dart';

final jobRepoProvider = Provider((ref) => JobRepository(ref.watch(isarProvider)));
final phraseRepoProvider = Provider((ref) => PhraseRepository(ref.watch(isarProvider)));
final videoRepoProvider = Provider((ref) => VideoRepository(ref.watch(isarProvider)));
final aiModelRepoProvider = Provider((ref) => AiModelRepository(ref.watch(metaIsarProvider)));
final scoreRepoProvider = Provider((ref) => AiModelScoreRepository(ref.watch(metaIsarProvider)));
final statRepoProvider = Provider((ref) => AiModelDailyStatRepository(ref.watch(metaIsarProvider)));
final eventRepoProvider = Provider((ref) => AiModelEventRepository(ref.watch(metaIsarProvider)));
final stepPrefRepoProvider = Provider((ref) => StepModelPreferenceRepository(ref.watch(metaIsarProvider)));

final phraseProgressServiceProvider = Provider((ref) => PhraseProgressService(ref.watch(phraseRepoProvider)));
final jobServiceProvider = Provider((ref) => JobService(ref.watch(jobRepoProvider)));

final modelSelectorProvider = Provider((ref) => ModelSelector(
      aiModelRepo: ref.watch(aiModelRepoProvider),
      scoreRepo: ref.watch(scoreRepoProvider),
      statRepo: ref.watch(statRepoProvider),
      preferenceRepo: ref.watch(stepPrefRepoProvider),
    ));

final modelStatsServiceProvider = Provider((ref) => ModelStatsService(
      eventRepo: ref.watch(eventRepoProvider),
      statRepo: ref.watch(statRepoProvider),
      scoreRepo: ref.watch(scoreRepoProvider),
    ));

final retryPolicyProvider = Provider((ref) => RetryPolicy(ref.watch(modelStatsServiceProvider)));

final plannerProvider = Provider((ref) => Planner(
      phraseRepo: ref.watch(phraseRepoProvider),
      modelSelector: ref.watch(modelSelectorProvider),
    ));

final runnerProvider = Provider((ref) => Runner(
      videoRepo: ref.watch(videoRepoProvider),
      modelSelector: ref.watch(modelSelectorProvider),
      statsService: ref.watch(modelStatsServiceProvider),
      progressService: ref.watch(phraseProgressServiceProvider),
      retryPolicy: ref.watch(retryPolicyProvider),
    ));

final jobSchedulerProvider = Provider((ref) {
  final scheduler = JobScheduler(
    jobRepo: ref.watch(jobRepoProvider),
    phraseRepo: ref.watch(phraseRepoProvider),
    runner: ref.watch(runnerProvider),
  );
  scheduler.start();
  ref.onDispose(() => scheduler.stop());
  return scheduler;
});

final recoveryServiceProvider = Provider((ref) => RecoveryService(
      jobRepo: ref.watch(jobRepoProvider),
      phraseProgressService: ref.watch(phraseProgressServiceProvider),
    ));

final pipelineServiceProvider = Provider((ref) => PipelineService(
      planner: ref.watch(plannerProvider),
      jobRepo: ref.watch(jobRepoProvider),
      phraseRepo: ref.watch(phraseRepoProvider),
      scheduler: ref.watch(jobSchedulerProvider),
    ));

final activeJobsStreamProvider = StreamProvider<List<Job>>((ref) {
  final jobRepo = ref.watch(jobRepoProvider);
  return jobRepo.watchActive();
});
