import 'package:isar_community/isar.dart';

part 'source_token.g.dart';

@embedded
class SourceToken {
  int? pos;
  String? wordId;
  bool isPunct = false;
  List<String> versions = [];
  String? lemmaKey;
  String? posTag;
  String? grammarCode;
  String? role;
  String? meaning;
}
