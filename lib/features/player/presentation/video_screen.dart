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
import '../../../shared/widgets/app_bar/app_top_bar.dart';
import 'providers/player_video_providers.dart';
import 'widgets/player_phrase_list.dart';
import 'package:eiga/shared/widgets/sheets/player_menu_sheet.dart';

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
                // Верхня панель (AppTopBar)
                AppTopBar(
                  onBack: () {
                    ref.read(activePlayerProvider.notifier).clear();
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/main');
                    }
                  },
                ),

                const SizedBox(height: 8),

                // Основний вміст (Плеєр + Список фраз)
                Expanded(
                  child: videoAsync.when(
                    data: (v) {
                      if (v == null || v.videoPath == null) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.movie_outlined, size: 48, color: Colors.white.withValues(alpha: 0.4)),
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
                                onOpenSettings: () => PlayerMenuSheet.show(context, isFullScreen: false),
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
                                onOpenSettings: () => PlayerMenuSheet.show(context, isFullScreen: false),
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
}
