import 'subtitle_processing_config_dto.dart';

class LanguageDto {
  late String code;
  late String name;
  late String subtitle;

  Map<String, String>? translations; // Словник перекладів прикріплений до мови
  SubtitleProcessingConfigDto? processingConfig;
}
