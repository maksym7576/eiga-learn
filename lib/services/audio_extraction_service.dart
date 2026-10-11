import 'dart:developer' as developer;
import 'package:ffmpeg_kit_flutter_new_audio/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new_audio/return_code.dart';
import 'package:eiga/database/dtos/audio_segment_config_dto.dart';

export 'package:eiga/database/dtos/audio_segment_config_dto.dart';

class AudioExtractionService {
  const AudioExtractionService();

  /// Extracts audio segment from video file to mono 16kHz WAV file using FFmpeg
  /// based on explicit instructions (start seconds and duration seconds).
  Future<String?> extractAudioSegment({
    required String videoPath,
    required String outputPath,
    required int startSeconds,
    required int durationSeconds,
  }) async {
    developer.log('AudioExtractionService: Extracting audio from $startSeconds s for $durationSeconds s', name: 'AudioExtractionService');

    final cmd = '-ss $startSeconds -i "$videoPath" -t $durationSeconds -vn -acodec pcm_s16le -ac 1 -ar 16000 -y "$outputPath"';

    final session = await FFmpegKit.execute(cmd);
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      developer.log('AudioExtractionService: Extracted audio to $outputPath', name: 'AudioExtractionService');
      return outputPath;
    } else {
      developer.log('AudioExtractionService: FFmpeg extraction failed with code $returnCode', name: 'AudioExtractionService');
      return null;
    }
  }
}
