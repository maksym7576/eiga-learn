import 'package:isar_community/isar.dart';
import '../../database/models/lemma_gloss.dart';
import 'base_repository.dart';

class LemmaGlossRepository extends BaseRepository<LemmaGloss> {
  LemmaGlossRepository(super.isar);

  @override
  IsarCollection<LemmaGloss> get collection => isar.lemmaGloss;

  Future<LemmaGloss?> getByLemmaAndLang(String lemmaKey, String lang) async {
    return await isar.lemmaGloss
        .filter()
        .lemmaKeyEqualTo(lemmaKey)
        .and()
        .langEqualTo(lang)
        .findFirst();
  }

  Future<List<String>> getMissing(List<String> lemmaKeys, String lang) async {
    final existing = await isar.lemmaGloss
        .filter()
        .langEqualTo(lang)
        .and()
        .anyOf(lemmaKeys, (q, key) => q.lemmaKeyEqualTo(key))
        .findAll();
    final existingKeys = existing.map((e) => e.lemmaKey).toSet();
    return lemmaKeys.where((k) => !existingKeys.contains(k)).toList();
  }
}
