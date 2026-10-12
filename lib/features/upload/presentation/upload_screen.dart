import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/shared/widgets/backgrounds/aurora_background.dart';
import 'package:eiga/shared/widgets/app_bar/app_top_bar.dart';
import 'package:eiga/shared/widgets/buttons/primary_gradient_button.dart';
import 'package:eiga/shared/player/active_player_provider.dart';
import 'package:eiga/database/models/video.dart';
import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/database/embedded/video_metadata.dart';
import 'package:eiga/database/embedded/sync_meta.dart';
import 'package:eiga/database/embedded/reading_item.dart';
import 'package:eiga/shared/providers/language_profile_providers.dart';
import 'package:eiga/services/depaker/subtitle_depacker_service.dart';
import 'package:eiga/services/depaker/season_episode_parser.dart';
import 'package:eiga/database/dtos/basic_phrase_dto.dart';
import 'upload_step_provider.dart';
import 'package:eiga/features/upload/domain/models/match_models.dart';
import 'providers/upload_match_provider.dart';
import 'providers/subtitles_upload_provider.dart';
import 'providers/ai_scan_provider.dart';
import 'sub_screens/upload_step_badge.dart';
import 'sub_screens/source_upload_sub_screen.dart';
import 'sub_screens/match_upload_sub_screen.dart';
import 'sub_screens/subtitles_upload_sub_screen.dart';

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  ConsumerState<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  String? _sizeText;
  String? _details;
  int? _videoBytes;
  List<Map<String, String>> _audioTracks = [];
  List<Map<String, String>> _subtitleTracks = [];
  int? _selectedAudio;
  int? _selectedSubtitle;

  void _clearAllUploadData() {
    ref.read(activePlayerProvider.notifier).clear();
    ref.read(uploadStepProvider.notifier).reset();
    ref.read(uploadMatchProvider.notifier).reset();
    ref.read(subtitlesUploadProvider.notifier).reset();
    ref.read(aiScanProvider.notifier).reset();
  }

  Future<void> _saveVideoAndPhrases() async {
    final playerState = ref.read(activePlayerProvider);
    final matchState = ref.read(uploadMatchProvider);
    final subtitlesState = ref.read(subtitlesUploadProvider);

    final videoPath = playerState.videoPath;
    final media = matchState.selectedMedia;
    final sourceId = matchState.selectedSubtitleSourceId;
    final isAiTranscription = sourceId == 'ai';

    final title = media?.title ?? matchState.manualTitle.trim();
    final displayTitle = title.isNotEmpty
        ? title
        : (videoPath?.split(RegExp(r'[\\/]')).last ?? 'Untitled Video');

    int? episodeNum = subtitlesState.selectedEpisode;
    int? seasonNum;

    final fileNameForParsing = subtitlesState.selectedFile ??
        subtitlesState.localFilePath?.split(RegExp(r'[\\/]')).last ??
        videoPath?.split(RegExp(r'[\\/]')).last;

    if (fileNameForParsing != null) {
      final parsedInfo = parseSeasonEpisode(fileNameForParsing);
      if (episodeNum == null && parsedInfo.episode != null) {
        episodeNum = int.tryParse(parsedInfo.episode!);
      }
      if (parsedInfo.season != null) {
        seasonNum = int.tryParse(parsedInfo.season!);
      }
    }

    String? audioTrackName;
    if (_selectedAudio != null && _selectedAudio! < _audioTracks.length) {
      audioTrackName = _audioTracks[_selectedAudio!]['t'] ?? _audioTracks[_selectedAudio!]['l'];
    } else if (_audioTracks.isNotEmpty) {
      audioTrackName = _audioTracks.first['t'] ?? _audioTracks.first['l'];
    }

    final isar = ref.read(isarProvider);

    final video = Video()
      ..videoPath = videoPath
      ..coverImagePath = media?.coverUrl
      ..subtitlePath = subtitlesState.localFilePath
      ..originalLanguage = 'ja'
      ..translatedLanguage = 'uk'
      ..pipelineIdentifier = '5-step'
      ..primaryAudio = audioTrackName
      ..isCached = false
      ..metadata = (VideoMetadata()
        ..name = displayTitle
        ..season = seasonNum
        ..episode = episodeNum
        ..description = media?.kind
        ..createdAt = DateTime.now()
        ..videoFileName = videoPath?.split(RegExp(r'[\\/]')).last
        ..subtitleFileName = subtitlesState.selectedFile ?? subtitlesState.localFilePath?.split(RegExp(r'[\\/]')).last
        ..metadataSource = media?.providerId
        ..metadataSourceId = media?.id
        ..subtitleMethodUsed = subtitlesState.method.name
        ..subtitleSourceId = sourceId
        ..videoSource = 'local'
        ..duration = playerState.duration.inMilliseconds
        ..size = _videoBytes?.toDouble())
      ..sync = (SyncMeta()
        ..syncId = DateTime.now().millisecondsSinceEpoch.toString()
        ..ownerId = 'local'
        ..isSynced = false
        ..updatedAt = DateTime.now());

    await isar.writeTxn(() async {
      await isar.videos.put(video);

      if (!isAiTranscription && subtitlesState.parsedPhrases.isNotEmpty) {
        final List<SubtitlePhrase> rawPhrases = subtitlesState.cleanBrackets
            ? SubtitleDepackerService.applyDepackingOptions(
                subtitlesState.parsedPhrases,
                mode: SubtitleDepackMode.hideParentheses,
              )
            : subtitlesState.parsedPhrases;

        final sortedPhrases = [...rawPhrases]
          ..sort((a, b) => a.startTime.compareTo(b.startTime));

        final epoch = DateTime(1970, 1, 1);
        final phrasesToSave = <Phrase>[];

        for (int i = 0; i < sortedPhrases.length; i++) {
          final p = sortedPhrases[i];
          final rawStartMs = p.startTime.difference(epoch).inMilliseconds;
          final rawEndMs = p.endTime.difference(epoch).inMilliseconds;

          final startMs = (rawStartMs + subtitlesState.alignShiftMs - subtitlesState.offsetMs).clamp(0, 999999999);
          final endMs = (rawEndMs + subtitlesState.alignShiftMs + subtitlesState.offsetMs).clamp(0, 999999999);

          final phrase = Phrase()
            ..videoId = video.id
            ..phraseOrder = i + 1
            ..startTime = startMs
            ..endTime = endMs
            ..originalVersions = [
              ReadingItem()
                ..key = 'raw'
                ..text = p.originalPhrase
            ]
            ..translatedPhrase = p.translatedPhrase
            ..stages = []
            ..sync = (SyncMeta()
              ..syncId = '${video.id}_${i + 1}_${DateTime.now().millisecondsSinceEpoch}'
              ..ownerId = 'local'
              ..isSynced = false
              ..updatedAt = DateTime.now());

          phrasesToSave.add(phrase);
        }

        if (phrasesToSave.isNotEmpty) {
          await isar.phrases.putAll(phrasesToSave);
        }
      }
    });
  }

  @override
  void dispose() {
    _clearAllUploadData();
    super.dispose();
  }

  Future<void> _pickVideo() async {
    final files = await FilePicker.pickFiles(type: FileType.video);

    if (files.isEmpty || files.first.path == null) return;

    final path = files.first.path!;
    final file = File(path);
    int bytes = 0;
    if (await file.exists()) {
      bytes = await file.length();
    }

    _videoBytes = bytes;

    ref.read(activePlayerProvider.notifier).clear();
    await ref.read(activePlayerProvider.notifier).openVideo(path);

    setState(() {
      _sizeText = _fmtSize(bytes);
      _details = _sizeText;
      _audioTracks = [];
      _subtitleTracks = [];
      _selectedAudio = null;
      _selectedSubtitle = null;
    });
  }

  String _fmtSize(int b) {
    const u = ['B', 'KB', 'MB', 'GB'];
    var v = b.toDouble(), i = 0;
    while (v >= 1024 && i < u.length - 1) {
      v /= 1024;
      i++;
    }
    return '${v.toStringAsFixed(i == 0 ? 0 : 1)} ${u[i]}';
  }

  String _fmtDur(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    final s = d.inSeconds % 60;
    final mm = m.toString().padLeft(2, '0');
    final ss = s.toString().padLeft(2, '0');
    return h > 0 ? '$h:$mm:$ss' : '$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(activePlayerProvider);
    final videoPath = playerState.videoPath;
    final stepState = ref.watch(uploadStepProvider);
    final currentStep = stepState.currentStep;
    final maxReachedStep = stepState.maxReachedStep;

    final matchState = ref.watch(uploadMatchProvider);
    final subtitlesState = ref.watch(subtitlesUploadProvider);

    bool canProceed = false;
    if (currentStep == 0) {
      canProceed = videoPath != null;
    } else if (currentStep == 1) {
      canProceed = matchState.mode == MatchMode.search
          ? matchState.selectedMedia != null
          : matchState.manualTitle.trim().isNotEmpty;
    } else if (currentStep == 2) {
      canProceed = subtitlesState.hasSelection;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF09031A),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AuroraBackground(),
          SafeArea(
            child: Column(
              children: [
                const AppTopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            UploadStepBadge(
                              currentStep: currentStep,
                              maxReachedStep: maxReachedStep,
                              onStepTap: (step) {
                                if (step <= maxReachedStep) {
                                  ref.read(uploadStepProvider.notifier).setStep(step);
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            if (currentStep == 0)
                              SourceUploadSubScreen(
                                videoPath: videoPath,
                                onPickVideo: _pickVideo,
                                details: _details,
                                audioTracks: _audioTracks,
                                selectedAudio: _selectedAudio,
                                onAudioSelected: (i) {
                                  setState(() => _selectedAudio = i);
                                  ref.read(activePlayerProvider.notifier).setAudioTrack(i);
                                },
                                onTracksLoaded: (a, s) => setState(() {
                                  _audioTracks = a;
                                  _subtitleTracks = s;
                                }),
                                onMetaLoaded: (dur, w, h) => setState(() {
                                  final parts = <String>[
                                    if (w != null && h != null && w > 0 && h > 0) '$w×$h',
                                    _fmtDur(dur),
                                    ?_sizeText,
                                  ];
                                  _details = parts.join(' · ');
                                }),
                              )
                            else if (currentStep == 1)
                              const MatchUploadSubScreen()
                            else
                              SubtitlesUploadSubScreen(
                                subtitleTracks: _subtitleTracks,
                                selectedSubtitle: _selectedSubtitle,
                                onSubtitleSelected: (i) {
                                  setState(() => _selectedSubtitle = i);
                                  ref.read(activePlayerProvider.notifier).setSubtitleTrack(i);
                                },
                              ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: PrimaryGradientButton(
                                    text: 'Back',
                                    icon: Icons.arrow_back_rounded,
                                    isIconLeading: true,
                                    onPressed: currentStep > 0
                                        ? () => ref.read(uploadStepProvider.notifier).prevStep()
                                        : () {
                                            _clearAllUploadData();
                                            if (context.canPop()) {
                                              context.pop();
                                            } else {
                                              context.go('/main');
                                            }
                                          },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Opacity(
                                    opacity: canProceed ? 1.0 : 0.45,
                                    child: PrimaryGradientButton(
                                      text: currentStep == 2 ? 'Finish' : 'Next Step',
                                      icon: Icons.arrow_forward_rounded,
                                      isIconLeading: false,
                                      onPressed: !canProceed
                                          ? null
                                          : () async {
                                              if (currentStep < 2) {
                                                ref.read(uploadStepProvider.notifier).nextStep();
                                              } else {
                                                await _saveVideoAndPhrases();
                                                _clearAllUploadData();
                                                if (context.mounted) {
                                                  context.go('/main');
                                                }
                                              }
                                            },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
