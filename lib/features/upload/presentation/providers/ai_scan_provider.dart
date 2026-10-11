import 'dart:io';
import 'dart:math' as math;
import 'dart:developer' as developer;
import 'package:path_provider/path_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/database/embedded/subtitle_scan.dart';
import 'package:eiga/services/api/jimaku_service.dart';
import 'package:eiga/core/config/app_config.dart';
import '../../../../services/depaker/subtitle_depacker_service.dart';
import '../../../../services/depaker/season_episode_parser.dart';
import '../../../../features/upload/domain/models/jimaku_metadata_models.dart';
import 'subtitles_upload_provider.dart';
import 'package:eiga/database/dtos/basic_phrase_dto.dart';
import 'package:eiga/database/dtos/subtitle_version_result_dto.dart';
import 'package:eiga/database/dtos/audio_segment_config_dto.dart';
import 'upload_match_provider.dart';

import 'package:eiga/services/audio_extraction_service.dart';
import 'package:eiga/services/speech_vad_service.dart';
import 'package:eiga/services/subtitle_aligner.dart';
import 'package:eiga/services/ai_padding_provider.dart';

class AiScanState {
  final bool isScanning;
  final double scanProgress;
  final bool scanCompleted;
  final List<SubtitleScan> vadResults;
  final List<SubtitleVersionResult> subtitleVersions;
  final int selectedVersionIndex;
  final List<AudioSegmentConfig> calculatedSegments;

  /// Відхилення оптимального зсуву в кожному аудіо-вікні від загального (мс).
  /// Якщо значення великі — субтитри "пливуть" (інша нарізка / fps).
  final List<int> blockDeltasMs;
  final int currentSegmentIndex;
  final int totalSegments;
  final String statusMessage;
  final String? errorMessage;

  const AiScanState({
    this.isScanning = false,
    this.scanProgress = 0.0,
    this.scanCompleted = false,
    this.vadResults = const [],
    this.subtitleVersions = const [],
    this.selectedVersionIndex = 0,
    this.calculatedSegments = const [],
    this.blockDeltasMs = const [],
    this.currentSegmentIndex = 0,
    this.totalSegments = 0,
    this.statusMessage = '',
    this.errorMessage,
  });

  AiScanState copyWith({
    bool? isScanning,
    double? scanProgress,
    bool? scanCompleted,
    List<SubtitleScan>? vadResults,
    List<SubtitleVersionResult>? subtitleVersions,
    int? selectedVersionIndex,
    List<AudioSegmentConfig>? calculatedSegments,
    List<int>? blockDeltasMs,
    int? currentSegmentIndex,
    int? totalSegments,
    String? statusMessage,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AiScanState(
      isScanning: isScanning ?? this.isScanning,
      scanProgress: scanProgress ?? this.scanProgress,
      scanCompleted: scanCompleted ?? this.scanCompleted,
      vadResults: vadResults ?? this.vadResults,
      subtitleVersions: subtitleVersions ?? this.subtitleVersions,
      selectedVersionIndex: selectedVersionIndex ?? this.selectedVersionIndex,
      calculatedSegments: calculatedSegments ?? this.calculatedSegments,
      blockDeltasMs: blockDeltasMs ?? this.blockDeltasMs,
      currentSegmentIndex: currentSegmentIndex ?? this.currentSegmentIndex,
      totalSegments: totalSegments ?? this.totalSegments,
      statusMessage: statusMessage ?? this.statusMessage,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

class _Candidate {
  final String name;
  final String source;
  final String path;
  const _Candidate(this.name, this.source, this.path);
}

class AiScanNotifier extends Notifier<AiScanState> {
  static const int _windowSeconds = 100;
  static const List<double> _windowFractions = [0.15, 0.35, 0.55, 0.75];

  @override
  AiScanState build() => const AiScanState();

  void setSelectedVersionIndex(int index) {
    state = state.copyWith(selectedVersionIndex: index);
    if (index >= 0 && index < state.subtitleVersions.length) {
      final selected = state.subtitleVersions[index];
      ref.read(subtitlesUploadProvider.notifier).setAlignShift(selected.offsetMs);
    }
  }

  Future<void> runAiScan({
    String? videoPath,
    Duration? videoDuration,
    AppConfig? appConfig,
  }) async {
    if (videoPath == null || videoPath.isEmpty) {
      state = state.copyWith(
        isScanning: false,
        errorMessage: 'Немає шляху до відео для аналізу аудіо',
      );
      return;
    }

    state = const AiScanState(
      isScanning: true,
      scanProgress: 0.02,
      statusMessage: 'Підготовка аудіо-аналізу...',
    );

    try {
      // 1. Аудіо -> точки мовлення (один раз для всіх кандидатів).
      final windows = await _analyzeAudio(videoPath, videoDuration);
      if (windows.where((w) => w.speech.length >= 5).isEmpty) {
        throw Exception('У вибраних фрагментах відео не знайдено мовлення');
      }

      // 2. Кандидати-субтитри.
      state = state.copyWith(scanProgress: 0.6, statusMessage: 'Отримання субтитрів...');
      final candidates = await _loadCandidates();
      if (candidates.isEmpty) {
        throw Exception('Не знайдено жодного файлу субтитрів для перевірки');
      }

      // 3. Порівняння кожного файлу з аудіо.
      final depacker = SubtitleDepackerService();
      final results = <SubtitleVersionResult>[];
      AlignmentResult? bestAlignment;
      int bestConf = -1;

      for (var i = 0; i < candidates.length; i++) {
        final c = candidates[i];
        state = state.copyWith(
          scanProgress: 0.65 + 0.3 * (i / candidates.length),
          statusMessage: 'Звірка таймінгів: ${c.name}',
        );
        try {
          // ВАЖЛИВО: parseSrtPreview має повертати ВСІ фрази, а не тільки прев'ю.
          final phrases = await depacker.parseSrtPreview(filePath: c.path, language: 'ja');
          final subs = _toIntervals(phrases);
          if (subs.length < 10) continue;

          final r = alignSubtitles(windows: windows, subtitles: subs);
          developer.log(
            '${c.name}: offset=${r.offsetMs} conf=${r.confidence} '
            'peak=${r.peakScore.toStringAsFixed(3)} z=${r.zScore.toStringAsFixed(1)} '
            'drift=${r.driftMs}',
            name: 'AiScan',
          );
          results.add(SubtitleVersionResult(
            name: c.name,
            source: c.source,
            confidence: r.confidence,
            offsetMs: r.offsetMs,
          ));
          if (r.confidence > bestConf) {
            bestConf = r.confidence;
            bestAlignment = r;
          }
        } catch (e) {
          developer.log('Skip ${c.name}: $e', name: 'AiScan');
        }
      }

      if (results.isEmpty) {
        throw Exception('Не вдалося розібрати жоден файл субтитрів');
      }

      results.sort((a, b) => b.confidence.compareTo(a.confidence));
      final top = results.first;

      String status;
      final shiftStr = top.offsetMs == 0
          ? '0s'
          : '${top.offsetMs > 0 ? '+' : '-'}${(top.offsetMs.abs() / 1000.0).toStringAsFixed(1)}s';
      final driftStr = '${((bestAlignment?.driftMs ?? 0) / 1000.0).toStringAsFixed(1)}s';

      if (top.confidence < 35) {
        status = 'Не вдалося надійно вирівняти (${top.confidence}%) — перевір вручну';
      } else if (bestAlignment != null && bestAlignment.driftMs > 600) {
        status = 'Зсув $shiftStr, але таймінги "пливуть" ($driftStr) — можлива інша нарізка відео';
      } else {
        status = 'Готово: зсув $shiftStr, впевненість ${top.confidence}%';
      }

      state = state.copyWith(
        isScanning: false,
        scanProgress: 1.0,
        scanCompleted: true,
        subtitleVersions: results,
        selectedVersionIndex: 0,
        blockDeltasMs: bestAlignment?.windowDeltasMs ?? const [],
        statusMessage: status,
        clearError: true,
      );

      ref.read(subtitlesUploadProvider.notifier).setAlignShift(top.offsetMs);

      try {
        final topCandidate = candidates.firstWhere((c) => c.name == top.name, orElse: () => candidates.first);
        final phrases = await depacker.parseSrtPreview(filePath: topCandidate.path, language: 'ja');
        final rec = await ref.read(aiPaddingProvider.notifier).analyze(
          phrases: phrases,
          shiftMs: top.offsetMs,
          windows: windows,
        );
        if (rec != null) {
          ref.read(subtitlesUploadProvider.notifier).applyAiPadding(rec);
        }
      } catch (_) {}
    } catch (e) {
      developer.log('AI scan failed: $e', name: 'AiScan');
      state = state.copyWith(
        isScanning: false,
        scanCompleted: false,
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
        statusMessage: 'Помилка сканування',
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Аудіо: вирізаємо кілька вікон по ~100 с з різних місць відео і шукаємо мовлення.
  // ---------------------------------------------------------------------------
  Future<List<AudioWindow>> _analyzeAudio(String videoPath, Duration? videoDuration) async {
    final totalSec = (videoDuration != null && videoDuration.inSeconds > 0)
        ? videoDuration.inSeconds
        : 1440;
    final fractions = totalSec < 300 ? const [0.5] : _windowFractions;
    final winLen = math.min(_windowSeconds, totalSec ~/ 3);

    final tmp = await getTemporaryDirectory();
    const extractor = AudioExtractionService();
    final vad = SpeechVadService();

    final windows = <AudioWindow>[];
    final segments = <AudioSegmentConfig>[];
    final scans = <SubtitleScan>[];

    state = state.copyWith(totalSegments: fractions.length, currentSegmentIndex: 0);

    for (var i = 0; i < fractions.length; i++) {
      final startSec = math.min((totalSec * fractions[i]).floor(), totalSec - winLen);
      state = state.copyWith(
        currentSegmentIndex: i + 1,
        scanProgress: 0.05 + 0.5 * (i / fractions.length),
        statusMessage: 'Аналіз аудіо ${i + 1}/${fractions.length}...',
      );

      final wavPath = '${tmp.path}/eiga_scan_$i.wav';
      try {
        final out = await extractor.extractAudioSegment(
          videoPath: videoPath,
          outputPath: wavPath,
          startSeconds: startSec,
          durationSeconds: winLen,
        );
        if (out == null) continue;

        final speech = await vad.detectSpeech(wavPath: out);
        windows.add(AudioWindow(
          startMs: startSec * 1000,
          lengthMs: winLen * 1000,
          speech: speech,
        ));
        segments.add(AudioSegmentConfig(
          startTimeSeconds: startSec,
          endTimeSeconds: startSec + winLen,
          paddedStartSeconds: startSec,
          paddedEndSeconds: startSec + winLen,
          segmentIndex: i,
        ));
        for (final iv in speech) {
          scans.add(SubtitleScan()
            ..startTime = startSec * 1000 + iv.startMs
            ..endTime = startSec * 1000 + iv.endMs
            ..confidence = 1.0);
        }
      } finally {
        try {
          final f = File(wavPath);
          if (await f.exists()) await f.delete();
        } catch (_) {}
      }
    }

    state = state.copyWith(calculatedSegments: segments, vadResults: scans);
    return windows;
  }

  // ---------------------------------------------------------------------------
  // Субтитри: локальний файл (якщо вибрано) або файли з Jimaku.
  // ---------------------------------------------------------------------------
  Future<List<_Candidate>> _loadCandidates() async {
    final upload = ref.read(subtitlesUploadProvider);
    if (upload.localFilePath != null) {
      return [
        _Candidate(upload.selectedFile ?? 'Local subtitle', 'Local', upload.localFilePath!),
      ];
    }

    final entry = ref.read(uploadMatchProvider).selectedMedia?.rawMetadata;
    if (entry == null) return const [];

    final service = await JimakuService.create();
    int? jimakuId = entry.jimakuId ?? int.tryParse(entry.sourceId);
    if (jimakuId == null && entry.anilistId != null) {
      try {
        final found = await service.searchJumakuObjects(anilistId: entry.anilistId);
        if (found.isNotEmpty) jimakuId = int.tryParse(found.first.sourceId);
      } catch (_) {}
    }
    if (jimakuId == null) return const [];

    final selectedEp = upload.selectedEpisode ?? 1;
    List<FileJimakuDTO> rawFiles;
    try {
      rawFiles = await service.getFiles(jimakuId, episode: selectedEp);
    } catch (_) {
      rawFiles = await service.getFiles(jimakuId);
    }

    final episodeFiles = rawFiles.where((f) {
      final parsed = parseSeasonEpisode(f.name);
      final epNum = int.tryParse(parsed.episode ?? '');
      return epNum == null || epNum == selectedEp;
    }).toList();
    final filesToEval = episodeFiles.isNotEmpty ? episodeFiles : rawFiles;

    final out = <_Candidate>[];
    for (final file in filesToEval.take(6)) {
      try {
        final path = await service.downloadAndCacheFile(file.url, preferredName: file.name);
        out.add(_Candidate(file.name, 'Jimaku', path));
      } catch (e) {
        developer.log('Download failed ${file.name}: $e', name: 'AiScan');
      }
    }
    return out;
  }

  List<SpeechInterval> _toIntervals(List<BasicPhraseDto> phrases) {
    final epoch = DateTime(1970, 1, 1);
    final raw = <SpeechInterval>[];
    for (final p in phrases) {
      final s = p.startTime.difference(epoch).inMilliseconds;
      final e = p.endTime.difference(epoch).inMilliseconds;
      if (e > s) raw.add(SpeechInterval(s, e));
    }
    // Той самий поріг склейки, що і в VAD — сигнали стають порівнюваними.
    return mergeIntervals(raw, maxGapMs: 250);
  }

  void reset() {
    state = const AiScanState();
  }
}

final aiScanProvider = NotifierProvider<AiScanNotifier, AiScanState>(() {
  return AiScanNotifier();
});
