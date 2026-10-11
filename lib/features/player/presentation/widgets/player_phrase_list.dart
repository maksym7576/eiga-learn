import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../providers/player_video_providers.dart';
import 'player_phrase_item.dart';
import 'player_bottom_dock.dart';

class PlayerPhraseList extends HookConsumerWidget {
  final VoidCallback? onOpenSettings;

  const PlayerPhraseList({
    super.key,
    this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phrasesAsync = ref.watch(phrasesStreamProvider);
    final isAutoScrollEnabled = ref.watch(isAutoScrollEnabledProvider);

    final itemScrollController = useMemoized(() => ItemScrollController());
    final itemPositionsListener = useMemoized(() => ItemPositionsListener.create());

    // Слухаємо зміну активної фрази для плавної автопрокрутки
    ref.listen<int?>(stickyActivePhraseIdProvider, (prev, activePhraseId) {
      if (!isAutoScrollEnabled) return;
      final phrases = phrasesAsync.value ?? [];
      if (phrases.isEmpty || activePhraseId == null) return;

      final index = phrases.indexWhere((p) => p.id == activePhraseId);
      if (index != -1 && itemScrollController.isAttached) {
        itemScrollController.scrollTo(
          index: index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          alignment: 0.2,
        );
      }
    });

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0C081E),
        border: Border(
          left: BorderSide(color: Color(0x1AFFFFFF), width: 1),
        ),
      ),
      child: Stack(
        children: [
          // Основний список фраз без верхньої шапки/пошуку
          phrasesAsync.when(
            data: (phrases) {
              if (phrases.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.subtitles_off_rounded, size: 40, color: Colors.white.withOpacity(0.3)),
                        const SizedBox(height: 12),
                        Text(
                          'No phrases found for this video',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is UserScrollNotification) {
                    if (notification.direction != ScrollDirection.idle) {
                      if (ref.read(isAutoScrollEnabledProvider)) {
                        ref.read(isAutoScrollEnabledProvider.notifier).setEnabled(false);
                      }
                    }
                  }
                  return false;
                },
                child: ScrollablePositionedList.builder(
                  itemCount: phrases.length,
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  padding: const EdgeInsets.only(bottom: 100),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final phrase = phrases[index];
                    return PlayerPhraseItem(
                      key: ValueKey('phrase_${phrase.id}'),
                      phrase: phrase,
                    );
                  },
                ),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFF3B66F5)),
            ),
            error: (err, stack) => Center(
              child: Text(
                'Error loading phrases: $err',
                style: const TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ),
          ),

          // Плаваюча панель управління знизу списку
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: PlayerBottomDock(
              onOpenSettings: onOpenSettings,
            ),
          ),
        ],
      ),
    );
  }
}
