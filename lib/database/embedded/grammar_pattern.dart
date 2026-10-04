import 'package:isar_community/isar.dart';
import 'reading_item.dart';

part 'grammar_pattern.g.dart';

@embedded
class GrammarPattern {
  List<ReadingItem> versions = [];
  String? title;
  String? level; // N5..N1 або A1..C2 (будь-який рівень динамічно)
  String? explain;
  List<int> covers = [];
}
