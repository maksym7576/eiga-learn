import 'package:eiga/data/repositories/phrase_repository.dart';
import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/services/pipeline/models/model_selector.dart';
import 'batch_request.dart';

class Planner {
  Planner({
    required this.phraseRepo,
    required this.modelSelector,
  });

  final PhraseRepository phraseRepo;
  final ModelSelector modelSelector;

  Future<List<List<Phrase>>> planBatches(BatchRequest request, String firstStepId) async {
    final allPhrases = await phraseRepo.getByVideo(request.videoId);
    final availablePhrases = allPhrases.where((p) => p.activeJobId == null).toList();

    List<Phrase> selected = [];

    switch (request.mode) {
      case PlanningMode.all:
        selected = availablePhrases.where((p) => !isPhraseComplete(p, firstStepId)).toList();
        break;
      case PlanningMode.observe:
        if (request.playerPositionMs != null) {
          final pos = request.playerPositionMs!;
          final activeIndex = availablePhrases.indexWhere((p) => p.startTime <= pos && p.endTime >= pos);
          final center = activeIndex >= 0 ? activeIndex : 0;
          final start = center;
          final end = (center + 15).clamp(0, availablePhrases.length);
          selected = availablePhrases.sublist(start, end).where((p) => !isPhraseComplete(p, firstStepId)).toList();
        } else {
          selected = availablePhrases.take(10).toList();
        }
        break;
      case PlanningMode.retry:
      case PlanningMode.rerender:
        if (request.targetPhraseIds != null) {
          selected = availablePhrases.where((p) => request.targetPhraseIds!.contains(p.id)).toList();
        }
        break;
    }

    if (selected.isEmpty) return [];

    int batchSize = 5;
    final model = await modelSelector.selectModelForStep(firstStepId);
    if (model?.capabilities.defaultPhrasesPerRequest != null) {
      batchSize = model!.capabilities.defaultPhrasesPerRequest!;
    }

    List<List<Phrase>> batches = [];
    for (int i = 0; i < selected.length; i += batchSize) {
      batches.add(selected.sublist(i, i + batchSize > selected.length ? selected.length : i + batchSize));
    }

    return batches;
  }

  bool isPhraseComplete(Phrase phrase, String stepId) {
    final stage = phrase.stages.where((s) => s.key == stepId).firstOrNull;
    return stage?.state == 'completed';
  }
}
