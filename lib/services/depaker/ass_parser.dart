import 'subtitle_phrase.dart';

class AssParser {
  final bool removeAllSpaces;

  AssParser({this.removeAllSpaces = false});

  /// Parses ASS content and groups phrases into clean language streams (e.g. Japanese, Chinese)
  Map<String, List<SubtitlePhrase>> parseMultiStream(String content, int videoId) {
    final Map<String, List<_DialogueGroup>> streamGroupsMap = {};

    final lines = content
        .split(RegExp(r'\r?\n'))
        .map((l) => l.trim())
        .where((l) => l.startsWith('Dialogue:'))
        .toList();

    for (final line in lines) {
      final raw = _parseDialogueLine(line);
      if (raw == null) continue;

      final streamName = _categorizeStyle(raw.style);
      if (streamName == 'Staff/Title') continue;

      streamGroupsMap.putIfAbsent(streamName, () => []);
      final groups = streamGroupsMap[streamName]!;

      if (groups.isNotEmpty &&
          groups.last.start == raw.start &&
          groups.last.end == raw.end) {
        groups.last.texts.add(raw.text);
      } else {
        groups.add(_DialogueGroup(streamName, raw.start, raw.end, [raw.text]));
      }
    }

    final Map<String, List<SubtitlePhrase>> result = {};
    for (final entry in streamGroupsMap.entries) {
      final streamName = entry.key;
      final groups = entry.value;
      groups.sort((a, b) => _parseTime(a.start).compareTo(_parseTime(b.start)));
      final phrases = <SubtitlePhrase>[];
      int order = 1;

      for (final group in groups) {
        final phrase = _toPhrase(group, videoId, order);
        if (phrase != null) {
          phrases.add(phrase);
          order++;
        }
      }

      if (phrases.isNotEmpty) {
        result[streamName] = phrases;
      }
    }

    return result;
  }

  String _categorizeStyle(String style) {
    final upper = style.toUpperCase();
    if (upper.contains('TITLE') || upper.contains('STAFF') || upper.contains('SCREEN') || upper == 'AN7') {
      return 'Staff/Title';
    }
    if (upper.contains('CN') || upper.contains('CHS') || upper.contains('CHT') || upper.contains('CNI') || upper.contains('TC') || upper.contains('ZH')) {
      return 'Chinese';
    }
    return 'Japanese';
  }

  List<SubtitlePhrase> parse(String content, int videoId) {
    final multi = parseMultiStream(content, videoId);
    if (multi.isEmpty) return [];

    final targetStream = multi['Japanese'] ?? multi.values.first;
    return targetStream;
  }

  _RawDialogue? _parseDialogueLine(String line) {
    final data = line.substring(9).trim();
    final parts = data.split(',');
    if (parts.length < 10) return null;

    final style = parts[3].trim();
    final startRaw = parts[1].trim();
    final endRaw = parts[2].trim();
    final rawText = parts.sublist(9).join(',');

    var cleanText = rawText.replaceAll(RegExp(r'\{[^}]*\}'), '');
    cleanText = cleanText.replaceAll(RegExp(r'<[^>]*>'), '');
    cleanText = cleanText.replaceAll(RegExp(r'\\[Nn]'), ' ').trim();
    
    if (cleanText.isEmpty) return null;

    return _RawDialogue(style, startRaw, endRaw, cleanText);
  }

  SubtitlePhrase? _toPhrase(_DialogueGroup group, int videoId, int order) {
    final text = _processText(group.texts.join(' '));
    if (text.isEmpty) return null;

    return SubtitlePhrase(
      videoId: videoId,
      phraseOrder: order,
      originalPhrase: text,
      startTime: _parseTime(group.start),
      endTime: _parseTime(group.end),
    );
  }

  String _processText(String text) {
    var cleanText = text.replaceAll(RegExp(r'<[^>]*>'), '');

    if (removeAllSpaces) {
      final latinMatch = RegExp(r'[a-zA-Z]').allMatches(cleanText).length;
      final totalChars = cleanText.replaceAll(RegExp(r'\s+'), '').length;
      
      if (totalChars > 0 && (latinMatch / totalChars) > 0.5) {
        return cleanText.replaceAll(RegExp(r'\s+'), ' ').trim();
      }
      return cleanText.replaceAll(RegExp(r'\s+'), '');
    }
    return cleanText.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  DateTime _parseTime(String raw) {
    final m = RegExp(r'(\d+):(\d{2}):(\d{2})\.(\d+)').firstMatch(raw.trim());
    if (m == null) return DateTime(1970);

    var msStr = m.group(4)!;
    int ms;

    if (msStr.length == 2) {
      ms = int.parse(msStr) * 10;
    } else if (msStr.length == 1) {
      ms = int.parse(msStr) * 100;
    } else {
      ms = int.parse(msStr.substring(0, 3));
    }

    return DateTime(
      1970, 1, 1,
      int.parse(m.group(1)!),
      int.parse(m.group(2)!),
      int.parse(m.group(3)!),
      ms,
    );
  }
}

class _RawDialogue {
  final String style;
  final String start;
  final String end;
  final String text;

  _RawDialogue(this.style, this.start, this.end, this.text);
}

class _DialogueGroup {
  final String style;
  final String start;
  final String end;
  final List<String> texts;

  _DialogueGroup(this.style, this.start, this.end, this.texts);
}
