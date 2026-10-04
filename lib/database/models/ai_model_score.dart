import 'package:isar_community/isar.dart';
import '../embedded/score_components.dart';
import '../embedded/score_history_entry.dart';

part 'ai_model_score.g.dart';

@collection
class AiModelScore {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String key; // modelName#step
  late String modelName;
  late String step;
  double score = 0.0;
  late ScoreComponents components;
  int sampleSize = 0;
  int? windowDays;
  late int algorithmVersion;
  late DateTime computedAt;
  List<ScoreHistoryEntry> history = [];
}
