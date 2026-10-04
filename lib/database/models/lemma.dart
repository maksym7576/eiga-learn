import 'package:isar_community/isar.dart';
import '../embedded/lemma_form.dart';
import '../embedded/sync_meta.dart';

part 'lemma.g.dart';

@collection
class Lemma {
  Id id = Isar.autoIncrement;

  late String key;
  List<String> versions = [];
  String? posTag;
  List<LemmaForm> forms = [];
  List<String> synonymKeys = [];
  List<String> antonymKeys = [];

  late SyncMeta sync;
}
