import 'package:isar_community/isar.dart';
import '../embedded/sync_meta.dart';

part 'lemma_gloss.g.dart';

@collection
class LemmaGloss {
  Id id = Isar.autoIncrement;

  late String lemmaKey;
  late String lang;
  late String translation;
  bool isLexiconDone = false;

  late SyncMeta sync;
}
