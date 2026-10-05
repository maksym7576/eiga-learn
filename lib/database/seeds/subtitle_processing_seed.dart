import '../dtos/subtitle_processing_config_dto.dart';

class SubtitleProcessingSeed {
  static final SubtitleProcessingConfigDto japaneseConfig =
      SubtitleProcessingConfigDto()
        ..isSupported = true
        ..removeAllSpaces = true
        ..tokenizeWithAi = false
        ..readingOptions = ['original', 'kana', 'romaji']
        ..readingLabels = ['KANJI', 'KANA', 'ROMAJI']
        ..spacingOptions = ['romaji'];

  static final SubtitleProcessingConfigDto englishConfig =
      SubtitleProcessingConfigDto()
        ..isSupported = true
        ..removeAllSpaces = false
        ..tokenizeWithAi = false
        ..readingOptions = ['original']
        ..readingLabels = ['ORIGINAL']
        ..spacingOptions = ['original'];

  static final SubtitleProcessingConfigDto ukrainianConfig =
      SubtitleProcessingConfigDto()
        ..isSupported = true
        ..removeAllSpaces = false
        ..tokenizeWithAi = false
        ..readingOptions = ['original']
        ..readingLabels = ['ORIGINAL']
        ..spacingOptions = ['original'];

  static final SubtitleProcessingConfigDto spanishConfig =
      SubtitleProcessingConfigDto()
        ..isSupported = false
        ..removeAllSpaces = false
        ..tokenizeWithAi = false
        ..readingOptions = ['original']
        ..readingLabels = ['ORIGINAL']
        ..spacingOptions = ['original'];
}
