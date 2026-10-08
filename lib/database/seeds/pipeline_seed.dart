import '../../data/repositories/job_repository.dart';
import '../../data/repositories/phrase_repository.dart';
import '../../database/models/job.dart';
import '../../database/models/phrase.dart';
import '../../database/embedded/stage_entry.dart';
import '../../database/embedded/sync_meta.dart';

class PipelineSeed {
  static Future<void> seedIfEmpty(JobRepository jobRepo, PhraseRepository phraseRepo, int videoId) async {
    final existingJobs = await jobRepo.getAll();
    if (existingJobs.isEmpty) {
      final job = Job()
        ..videoId = videoId
        ..modelName = 'Gemini 1.5 Pro'
        ..kind = 'translation'
        ..mode = 'all'
        ..pipelineId = 'context_translation_v1'
        ..status = 'processing'
        ..phase = 'translation'
        ..currentStep = 'translation'
        ..executionPlan = ['context', 'translation', 'tokenization', 'lemmatization', 'gloss']
        ..completedSteps = ['context']
        ..phraseOrders = [1, 2, 3]
        ..processedPhrases = 1
        ..totalPhrases = 3
        ..stageProcessedPhrases = 1
        ..stageTotalPhrases = 3
        ..createdAt = DateTime.now().subtract(const Duration(minutes: 2))
        ..lastActivityAt = DateTime.now()
        ..attempt = 1;

      await jobRepo.save(job);
    }

    final existingPhrases = await phraseRepo.getByVideo(videoId);
    if (existingPhrases.isEmpty) {
      final phrases = [
        Phrase()
          ..videoId = videoId
          ..phraseOrder = 1
          ..startTime = 0
          ..endTime = 3000
          ..originalVersions = []
          ..translatedPhrase = 'Привіт, світ!'
          ..stages = [
            StageEntry()
              ..key = 'context'
              ..state = 'completed'
              ..startedAt = DateTime.now().subtract(const Duration(minutes: 2))
              ..updatedAt = DateTime.now().subtract(const Duration(minutes: 1)),
            StageEntry()
              ..key = 'translation'
              ..state = 'completed'
              ..startedAt = DateTime.now().subtract(const Duration(minutes: 1))
              ..updatedAt = DateTime.now(),
          ]
          ..activeJobId = null
          ..hasProcessingStage = false
          ..sync = (SyncMeta()..syncId = 'p1'..ownerId = 'local'..isSynced = true..updatedAt = DateTime.now()),
        Phrase()
          ..videoId = videoId
          ..phraseOrder = 2
          ..startTime = 3000
          ..endTime = 6000
          ..originalVersions = []
          ..translatedPhrase = null
          ..stages = [
            StageEntry()
              ..key = 'context'
              ..state = 'completed'
              ..startedAt = DateTime.now().subtract(const Duration(minutes: 2))
              ..updatedAt = DateTime.now().subtract(const Duration(minutes: 1)),
            StageEntry()
              ..key = 'translation'
              ..state = 'processing'
              ..startedAt = DateTime.now()
              ..updatedAt = DateTime.now()
              ..attempts = 1
              ..modelName = 'Gemini 1.5 Pro'
              ..jobId = 1,
          ]
          ..activeJobId = 1
          ..hasProcessingStage = true
          ..sync = (SyncMeta()..syncId = 'p2'..ownerId = 'local'..isSynced = true..updatedAt = DateTime.now()),
      ];
      await phraseRepo.saveAll(phrases);
    }
  }
}
