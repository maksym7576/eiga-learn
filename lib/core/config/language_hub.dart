import '../../database/dtos/language_dto.dart';

class LanguageHub {
  static final List<LanguageDto> supportedLanguages = [
    LanguageDto()
      ..name = 'Japanese'
      ..tokenizeWithAi = false,
    LanguageDto()
      ..name = 'English'
      ..tokenizeWithAi = false,
    LanguageDto()
      ..name = 'Spanish'
      ..tokenizeWithAi = false,
  ];

  static LanguageDto? getByName(String name) {
    try {
      return supportedLanguages.firstWhere(
        (l) => l.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }
}
