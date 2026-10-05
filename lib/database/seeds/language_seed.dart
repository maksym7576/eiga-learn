import '../dtos/language_dto.dart';
import 'subtitle_processing_seed.dart';
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
      ..processingConfig = SubtitleProcessingSeed.japaneseConfig,
    LanguageDto()
      ..code = 'en'
      ..name = 'English'
      ..subtitle = 'United States'
      ..translations = enTranslations
      ..processingConfig = SubtitleProcessingSeed.englishConfig,
    LanguageDto()
      ..code = 'uk'
      ..name = 'Ukrainian'
      ..subtitle = 'Українська'
      ..translations = ukTranslations
      ..processingConfig = SubtitleProcessingSeed.ukrainianConfig,
    LanguageDto()
      ..code = 'es'
      ..name = 'Spanish'
      ..subtitle = 'Español'
      ..translations = null // Приклад, коли локалізації у файлі немає
      ..processingConfig = SubtitleProcessingSeed.spanishConfig,
  ];
}
