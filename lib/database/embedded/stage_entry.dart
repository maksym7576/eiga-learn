import 'package:isar_community/isar.dart';

part 'stage_entry.g.dart';

@embedded
class StageEntry {
  String? key;
  String? state;
  DateTime? startedAt;
  DateTime? updatedAt;
  int? attempts;
  String? errorType;
  String? errorMessage;
  String? modelName;
  int? jobId;
}
