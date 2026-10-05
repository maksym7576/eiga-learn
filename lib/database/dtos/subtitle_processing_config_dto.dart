import 'package:isar_community/isar.dart';

part 'subtitle_processing_config_dto.g.dart';

@embedded
class SubtitleProcessingConfigDto {
  bool isSupported = false;
  bool removeAllSpaces = false;
  bool tokenizeWithAi = false;

  List<String> readingOptions = [];
  List<String> readingLabels = [];
  List<String> spacingOptions = [];
}
