import 'package:isar_community/isar.dart';
import 'reading_item.dart';

part 'usage_form.g.dart';

@embedded
class UsageForm {
  List<ReadingItem> versions = [];
  String? grammarCode;
  int count = 0;
}
