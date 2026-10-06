class ProcessingCardDto {
  const ProcessingCardDto({
    required this.id,
    required this.titleKey,
    required this.descriptionKey,
    required this.designVariant,
    required this.tagKey,
    this.isDefault = false,
  });

  final String id;
  final String titleKey;
  final String descriptionKey;
  final String designVariant; // 'gemini' або 'jumaku'
  final String tagKey;
  final bool isDefault;
}
