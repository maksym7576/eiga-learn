import 'package:isar_community/isar.dart';
import '../embedded/reading_item.dart';
import '../embedded/lemma_form.dart';
import '../embedded/sync_meta.dart';

part 'lemma.g.dart';

@collection
class Lemma {
  Id id = Isar.autoIncrement;

  late String key;
  List<ReadingItem> versions = [];
  String? posTag;
  String? jlptLevel;
  List<LemmaForm> forms = [];
  List<String> synonymKeys = [];
  List<String> antonymKeys = [];

  late SyncMeta sync;
}
