import 'package:isar_community/isar.dart';
import '../embedded/error_count.dart';

part 'ai_model_daily_stat.g.dart';

@collection
class AiModelDailyStat {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String key; // modelName#date#step
  late String modelName;
  late String date; // YYYY-MM-DD
  late String step;
  int requests = 0;
  int successCount = 0;
  int partialCount = 0;
  int errorCount = 0;
  List<ErrorCount> errorsByType = [];
  int phrasesRequested = 0;
  int phrasesAccepted = 0;
  int? avgDurationMs;
  int? maxDurationMs;
  int tokensIn = 0;
  int tokensOut = 0;
  double cost = 0.0;
  DateTime? quotaExhaustedAt;
}
