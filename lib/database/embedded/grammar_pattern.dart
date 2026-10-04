import 'package:isar_community/isar.dart';

part 'grammar_pattern.g.dart';

@embedded
class GrammarPattern {
  List<String> versions = [];
  String? title;
  String? level;
  String? explain;
  List<String> covers = [];
}
