import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eiga/shared/widgets/app_bar_minimal.dart';
import 'package:eiga/shared/widgets/backgrounds/aurora_background.dart';
import 'package:eiga/shared/widgets/buttons/add_video_button.dart';
import 'package:eiga/shared/widgets/cards/video_library_row.dart';
import 'package:eiga/shared/widgets/cards/custom_library_row.dart';
import 'package:eiga/shared/widgets/cards/video_item.dart';
import 'package:eiga/shared/widgets/vocabulary/word_card.dart';
import 'package:eiga/database/seeds/sample_words.dart';
import 'package:eiga/shared/providers/language_profile_providers.dart';
import 'package:eiga/shared/providers/video_providers.dart';
import 'package:eiga/shared/providers/custom_providers.dart';
import 'package:eiga/services/database/isar_service.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: AddVideoButton(
                      title: t('add_video') != 'add_video' ? t('add_video') : 'Add Video',
                      subtitle: t('add_video_sub') != 'add_video_sub' ? t('add_video_sub') : 'Import media or subtitles',
                      onPressed: () => context.go('/upload'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
