import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../../database/dtos/basic_phrase_dto.dart';
import 'ass_parser.dart';
import 'srt_parser.dart';

enum SubtitleDepackMode {
  raw,
  hideParentheses,
}

class SubtitleDepackerService {
  Future<List<SubtitlePhrase>> parseSrtPreview({
    required String filePath,
    required String language,
    int videoId = 0,
    SubtitleDepackMode mode = SubtitleDepackMode.raw,
    bool hideParentheses = false,
  }) async {
    final effectiveMode = hideParentheses ? SubtitleDepackMode.hideParentheses : mode;
    final streams = await parseMultiStreamPreview(
      filePath: filePath,
      language: language,
      videoId: videoId,
      mode: effectiveMode,
    );
    if (streams.isEmpty) return [];
    return streams.values.first;
  }

  Future<Map<String, List<SubtitlePhrase>>> parseMultiStreamPreview({
    required String filePath,
    required String language,
    int videoId = 0,
    SubtitleDepackMode mode = SubtitleDepackMode.raw,
    bool hideParentheses = false,
  }) async {
    final effectiveMode = hideParentheses ? SubtitleDepackMode.hideParentheses : mode;
    String fileContent = await _readFile(filePath);
    if (fileContent.isEmpty) return {};

    final removeAllSpaces = language.toLowerCase().contains('ja') || language.toLowerCase().contains('zh');
    final isAss = filePath.toLowerCase().endsWith('.ass');

    Map<String, List<SubtitlePhrase>> rawStreams;

    if (isAss) {
      rawStreams = await compute(_parseAssMultiStreamInIsolate, _SubtitleParseInput(
        content: fileContent,
        videoId: videoId,
        removeAllSpaces: removeAllSpaces,
        isAss: true,
      ));
    } else {
      final phrases = await compute(_parseSrtInIsolate, _SubtitleParseInput(
        content: fileContent,
        videoId: videoId,
        removeAllSpaces: removeAllSpaces,
        isAss: false,
      ));
      rawStreams = {'Default SRT': phrases};
    }

    final Map<String, List<SubtitlePhrase>> processedStreams = {};
    rawStreams.forEach((streamName, phrasesList) {
      final merged = mergePhraseCues(phrasesList);
      processedStreams[streamName] = applyDepackingOptions(merged, mode: effectiveMode, streamName: streamName);
    });

    return processedStreams;
  }

  static List<SubtitlePhrase> applyDepackingOptions(
    List<SubtitlePhrase> phrases, {
    SubtitleDepackMode mode = SubtitleDepackMode.raw,
    String streamName = 'Default',
  }) {
    if (mode == SubtitleDepackMode.raw) {
      return phrases;
    }

    return phrases.map((p) {
      final text = p.originalPhrase;
      final isFullyBracketed = (text.startsWith('(') && text.endsWith(')')) ||
          (text.startsWith('[') && text.endsWith(']')) ||
          (text.startsWith('{') && text.endsWith('}')) ||
          (text.startsWith('（') && text.endsWith('）')) ||
          (text.startsWith('［') && text.endsWith('］')) ||
          (text.startsWith('｛') && text.endsWith('｝'));

      if (isFullyBracketed) {
        return p;
      }

      final cleaned = removeBracketsRecursive(text);
      
      return SubtitlePhrase(
        videoId: p.videoId,
        phraseOrder: p.phraseOrder,
        originalPhrase: cleaned,
        translatedPhrase: p.translatedPhrase,
        startTime: p.startTime,
        endTime: p.endTime,
      );
    }).toList();
  }

  static String removeBracketsRecursive(String input) {
    String res = input;
    final regex = RegExp(r'[\(\[\{（［｛][^\)\]\}）］｝]*[\)\]\}）］｝]');
    while (regex.hasMatch(res)) {
      res = res.replaceAll(regex, '');
    }
    res = res.replaceAll(RegExp(r'[\)\]\}）］｝]+'), '');
    res = res.replaceAll(RegExp(r'[\(\[\{（［｛]+'), '');
    return res.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  Future<String> _readFile(String path) async {
    final file = File(path);
    if (!file.existsSync()) return '';
    try {
      return await file.readAsString(encoding: utf8);
    } catch (_) {
      try {
        return await file.readAsString(encoding: Encoding.getByName('shift-jis') ?? latin1);
      } catch (e) {
        return '';
      }
    }
  }

  static String _normalize(String raw) {
    return raw
        .replaceAll(RegExp(r'\\N', caseSensitive: false), ' ')
        .replaceAll(RegExp(r'[\r\n]+'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  static List<SubtitlePhrase> mergePhraseCues(List<SubtitlePhrase> phrases) {
    if (phrases.isEmpty) return [];

    final sorted = [...phrases]..sort((a, b) => a.startTime.compareTo(b.startTime));
    final List<SubtitlePhrase> result = [];

    SubtitlePhrase cur = sorted.first;
    String curClean = _normalize(cur.originalPhrase);

    void flush() {
      if (curClean.isNotEmpty) {
        result.add(SubtitlePhrase(
          videoId: cur.videoId,
          phraseOrder: result.length + 1,
          originalPhrase: curClean,
          translatedPhrase: cur.translatedPhrase,
          startTime: cur.startTime,
          endTime: cur.endTime,
        ));
      }
    }

    for (int i = 1; i < sorted.length; i++) {
      final next = sorted[i];
      final clean = _normalize(next.originalPhrase);

      final bool isDuplicate = clean == curClean;
      final bool isExtension = clean.isNotEmpty && curClean.isNotEmpty &&
          (clean.startsWith(curClean) || curClean.startsWith(clean));

      final bool isAdjacent = (next.startTime.difference(cur.endTime)).inMilliseconds.abs() <= 400;

      if (isAdjacent && (isDuplicate || isExtension)) {
        final endTime = next.endTime.isAfter(cur.endTime) ? next.endTime : cur.endTime;
        final startTime = next.startTime.isBefore(cur.startTime) ? next.startTime : cur.startTime;
        if (clean.length > curClean.length) curClean = clean;
        cur = SubtitlePhrase(
          videoId: cur.videoId,
          phraseOrder: cur.phraseOrder,
          originalPhrase: curClean,
          translatedPhrase: cur.translatedPhrase,
          startTime: startTime,
          endTime: endTime,
        );
      } else {
        flush();
        cur = next;
        curClean = clean;
      }
    }
    flush();

    result.sort((a, b) => a.startTime.compareTo(b.startTime));

    return result;
  }

  static Map<String, List<SubtitlePhrase>> _parseAssMultiStreamInIsolate(_SubtitleParseInput input) {
    return AssParser(removeAllSpaces: input.removeAllSpaces).parseMultiStream(input.content, input.videoId);
  }

  static List<SubtitlePhrase> _parseSrtInIsolate(_SubtitleParseInput input) {
    return SrtParser(removeAllSpaces: input.removeAllSpaces).parse(input.content, input.videoId);
  }
}

class _SubtitleParseInput {
  final String content;
  final int videoId;
  final bool removeAllSpaces;
  final bool isAss;

  _SubtitleParseInput({
    required this.content,
    required this.videoId,
    required this.removeAllSpaces,
    required this.isAss,
  });
}
