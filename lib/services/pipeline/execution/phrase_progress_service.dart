import 'package:eiga/data/repositories/phrase_repository.dart';
import 'package:eiga/database/embedded/stage_entry.dart';

class PhraseProgressService {
  PhraseProgressService(this.phraseRepo);
  final PhraseRepository phraseRepo;

  Future<void> markStarted(
    int phraseId,
    String stepId, {
    String? modelName,
    int? jobId,
  }) async {
    final phrase = await phraseRepo.getById(phraseId);
    if (phrase == null) return;

    phrase.activeJobId = jobId;
    phrase.hasProcessingStage = true;

    var stage = phrase.stages.where((s) => s.key == stepId).firstOrNull;
    if (stage == null) {
      stage = StageEntry()..key = stepId;
      phrase.stages.add(stage);
    }

    stage.state = 'processing';
    stage.startedAt = DateTime.now();
    stage.updatedAt = DateTime.now();
    stage.attempts = (stage.attempts ?? 0) + 1;
    stage.modelName = modelName;
    stage.jobId = jobId;
    stage.errorType = null;
    stage.errorMessage = null;

    await phraseRepo.save(phrase);
  }

  Future<void> markCompleted(
    int phraseId,
    String stepId, {
    String? translatedPhrase,
  }) async {
    final phrase = await phraseRepo.getById(phraseId);
    if (phrase == null) return;

    if (translatedPhrase != null) {
      phrase.translatedPhrase = translatedPhrase;
    }

    var stage = phrase.stages.where((s) => s.key == stepId).firstOrNull;
    if (stage != null) {
      stage.state = 'completed';
      stage.updatedAt = DateTime.now();
    }

    final stillProcessing = phrase.stages.any((s) => s.state == 'processing');
    if (!stillProcessing) {
      phrase.activeJobId = null;
      phrase.hasProcessingStage = false;
    }

    await phraseRepo.save(phrase);
  }

  Future<void> markFailed(
    int phraseId,
    String stepId, {
    String? errorType,
    String? errorMessage,
  }) async {
    final phrase = await phraseRepo.getById(phraseId);
    if (phrase == null) return;

    var stage = phrase.stages.where((s) => s.key == stepId).firstOrNull;
    if (stage != null) {
      stage.state = 'failed';
      stage.updatedAt = DateTime.now();
      stage.errorType = errorType;
      stage.errorMessage = errorMessage;
    }

    phrase.activeJobId = null;
    phrase.hasProcessingStage = false;

    await phraseRepo.save(phrase);
  }

  Future<void> resetFrom(int phraseId, String stepId) async {
    final phrase = await phraseRepo.getById(phraseId);
    if (phrase == null) return;

    bool clear = false;
    for (final stage in phrase.stages) {
      if (stage.key == stepId) {
        clear = true;
      }
      if (clear) {
        stage.state = 'pending';
        stage.updatedAt = DateTime.now();
        stage.errorType = null;
        stage.errorMessage = null;
      }
    }

    phrase.activeJobId = null;
    phrase.hasProcessingStage = false;
    await phraseRepo.save(phrase);
  }
}
