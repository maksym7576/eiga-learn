import 'package:isar_community/isar.dart';
import '../dtos/subtitle_settings_dto.dart';
import '../dtos/batch_settings_dto.dart';
import '../dtos/anki_settings_dto.dart';

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

  SubtitleSettingsDto subtitleSettings = SubtitleSettingsDto();
  BatchSettingsDto batchSettings = BatchSettingsDto();
  AnkiSettingsDto ankiSettings = AnkiSettingsDto();
}
