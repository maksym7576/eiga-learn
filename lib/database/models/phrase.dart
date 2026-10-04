import 'package:isar_community/isar.dart';
import '../embedded/stage_entry.dart';
import '../embedded/source_token.dart';
import '../embedded/target_token.dart';
import '../embedded/align_group.dart';
import '../embedded/grammar_pattern.dart';
import '../embedded/sync_meta.dart';

part 'phrase.g.dart';

@collection
class Phrase {
  Id id = Isar.autoIncrement;

  late int videoId;
  late int phraseOrder;

  late int startTime;
  late int endTime;

  late String originalText;
  String? translatedText;

  List<StageEntry> stages = [];

  List<SourceToken> sourceTokens = [];
  List<TargetToken> targetTokens = [];

  List<AlignGroup> groups = [];
  List<GrammarPattern> patterns = [];

  List<String> lemmaKeys = [];

  late SyncMeta sync;
}
