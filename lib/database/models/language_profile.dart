import 'package:isar_community/isar.dart';

part 'language_profile.g.dart';

@collection
class LanguageProfile {
  Id id = Isar.autoIncrement;

  late String sourceLang;
  late String targetLang;
  String? dbName;

  bool isActive = false;
  DateTime? createdAt;
  DateTime? lastOpenedAt;
}
