import '../../data/repositories/job_repository.dart';
import '../../data/repositories/phrase_repository.dart';
import '../../database/models/job.dart';
import 'definitions/pipeline_registry.dart';
import 'execution/job_scheduler.dart';
import 'planning/batch_request.dart';
import 'planning/planner.dart';

class PipelineService {
  PipelineService({
    required this.planner,
    required this.jobRepo,
    required this.phraseRepo,
    required this.scheduler,
  });

  final Planner planner;
  final JobRepository jobRepo;
  final PhraseRepository phraseRepo;
  final JobScheduler scheduler;

  Future<void> requestObserve(int videoId, int positionMs) async {
    const pipelineId = PipelineRegistry.defaultPipelineId;
    final request = BatchRequest(
      videoId: videoId,
      pipelineId: pipelineId,
      mode: PlanningMode.observe,
      playerPositionMs: positionMs,
      priority: 1,
    );

    final pipeline = PipelineRegistry.getPipeline(pipelineId);
    if (pipeline == null || pipeline.stepIds.isEmpty) return;
    final firstStepId = pipeline.stepIds.first;
    final batches = await planner.planBatches(request, firstStepId);

    for (final batch in batches) {
      final job = Job()
        ..videoId = videoId
        ..modelName = 'default'
        ..kind = 'translation'
        ..mode = 'observe'
        ..pipelineId = pipelineId
        ..phraseOrders = batch.map((p) => p.phraseOrder).toList()
        ..status = 'queued'
        ..phase = 'observe'
        ..createdAt = DateTime.now()
        ..lastActivityAt = DateTime.now()
        ..priority = 1;

      await jobRepo.save(job);
    }
  }

  Future<void> translateAll(int videoId) async {
    const pipelineId = PipelineRegistry.defaultPipelineId;
    final request = BatchRequest(
      videoId: videoId,
      pipelineId: pipelineId,
      mode: PlanningMode.all,
      priority: 0,
    );

    final pipeline = PipelineRegistry.getPipeline(pipelineId);
    if (pipeline == null || pipeline.stepIds.isEmpty) return;
    final firstStepId = pipeline.stepIds.first;
    final batches = await planner.planBatches(request, firstStepId);

    for (final batch in batches) {
      final job = Job()
        ..videoId = videoId
        ..modelName = 'default'
        ..kind = 'translation'
        ..mode = 'all'
        ..pipelineId = pipelineId
        ..phraseOrders = batch.map((p) => p.phraseOrder).toList()
        ..status = 'queued'
        ..phase = 'all'
        ..createdAt = DateTime.now()
        ..lastActivityAt = DateTime.now()
        ..priority = 0;

      await jobRepo.save(job);
    }
  }

  Future<void> retryPhrase(int phraseId) async {
    final phrase = await phraseRepo.getById(phraseId);
    if (phrase == null) return;

    final job = Job()
      ..videoId = phrase.videoId
      ..modelName = 'default'
      ..kind = 'translation'
      ..mode = 'retry'
      ..pipelineId = PipelineRegistry.defaultPipelineId
      ..phraseOrders = [phrase.phraseOrder]
      ..status = 'queued'
      ..phase = 'retry'
      ..createdAt = DateTime.now()
      ..lastActivityAt = DateTime.now()
      ..priority = 5;

    await jobRepo.save(job);
  }

  Future<void> rerender(int videoId, List<int> phraseIds) async {
    final phrases = await phraseRepo.getByIds(phraseIds);
    final job = Job()
      ..videoId = videoId
      ..modelName = 'default'
      ..kind = 'translation'
      ..mode = 'rerender'
      ..pipelineId = PipelineRegistry.defaultPipelineId
      ..phraseOrders = phrases.map((p) => p.phraseOrder).toList()
      ..status = 'queued'
      ..phase = 'rerender'
      ..createdAt = DateTime.now()
      ..lastActivityAt = DateTime.now()
      ..priority = 5;

    await jobRepo.save(job);
  }

  Future<void> startTranscription(int videoId, String language) async {
    final job = Job()
      ..videoId = videoId
      ..modelName = 'default'
      ..kind = 'transcription'
      ..mode = 'all'
      ..pipelineId = 'transcription_v1'
      ..transcriptionLanguage = language
      ..phraseOrders = []
      ..status = 'queued'
      ..phase = 'transcription'
      ..createdAt = DateTime.now()
      ..lastActivityAt = DateTime.now()
      ..priority = 10;

    await jobRepo.save(job);
  }

  Future<void> cancel(int videoId) async {
    final activeJobs = await jobRepo.getActiveForVideo(videoId);
    for (final j in activeJobs) {
      j.status = 'cancelled';
      await jobRepo.save(j);
    }
  }
}
