class AudioSegmentConfigDto {
  final int startTimeSeconds;
  final int endTimeSeconds;
  final int paddedStartSeconds;
  final int paddedEndSeconds;
  final int segmentIndex;

  const AudioSegmentConfigDto({
    required this.startTimeSeconds,
    required this.endTimeSeconds,
    required this.paddedStartSeconds,
    required this.paddedEndSeconds,
    required this.segmentIndex,
  });
}

typedef AudioSegmentConfigDTO = AudioSegmentConfigDto;
typedef AudioSegmentConfig = AudioSegmentConfigDto;
