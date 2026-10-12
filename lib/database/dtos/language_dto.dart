import 'package:flutter/material.dart';
import 'subtitle_processing_config_dto.dart';
import 'processing_card_dto.dart';

class LanguageDto {
  late String code;
  late String name;
  late String subtitle;

  TextDirection textDirection = TextDirection.ltr;
  bool hasWordSpaces = true;

  Map<String, String>? translations; // Словник перекладів прикріплений до мови
  SubtitleProcessingConfigDto? processingConfig;
  List<ProcessingCardDto>? processingCards; // Список доступних рушіїв обробки для цієї мови
}
