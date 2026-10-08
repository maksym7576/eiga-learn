import '../../data/repositories/lemma_repository.dart';
import '../../data/repositories/lemma_usage_repository.dart';
import '../../data/repositories/lemma_gloss_repository.dart';
import '../../database/models/lemma.dart';

class LemmaService {
  LemmaService({
    required this.lemmaRepo,
    required this.usageRepo,
    required this.glossRepo,
  });

  final LemmaRepository lemmaRepo;
  final LemmaUsageRepository usageRepo;
  final LemmaGlossRepository glossRepo;

  Future<void> processLemmas(List<Lemma> lemmas) async {
    for (final lemma in lemmas) {
      await lemmaRepo.upsertByKey(lemma);
    }
  }
}
