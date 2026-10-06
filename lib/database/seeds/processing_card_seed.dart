import '../dtos/processing_card_dto.dart';

class ProcessingCardSeed {
  static const List<ProcessingCardDto> defaultGeminiCard = [
    ProcessingCardDto(
      id: 'gemini',
      titleKey: 'gemini_title',
      descriptionKey: 'gemini_desc',
      designVariant: 'gemini',
      tagKey: 'required_tag',
      isDefault: true,
    ),
  ];

  static const List<ProcessingCardDto> japaneseCards = [
    ProcessingCardDto(
      id: 'gemini',
      titleKey: 'gemini_title',
      descriptionKey: 'gemini_desc',
      designVariant: 'gemini',
      tagKey: 'required_tag',
      isDefault: true,
    ),
    ProcessingCardDto(
      id: 'jumaku',
      titleKey: 'jumaku_title',
      descriptionKey: 'jumaku_desc',
      designVariant: 'jumaku',
      tagKey: 'recommended_tag',
      isDefault: false,
    ),
  ];
}
