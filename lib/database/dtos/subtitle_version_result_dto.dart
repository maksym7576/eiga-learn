class SubtitleVersionResultDto {
  final String name;
  final String source;
  final int confidence; // 0..100
  final int offsetMs;

  const SubtitleVersionResultDto({
    required this.name,
    required this.source,
    required this.confidence,
    required this.offsetMs,
  });
}

typedef SubtitleVersionResultDTO = SubtitleVersionResultDto;
typedef SubtitleVersionResult = SubtitleVersionResultDto;
