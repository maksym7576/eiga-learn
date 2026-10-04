import 'package:isar_community/isar.dart';

part 'align_group.g.dart';

@embedded
class AlignGroup {
  int? groupId;
  List<int> sourcePositions = [];
  List<int> targetPositions = [];
  String? kind;
}
