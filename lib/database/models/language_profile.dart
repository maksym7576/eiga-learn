import 'package:isar_community/isar.dart';

part 'language_profile.g.dart';

@collection
class LanguageProfile {
  Id id = Isar.autoIncrement;

  String? sourceLang;
  String? targetLang;
  String? dbName;
  String? readingOptions;
  String? spacingOption;
  String? tokenizationMethod;
  String? defaultModelName;
  bool isActive = false;
  DateTime? createdAt;
  DateTime? lastOpenedAt;
}
