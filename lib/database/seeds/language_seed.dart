import '../dtos/language_dto.dart';
import 'subtitle_processing_seed.dart';
import 'processing_card_seed.dart';
import '../../core/localization/translations/en_translations.dart';
import '../../core/localization/translations/uk_translations.dart';
import '../../core/localization/translations/ja_translations.dart';

class LanguageSeed {
  static final List<LanguageDto> languages = [
    LanguageDto()
      ..code = 'ja'
      ..name = 'Japanese'
      ..subtitle = '日本語'
      ..translations = jaTranslations
      ..processingConfig = SubtitleProcessingSeed.japaneseConfig
      ..processingCards = ProcessingCardSeed.japaneseCards,
    LanguageDto()
      ..code = 'en'
      ..name = 'English'
      ..subtitle = 'United States'
      ..translations = enTranslations
      ..processingConfig = SubtitleProcessingSeed.englishConfig
      ..processingCards = ProcessingCardSeed.defaultGeminiCard,
    LanguageDto()
      ..code = 'uk'
      ..name = 'Ukrainian'
      ..subtitle = 'Українська'
      ..translations = ukTranslations
      ..processingConfig = SubtitleProcessingSeed.ukrainianConfig
      ..processingCards = ProcessingCardSeed.defaultGeminiCard,
    LanguageDto()
      ..code = 'es'
      ..name = 'Spanish'
      ..subtitle = 'Español'
      ..translations = null // Приклад, коли локалізації у файлі немає
      ..processingConfig = SubtitleProcessingSeed.spanishConfig
      ..processingCards = ProcessingCardSeed.defaultGeminiCard,
  ];
}
