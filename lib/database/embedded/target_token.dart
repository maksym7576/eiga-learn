import 'package:isar_community/isar.dart';

part 'target_token.g.dart';

@embedded
class TargetToken {
  int? pos;
  String? text;
  bool isInferred = false;
}
