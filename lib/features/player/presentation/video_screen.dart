import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/player/active_player_provider.dart';
import '../../../shared/player/video_player_container.dart';
import '../../../shared/player/subtitle_settings_panel.dart';
import '../../../shared/widgets/backgrounds/aurora_background.dart';
import '../../../shared/widgets/app_top_bar.dart';
import 'providers/player_video_providers.dart';
import 'widgets/player_phrase_list.dart';

class VideoScreen extends HookConsumerWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoAsync = ref.watch(currentVideoProvider);
    final video = videoAsync.value;
    final isSettingsOpen = useState(false);

    // Wakelock для запобігання згасанню екрану
    useEffect(() {
      WakelockPlus.enable();
      return () {
        WakelockPlus.disable();
      };
    }, []);

    // Автоматичне відкриття відео у плеєрі після завантаження моделі відео
    useEffect(() {
      if (video != null && video.videoPath != null && video.videoPath!.isNotEmpty) {
        final activePath = ref.read(activePlayerProvider.select((s) => s.videoPath));
        if (activePath != video.videoPath) {
          Future.microtask(() {
            ref.read(activePlayerProvider.notifier).openVideo(video.videoPath!);
          });
        }
      }
      return null;
    }, [video]);

    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = screenWidth >= 900;

    return Scaffold(
      backgroundColor: const Color(0xFF09031A),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AuroraBackground(),
          SafeArea(
            child: Column(
              children: [
                // Шапка з назвою відео
                _buildHeader(context, ref, video?.metadata.name, video?.metadata.episode, video?.originalLanguage, video?.translatedLanguage),

                // Основний вміст (Плеєр + Список фраз)
                Expanded(
                  child: videoAsync.when(
                    data: (v) {
                      if (v == null || v.videoPath == null) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.movie_outlined, size: 48, color: Colors.white.withOpacity(0.4)),
                              const SizedBox(height: 12),
                              const Text(
                                'No video selected',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      }

                      if (isDesktop) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Відеоплеєр
                            Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.black,
                                child: VideoPlayerContainer(
                                  videoPath: v.videoPath,
                                ),
                              ),
                            ),

                            // Панель субтитрів з картками фраз
                            SizedBox(
                              width: 380,
                              child: PlayerPhraseList(
                                onOpenSettings: () => isSettingsOpen.value = !isSettingsOpen.value,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            // Відеоплеєр для мобільних
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                color: Colors.black,
                                child: VideoPlayerContainer(
                                  videoPath: v.videoPath,
                                ),
                              ),
                            ),

                            // Панель субтитрів для мобільних
                            Expanded(
                              child: PlayerPhraseList(
                                onOpenSettings: () => isSettingsOpen.value = !isSettingsOpen.value,
                              ),
                            ),
                          ],
                        );
                      }
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(color: AppColors.cyanLight),
                    ),
                    error: (err, stack) => Center(
                      child: Text('Error loading video: $err', style: const TextStyle(color: Colors.redAccent)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Панель налаштувань субтитрів
          SubtitleSettingsPanel(
            isOpen: isSettingsOpen.value,
            onClose: () => isSettingsOpen.value = false,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    WidgetRef ref,
    String? title,
    int? episode,
    String? sourceLang,
    String? targetLang,
  ) {
    return AppTopBar(
      onBack: () {
        ref.read(activePlayerProvider.notifier).clear();
        if (context.canPop()) {
          context.pop();
        } else {
          context.go('/main');
        }
      },
      showLogo: false,
      actions: [
        if (title != null) ...[
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                if (episode != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.white15,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'EP $episode',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
                if (sourceLang != null && targetLang != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Text(
                      '${sourceLang.toUpperCase()} → ${targetLang.toUpperCase()}',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: AppColors.cyanLight,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
        ],
      ],
    );
  }
}
