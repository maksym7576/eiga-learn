import '../../database/dtos/language_dto.dart';
import '../../database/seeds/language_seed.dart';

class LanguageRepository {
  List<LanguageDto> getAllLanguages() {
    return LanguageSeed.languages;
  }

  List<LanguageDto> getLanguagesWithLocalization() {
    return LanguageSeed.languages
        .where((lang) => lang.translations != null && lang.translations!.isNotEmpty)
        .toList();
  }

  List<LanguageDto> getLanguagesWithProcessingInstructions() {
    return LanguageSeed.languages
        .where((lang) => lang.processingConfig != null && lang.processingConfig!.isSupported)
        .toList();
  }

  LanguageDto? getLanguageByCode(String code) {
    try {
      return LanguageSeed.languages.firstWhere(
        (l) => l.code.toLowerCase() == code.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }

  /// Отримати словник перекладів безпосередньо з DTO відповідної мови (з фоллбеком на англійську)
  Map<String, String> getTranslationsForCode(String code) {
    final language = getLanguageByCode(code);
    if (language?.translations != null) {
      return language!.translations!;
    }
    final englishLanguage = getLanguageByCode('en');
    return englishLanguage?.translations ?? {};
  }

  /// Метод репозиторію для отримання перекладу за ключем та кодом мови
  String translate(String code, String key) {
    final translations = getTranslationsForCode(code);
    return translations[key] ?? key;
  }
}
