import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/services/api/jimaku_service.dart';
import 'package:eiga/features/upload/domain/models/jimaku_metadata_models.dart';
import 'package:eiga/features/upload/domain/models/jimaku_clustering_util.dart';
import 'package:eiga/services/depaker/subtitle_depacker_service.dart';
import 'package:eiga/database/dtos/basic_phrase_dto.dart';
import 'upload_match_provider.dart';

import 'package:eiga/services/depaker/season_episode_parser.dart';
import 'package:eiga/services/ai_padding_provider.dart';

enum SubtitleUploadMethod { ai, manual, video }

class SubtitlesUploadState {
  final SubtitleUploadMethod method;
  final int? selectedEpisode;
  final String? selectedFile;
  final String? localFilePath;
  final bool showMoreEpisodes;
  final bool isScanning;
  final double scanProgress;
  final bool scanCompleted;
  final int alignShiftMs;
  final int? aiPaddingMs;
  final int offsetMs;
  final bool fillGaps;
  final bool cleanBrackets;
  final bool aiApplied;

  // Manual / Jimaku cloud files state with clustering
  final List<FileJimakuDTO> rawFiles;
  final List<JimakuFileOrGroupDTO> files;
  final Set<String> expandedGroups;
  final bool isLoadingFiles;
  final String? errorMessage;

  // Parsed preview phrases
  final List<SubtitlePhrase> parsedPhrases;
  final bool isLoadingPreview;

  const SubtitlesUploadState({
    this.method = SubtitleUploadMethod.ai,
    this.selectedEpisode,
    this.selectedFile,
    this.localFilePath,
    this.showMoreEpisodes = false,
    this.isScanning = false,
    this.scanProgress = 0.0,
    this.scanCompleted = false,
    this.alignShiftMs = 0,
    this.aiPaddingMs,
    this.offsetMs = 0,
    this.fillGaps = false,
    this.cleanBrackets = false,
    this.aiApplied = false,
    this.rawFiles = const [],
    this.files = const [],
    this.expandedGroups = const {},
    this.isLoadingFiles = false,
    this.errorMessage,
    this.parsedPhrases = const [],
    this.isLoadingPreview = false,
  });

  bool get hasSelection => selectedEpisode != null || selectedFile != null || localFilePath != null;

  List<int> get availableEpisodes {
    if (rawFiles.isEmpty) {
      return List.generate(12, (i) => i + 1);
    }
    final eps = <int>{};
    for (final file in rawFiles) {
      final info = parseSeasonEpisode(file.name);
      if (info.episode != null) {
        final epNum = int.tryParse(info.episode!);
        if (epNum != null && epNum > 0) {
          eps.add(epNum);
        }
      }
    }
    if (eps.isEmpty) {
      return List.generate(12, (i) => i + 1);
    }
    final sorted = eps.toList()..sort();
    return sorted;
  }

  SubtitlesUploadState copyWith({
    SubtitleUploadMethod? method,
    int? selectedEpisode,
    bool? clearSelectedEpisode,
    String? selectedFile,
    bool? clearSelectedFile,
    String? localFilePath,
    bool? clearLocalFilePath,
    bool? showMoreEpisodes,
    bool? isScanning,
    double? scanProgress,
    bool? scanCompleted,
    int? alignShiftMs,
    int? aiPaddingMs,
    bool clearAiPaddingMs = false,
    int? offsetMs,
    bool? fillGaps,
    bool? cleanBrackets,
    bool? aiApplied,
    List<FileJimakuDTO>? rawFiles,
    List<JimakuFileOrGroupDTO>? files,
    Set<String>? expandedGroups,
    bool? isLoadingFiles,
    String? errorMessage,
    bool? clearErrorMessage,
    List<SubtitlePhrase>? parsedPhrases,
    bool? isLoadingPreview,
  }) {
    return SubtitlesUploadState(
      method: method ?? this.method,
      selectedEpisode: clearSelectedEpisode == true ? null : (selectedEpisode ?? this.selectedEpisode),
      selectedFile: clearSelectedFile == true ? null : (selectedFile ?? this.selectedFile),
      localFilePath: clearLocalFilePath == true ? null : (localFilePath ?? this.localFilePath),
      showMoreEpisodes: showMoreEpisodes ?? this.showMoreEpisodes,
      isScanning: isScanning ?? this.isScanning,
      scanProgress: scanProgress ?? this.scanProgress,
      scanCompleted: scanCompleted ?? this.scanCompleted,
      alignShiftMs: alignShiftMs ?? this.alignShiftMs,
      aiPaddingMs: clearAiPaddingMs == true ? null : (aiPaddingMs ?? this.aiPaddingMs),
      offsetMs: offsetMs ?? this.offsetMs,
      fillGaps: fillGaps ?? this.fillGaps,
      cleanBrackets: cleanBrackets ?? this.cleanBrackets,
      aiApplied: aiApplied ?? this.aiApplied,
      rawFiles: rawFiles ?? this.rawFiles,
      files: files ?? this.files,
      expandedGroups: expandedGroups ?? this.expandedGroups,
      isLoadingFiles: isLoadingFiles ?? this.isLoadingFiles,
      errorMessage: clearErrorMessage == true ? null : (errorMessage ?? this.errorMessage),
      parsedPhrases: parsedPhrases ?? this.parsedPhrases,
      isLoadingPreview: isLoadingPreview ?? this.isLoadingPreview,
    );
  }
}

class SubtitlesUploadNotifier extends Notifier<SubtitlesUploadState> {
  @override
  SubtitlesUploadState build() {
    return const SubtitlesUploadState();
  }

  void setMethod(SubtitleUploadMethod method) {
    state = state.copyWith(
      method: method,
      clearSelectedEpisode: true,
      clearSelectedFile: true,
      clearLocalFilePath: true,
      isScanning: false,
      scanCompleted: false,
      parsedPhrases: [],
      alignShiftMs: 0,
      clearAiPaddingMs: true,
    );
    if (method == SubtitleUploadMethod.manual && state.rawFiles.isEmpty) {
      fetchJimakuFiles();
    }
  }

  Future<void> pickLocalSubtitleFile() async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['srt', 'ass'],
      );
      if (result.isNotEmpty && result.single.path != null) {
        final path = result.single.path!;
        final name = result.single.name;
        state = state.copyWith(
          selectedFile: name,
          localFilePath: path,
          clearSelectedEpisode: true,
          isScanning: false,
          scanCompleted: false,
          alignShiftMs: 0,
          offsetMs: 0,
          fillGaps: false,
          aiApplied: false,
          clearAiPaddingMs: true,
        );
        await parsePreview(path);
      }
    } catch (_) {}
  }

  Future<void> selectFile(String fileName) async {
    state = state.copyWith(
      selectedFile: fileName,
      clearLocalFilePath: true,
      clearSelectedEpisode: true,
      isScanning: false,
      scanCompleted: false,
      alignShiftMs: 0,
      offsetMs: 0,
      fillGaps: false,
      aiApplied: false,
      clearAiPaddingMs: true,
    );

    final fileObj = state.rawFiles.where((f) => f.name == fileName).firstOrNull;
    if (fileObj != null && fileObj.url.isNotEmpty) {
      try {
        state = state.copyWith(isLoadingPreview: true);
        final service = await JimakuService.create();
        final cachedPath = await service.downloadAndCacheFile(fileObj.url, preferredName: fileObj.name);
        await parsePreview(cachedPath);
      } catch (e) {
        state = state.copyWith(isLoadingPreview: false);
      }
    }
  }

  Future<void> selectEpisode(int episode) async {
    state = state.copyWith(
      selectedEpisode: episode,
      clearSelectedFile: true,
      clearLocalFilePath: true,
      isScanning: false,
      scanCompleted: false,
      alignShiftMs: 0,
      offsetMs: 0,
      fillGaps: false,
      aiApplied: false,
      clearAiPaddingMs: true,
      isLoadingPreview: true,
    );

    try {
      if (state.rawFiles.isEmpty) {
        await fetchJimakuFiles();
      }

      List<FileJimakuDTO> candidateFiles = state.rawFiles.where((f) {
        final parsed = parseSeasonEpisode(f.name);
        final epNum = int.tryParse(parsed.episode ?? '');
        return epNum == episode;
      }).toList();

      if (candidateFiles.isEmpty && state.rawFiles.isNotEmpty) {
        candidateFiles = state.rawFiles;
      }

      final matchState = ref.read(uploadMatchProvider);
      final media = matchState.selectedMedia;
      int? jimakuId = media?.rawMetadata?.jimakuId ?? int.tryParse(media?.rawMetadata?.sourceId ?? '');

      if (candidateFiles.isEmpty && jimakuId != null) {
        final service = await JimakuService.create();
        try {
          final rawFiles = await service.getFiles(jimakuId, episode: episode);
          candidateFiles = rawFiles;
        } catch (_) {
          final rawFiles = await service.getFiles(jimakuId);
          candidateFiles = rawFiles.where((f) {
            final parsed = parseSeasonEpisode(f.name);
            final epNum = int.tryParse(parsed.episode ?? '');
            return epNum == episode;
          }).toList();
        }
      }

      if (candidateFiles.isNotEmpty) {
        final best = candidateFiles.first;
        final service = await JimakuService.create();
        final cachedPath = await service.downloadAndCacheFile(best.url, preferredName: best.name);
        state = state.copyWith(selectedFile: best.name);
        await parsePreview(cachedPath);
      } else {
        state = state.copyWith(isLoadingPreview: false, parsedPhrases: []);
      }
    } catch (_) {
      state = state.copyWith(isLoadingPreview: false, parsedPhrases: []);
    }
  }

  Future<void> parsePreview(String filePath) async {
    state = state.copyWith(isLoadingPreview: true);
    try {
      final depacker = SubtitleDepackerService();
      final phrases = await depacker.parseSrtPreview(
        filePath: filePath,
        language: 'ja',
      );
      phrases.sort((a, b) => a.startTime.compareTo(b.startTime));
      state = state.copyWith(parsedPhrases: phrases, isLoadingPreview: false);

      final rec = await ref.read(aiPaddingProvider.notifier).analyze(phrases: phrases);
      if (rec != null) {
        applyAiPadding(rec);
      }
    } catch (_) {
      state = state.copyWith(isLoadingPreview: false);
    }
  }

  Future<void> fetchJimakuFiles() async {
    state = state.copyWith(isLoadingFiles: true, clearErrorMessage: true);
    try {
      final matchState = ref.read(uploadMatchProvider);
      final media = matchState.selectedMedia;
      if (media == null) {
        state = state.copyWith(isLoadingFiles: false, rawFiles: [], files: []);
        return;
      }

      final entry = media.rawMetadata;
      final service = await JimakuService.create();

      int? jimakuId;
      if (entry != null) {
        if (entry.jimakuId != null) {
          jimakuId = entry.jimakuId;
        } else if (entry.linkUrl?.contains('jimaku.cc') == true) {
          jimakuId = int.tryParse(entry.sourceId);
        } else if (entry.anilistId != null) {
          try {
            final jimakuEntries = await service.searchJumakuObjects(anilistId: entry.anilistId);
            if (jimakuEntries.isNotEmpty) {
              jimakuId = int.tryParse(jimakuEntries.first.sourceId);
            }
          } catch (_) {}
        }
        if (jimakuId == null) {
          jimakuId = int.tryParse(entry.sourceId);
        }
      }

      if (jimakuId == null) {
        final results = await service.searchJumakuObjects(query: media.title);
        if (results.isNotEmpty) {
          jimakuId = int.tryParse(results.first.sourceId);
        }
      }

      if (jimakuId == null) {
        state = state.copyWith(isLoadingFiles: false, rawFiles: [], files: []);
        return;
      }

      final rawFiles = await service.getFiles(jimakuId);
      final groups = JimakuClusteringUtil.groupFiles(rawFiles);
      final flattened = JimakuClusteringUtil.flatten(groups, state.expandedGroups);

      state = state.copyWith(
        isLoadingFiles: false,
        rawFiles: rawFiles,
        files: flattened,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingFiles: false,
        errorMessage: 'Failed to load community files: $e',
      );
    }
  }

  void toggleGroup(String groupName) {
    final newExpanded = Set<String>.from(state.expandedGroups);
    if (newExpanded.contains(groupName)) {
      newExpanded.remove(groupName);
    } else {
      newExpanded.add(groupName);
    }

    final groups = JimakuClusteringUtil.groupFiles(state.rawFiles);
    final flattened = JimakuClusteringUtil.flatten(groups, newExpanded);

    state = state.copyWith(
      expandedGroups: newExpanded,
      files: flattened,
    );
  }

  void clearSelection() {
    state = state.copyWith(
      clearSelectedEpisode: true,
      clearSelectedFile: true,
      clearLocalFilePath: true,
      isScanning: false,
      scanCompleted: false,
      parsedPhrases: [],
      alignShiftMs: 0,
      clearAiPaddingMs: true,
    );
  }

  void toggleMoreEpisodes() {
    state = state.copyWith(showMoreEpisodes: !state.showMoreEpisodes);
  }

  void startAiScan() {
    state = state.copyWith(isScanning: true, scanProgress: 0.0, scanCompleted: false);
  }

  void updateScanProgress(double progress) {
    state = state.copyWith(scanProgress: progress);
    if (progress >= 1.0) {
      state = state.copyWith(isScanning: false, scanCompleted: true, aiApplied: true);
    }
  }

  void setAlignShift(int ms) {
    state = state.copyWith(alignShiftMs: ms);
  }

  void applyAiPadding(PaddingRecommendation r) {
    final untouched = state.offsetMs == 0 || state.aiApplied;
    state = state.copyWith(
      aiPaddingMs: r.paddingMs,
      offsetMs: untouched ? r.paddingMs : null,
      fillGaps: untouched ? r.fillGaps : null,
      aiApplied: untouched ? true : state.aiApplied,
    );
  }

  void setOffset(int ms) {
    state = state.copyWith(offsetMs: ms, aiApplied: ms == state.aiPaddingMs);
  }

  void toggleFillGaps() {
    state = state.copyWith(fillGaps: !state.fillGaps);
  }

  void toggleCleanBrackets() {
    state = state.copyWith(cleanBrackets: !state.cleanBrackets);
  }

  void applyAiRecommendation([int? ms]) {
    final padding = ms ?? state.aiPaddingMs ?? 200;
    state = state.copyWith(offsetMs: padding, aiApplied: true);
  }

  void reset() {
    state = const SubtitlesUploadState();
  }
}

final subtitlesUploadProvider =
    NotifierProvider<SubtitlesUploadNotifier, SubtitlesUploadState>(() {
  return SubtitlesUploadNotifier();
});
