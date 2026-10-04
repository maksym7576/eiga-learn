import 'package:isar_community/isar.dart';
import '../embedded/reading_item.dart';
import '../embedded/usage_form.dart';

part 'lemma_usage.g.dart';

@collection
class LemmaUsage {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String usageKey; // lemmaKey#videoId
  late String lemmaKey;
  late int videoId;

  List<UsageForm> forms = [];
  int occurrences = 0;
  List<int> samplePhraseIds = [];
}
