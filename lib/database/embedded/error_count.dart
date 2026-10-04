import 'package:isar_community/isar.dart';

part 'error_count.g.dart';

@embedded
class ErrorCount {
  late String errorType;
  int count = 0;
}
