import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eiga/shared/widgets/app_bar_minimal.dart';
import 'package:eiga/shared/widgets/backgrounds/aurora_background.dart';
import 'package:eiga/shared/widgets/buttons/add_video_button.dart';
import 'package:eiga/shared/widgets/cards/video_library_row.dart';
import 'package:eiga/shared/widgets/cards/custom_library_row.dart';
import 'package:eiga/shared/widgets/cards/video_item.dart';
import 'package:eiga/shared/widgets/cards/pipeline_job_card.dart';
import 'package:eiga/shared/widgets/cards/audio_card.dart';
import 'package:eiga/shared/widgets/vocabulary/word_card.dart';
import 'package:eiga/database/seeds/sample_words.dart';
import 'package:eiga/shared/providers/language_profile_providers.dart';
import 'package:eiga/shared/providers/video_providers.dart';
import 'package:eiga/shared/providers/custom_providers.dart';
import 'package:eiga/services/database/isar_service.dart';
import 'package:eiga/services/pipeline/providers.dart';
import 'package:eiga/shared/utils/video_action_handler.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  String _formatTimeAgo(DateTime? dt) {
    if (dt == null) return '';
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileService = ref.watch(languageProfileServiceProvider);
    final videosAsync = ref.watch(videosStreamProvider);
    final customItems = ref.watch(customItemsProvider);
    final appConfig = ref.watch(appConfigProvider);
    final currentLang = appConfig.getAppLanguage;
    final langRepo = ref.watch(languageRepositoryProvider);
    String t(String key) => langRepo.translate(currentLang, key);

    final videoItems = videosAsync.asData?.value.map((v) => VideoItem(
          id: v.id.toString(),
          title: v.metadata.name ?? 'Untitled',
          coverUrl: v.coverImagePath,
          episode: v.metadata.episode?.toString(),
          date: _formatTimeAgo(v.metadata.createdAt),
          cached: v.isCached,
          sourceLang: v.originalLanguage,
          targetLang: v.translatedLanguage,
        )).toList() ?? [];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarMinimal(
        profileService: profileService,
        t: t,
        needsSync: false,
        onSync: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: AuroraBackground()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ActiveJobsSection(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AddVideoButton(
                        title: t('add_video') != 'add_video' ? t('add_video') : 'Add Video',
                        subtitle: t('add_video_sub') != 'add_video_sub' ? t('add_video_sub') : 'Import media or subtitles',
                        onPressed: () => context.go('/upload'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    VideoLibraryRow(
                      videos: videoItems,
                      title: t('library') != 'library' ? t('library') : 'Library',
                      onSeeAll: () => context.push('/library'),
                      onVideoTap: (v) {},
                      onMenuAction: (v, action) => handleVideoMenuAction(context, ref, v, action),
                    ),
                    const SizedBox(height: 24),
                    CustomLibraryRow(
                      items: customItems,
                      title: t('vocabulary_cards'),
                      t: t,
                      onSeeAll: () => context.go('/vocabulary-cards'),
                      onItemTap: (item) {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) => Consumer(
                            builder: (context, ref, child) {
                              final statuses = ref.watch(wordStatusesProvider);
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: SingleChildScrollView(
                                  child: WordCard(
                                    dictionary: sampleWords,
                                    initialKey: item.id,
                                    initialStatuses: statuses,
                                    onStatusChanged: (key, status) {
                                      ref.read(wordStatusesProvider.notifier).setStatus(key, status);
                                    },
                                    t: t,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActiveJobsSection extends ConsumerWidget {
  const ActiveJobsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeJobsAsync = ref.watch(activeJobsStreamProvider);
    final jobs = activeJobsAsync.asData?.value ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 1. Audio Card Demo (matching audio_card HTML spec)
        AudioCard(
          fileName: 'anime_episode_01.mkv',
          status: 'running',
          progress: 0.45,
          durationFormatted: '24:15',
          detectedCount: 14,
          totalCount: 45,
          stages: [
            AudioStageInfo(id: 'extract', name: 'Вилучення аудіо', modelName: 'FFmpeg', status: 'done'),
            AudioStageInfo(id: 'vad', name: 'Голосова активність (VAD)', modelName: 'Silero VAD', status: 'done'),
            AudioStageInfo(id: 'transcribe', name: 'Transcribe', modelName: 'Whisper-Large', status: 'running', processed: 14, total: 50),
            AudioStageInfo(id: 'judge', name: 'Quality Judge', modelName: 'AudioAnalyzer', status: 'pending'),
            AudioStageInfo(id: 'match', name: 'Subtitle Matcher', modelName: 'SubtitleMatcher', status: 'pending'),
          ],
          chunks: List.generate(45, (i) {
            final status = i < 3 ? 'aligned' : i == 3 || i == 9 ? 'detected' : i == 6 ? 'warning' : 'pending';
            return AudioChunkInfo(startTime: (i / 45) * 100, endTime: ((i + 0.82) / 45) * 100, status: status);
          }),
          logs: [
            AudioLogItem(timestamp: '12:04:11', level: 'ok', message: 'AudioAnalyzer — Chunk #1 aligned'),
            AudioLogItem(timestamp: '12:04:13', level: 'info', message: 'WhisperModel — Transcribed 12 words'),
            AudioLogItem(timestamp: '12:04:19', level: 'warn', message: 'Chunk #7 — низька впевненість (0.61)'),
            AudioLogItem(timestamp: '12:04:24', level: 'ok', message: 'AudioAnalyzer — Chunk #12 aligned'),
          ],
          onRetry: () {},
          onCancel: () {},
        ),
        const SizedBox(height: 8),
        // 2. Translation Pipeline Job Cards from Database
        ...jobs.map((job) {
          final firstPhrase = job.phraseOrders.isNotEmpty ? job.phraseOrders.first : 1;
          final lastPhrase = job.phraseOrders.isNotEmpty ? job.phraseOrders.last : 40;

          const stageNames = {
            'context': 'Контекст',
            'translation': 'Переклад',
            'tokenization': 'Токени оригіналу',
            'lemmatization': 'Морфологія',
            'gloss': 'Граматична роль',
          };

          final stages = job.executionPlan.isEmpty
              ? stageNames.entries.map((e) => PipelineStageInfo(id: e.key, name: e.value, status: 'pending')).toList()
              : job.executionPlan.map((stepId) {
                  final isCompleted = job.completedSteps.contains(stepId);
                  final isCurrent = job.currentStep == stepId;
                  final status = isCompleted ? 'done' : isCurrent ? 'running' : 'pending';
                  return PipelineStageInfo(
                    id: stepId,
                    name: stageNames[stepId] ?? stepId,
                    status: status,
                    modelName: job.modelName,
                    processed: isCompleted ? 40 : (isCurrent ? job.processedPhrases : 0),
                    total: job.totalPhrases > 0 ? job.totalPhrases : 40,
                    errorMessage: isCurrent ? job.errorMessage : null,
                  );
                }).toList();

          return PipelineJobCard(
            jobId: job.id,
            phase: job.phase,
            status: job.status,
            progress: job.totalPhrases > 0 ? job.processedPhrases / job.totalPhrases : 0.0,
            phraseRange: '#$firstPhrase–$lastPhrase',
            attempt: job.attempt ?? 1,
            stages: stages,
            errorMessage: job.errorMessage,
            onCancel: () async {
              final jobService = ref.read(jobServiceProvider);
              await jobService.cancel(job.id);
            },
            onRetry: () {},
          );
        }),
        const SizedBox(height: 16),
      ],
    );
  }
}
