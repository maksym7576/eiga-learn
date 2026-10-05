import '../../data/repositories/language_repository.dart';
import '../../database/dtos/language_dto.dart';
import '../../database/dtos/subtitle_processing_config_dto.dart';

class LanguageProcessingService {
  final LanguageRepository languageRepository;

  LanguageProcessingService({
    LanguageRepository? languageRepository,
  }) : languageRepository = languageRepository ?? LanguageRepository();

  /// Збірний метод: Отримати список мов, які мають локалізацію
  List<LanguageDto> getLocalizedLanguages() {
    return languageRepository.getLanguagesWithLocalization();
  }

  /// Збірний метод: Отримати список мов, які мають власні інструкції по обробці субтитрів
  List<LanguageDto> getLanguagesForSubtitleProcessing() {
    return languageRepository.getLanguagesWithProcessingInstructions();
  }

  /// Збірний метод: Отримати конфігурацію обробки для конкретної мови за кодом
  SubtitleProcessingConfigDto? getProcessingConfigForLanguage(String code) {
    final language = languageRepository.getLanguageByCode(code);
    return language?.processingConfig;
  }

  /// Збірний метод: Загальна кількість всіх мов у базі/сіді
  int getTotalLanguagesCount() {
    return languageRepository.getAllLanguages().length;
  }
}
