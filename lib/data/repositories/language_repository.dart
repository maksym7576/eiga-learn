import '../../database/dtos/language_dto.dart';
import '../../database/dtos/processing_card_dto.dart';
import '../../database/seeds/language_seed.dart';

class LanguageRepository {
  List<LanguageDto> getAllLanguages() {
    final list = List<LanguageDto>.from(LanguageSeed.languages);
    list.sort((a, b) => a.name.compareTo(b.name));
    return list;
  }

  List<LanguageDto> getLanguagesWithLocalization() {
    final list = LanguageSeed.languages
        .where((lang) => lang.translations != null && lang.translations!.isNotEmpty)
        .toList();
    list.sort((a, b) => a.name.compareTo(b.name));
    return list;
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

  /// Отримати картки обробки (рушії) для конкретної мови з фоллбеком на англійську
  List<ProcessingCardDto> getProcessingCardsForLanguage(String code) {
    final language = getLanguageByCode(code) ?? getLanguageByCode('en');
    return language?.processingCards ?? [];
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
