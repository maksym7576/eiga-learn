import 'package:isar_community/isar.dart';

part 'job.g.dart';

@collection
class Job {
  Id id = Isar.autoIncrement;

  late int videoId;
  late String modelName;
  String? pipelineId;
  late String status;
  late String phase;
  List<String> executionPlan = [];
  List<String> completedSteps = [];
  String? currentStep;
  List<int> phraseOrders = [];
  bool isAuto = false;
  int processedPhrases = 0;
  int totalPhrases = 0;
  int stageProcessedPhrases = 0;
  int stageTotalPhrases = 0;
  String? errorMessage;
  DateTime? startedAt;
  DateTime? finishedAt;

  String? kind;
  String? mode;
  int? priority;
  DateTime? createdAt;
  DateTime? lastActivityAt;
  String? pipelineVersion;
  String? resumeFromStep;
  int? parentJobId;
  String? errorType;
  String? transcriptionLanguage;
  int? attempt;
}
