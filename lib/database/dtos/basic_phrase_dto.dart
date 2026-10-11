class BasicPhraseDto {
  final int videoId;
  final int phraseOrder;
  final String originalPhrase;
  final String? translatedPhrase;
  final DateTime startTime;
  final DateTime endTime;

  const BasicPhraseDto({
    required this.videoId,
    required this.phraseOrder,
    required this.originalPhrase,
    this.translatedPhrase,
    required this.startTime,
    required this.endTime,
  });
}

typedef BasicPhraseDTO = BasicPhraseDto;
typedef BasecPhraseDTO = BasicPhraseDto;
typedef SubtitlePhrase = BasicPhraseDto;
