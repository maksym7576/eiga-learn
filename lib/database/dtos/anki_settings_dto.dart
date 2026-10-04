import 'package:isar_community/isar.dart';

part 'anki_settings_dto.g.dart';

@embedded
class AnkiSettingsDto {
  String connectUrl = 'http://localhost:8765';
  String deckName = 'Eiga';
  String noteType = 'Basic';
}
