// lib/services/subtitle_service.dart
import 'dart:io';
import 'dart:developer' as developer;
import '../models/subtitle_object.dart';

class SubtitleService {
  List<SubtitleObject> parseSrtFile(String filePath) {
    try {
      final file = File(filePath);
      developer.log('parseSrtFile: checking file $filePath', name: 'SubtitleService');
      if (!file.existsSync()) {
        developer.log('SRT file not found: $filePath', name: 'SubtitleService', level: 900);
        return [];
      }
      final content = file.readAsStringSync();
      developer.log('SRT file read OK, length=${content.length}', name: 'SubtitleService');
      return _parseSrtContent(content);
    } catch (e, st) {
      developer.log('Error parsing SRT file: $e', name: 'SubtitleService', error: e, stackTrace: st);
      return [];
    }
  }

  List<SubtitleObject> _parseSrtContent(String content) {
    final List<SubtitleObject> subtitles = [];
    final blocks = content.trim().split(RegExp(r'\r?\n\r?\n'));
    developer.log('Found ${blocks.length} blocks in SRT content', name: 'SubtitleService');
    for (final block in blocks) {
      final lines = block.trim().split(RegExp(r'\r?\n'));
      if (lines.length >= 3) {
        try {
          final index = int.tryParse(lines[0].trim());
          final timeRange = lines[1];
          final text = lines.sublist(2).join('\n');
          final times = timeRange.split(' --> ');
          if (times.length == 2) {
            final start = _parseTime(times[0]);
            final end = _parseTime(times[1]);
            subtitles.add(SubtitleObject(index: index, startTime: start, endTime: end, text: text));
          }
        } catch (e, st) {
          developer.log('Error parsing block: $e; block="$block"', name: 'SubtitleService', error: e, stackTrace: st);
          continue;
        }
      } else {
        developer.log('Skipping block with <3 lines: ${lines.length}', name: 'SubtitleService');
      }
    }
    developer.log('Parsed ${subtitles.length} subtitles', name: 'SubtitleService');
    return subtitles;
  }

  Duration _parseTime(String timeString) {
    final parts = timeString.trim().split(':');
    final hours = int.parse(parts[0]);
    final minutes = int.parse(parts[1]);
    final secondsAndMillis = parts[2].split(',');
    final seconds = int.parse(secondsAndMillis[0]);
    final milliseconds = int.parse(secondsAndMillis[1]);
    return Duration(hours: hours, minutes: minutes, seconds: seconds, milliseconds: milliseconds);
  }

  List<SubtitleObject> updateActiveSubtitle(List<SubtitleObject> subtitles, Duration? currentPosition) {
    if (currentPosition == null) {
      developer.log('updateActiveSubtitle: currentPosition is null', name: 'SubtitleService');
      return subtitles.map((s) => s.copyWith(isActive: false)).toList();
    }
    return subtitles.map((subtitle) {
      final isActive = (subtitle.startTime != null && subtitle.endTime != null) &&
          (currentPosition >= subtitle.startTime! && currentPosition <= subtitle.endTime!);
      return subtitle.copyWith(isActive: isActive);
    }).toList();
  }
}
