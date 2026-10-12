import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:eiga/core/theme/theme_manager.dart';
import 'package:eiga/shared/player/active_player_provider.dart';
import 'package:eiga/features/player/presentation/providers/player_video_providers.dart';
import 'package:eiga/features/player/presentation/widgets/player_bottom_dock.dart';
import 'package:eiga/shared/phrase/core/domain/token.dart';
import 'package:eiga/shared/phrase/core/style/word_colors.dart';
import 'phrase_tile.dart';

class PhraseListView extends HookConsumerWidget {
  final VoidCallback? onOpenSettings;
  final ValueChanged<Token>? onTokenTap;

  const PhraseListView({
    super.key,
    this.onOpenSettings,
    this.onTokenTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phrasesAsync = ref.watch(phrasesStreamProvider);
    final isAutoScrollEnabled = ref.watch(isAutoScrollEnabledProvider);
    final activeId = ref.watch(stickyActivePhraseIdProvider);

    final theme = ref.watch(phraseThemeManagerProvider);
    final colors = WordColors(theme);

    final selectedTokenState = useState<Token?>(null);

    final itemScrollController = useMemoized(() => ItemScrollController());
    final itemPositionsListener = useMemoized(() => ItemPositionsListener.create());

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

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        border: Border(
          left: BorderSide(
            color: colors.dimTextColor.withOpacity(0.15),
            width: 1,
          ),
        ),
      ),
      child: Stack(
        children: [
          phrasesAsync.when(
            data: (phrases) {
              if (phrases.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.subtitles_off_rounded,
                          size: 40,
                          color: colors.dimTextColor.withOpacity(0.5),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No phrases found for this video',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: colors.dimTextColor,
                          ),
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
                child: ScrollConfiguration(
                  behavior: const MaterialScrollBehavior().copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.trackpad,
                      PointerDeviceKind.stylus,
                    },
                  ),
                  child: ScrollablePositionedList.builder(
                    itemCount: phrases.length,
                    itemScrollController: itemScrollController,
                    itemPositionsListener: itemPositionsListener,
                    padding: const EdgeInsets.only(bottom: 100),
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    itemBuilder: (context, index) {
                      final phrase = phrases[index];
                      final isActive = activeId == phrase.id;

                      return PhraseTile(
                        key: ValueKey('phrase_tile_${phrase.id}'),
                        phrase: phrase,
                        isActive: isActive,
                        theme: theme,
                        isAutoScrollEnabled: isAutoScrollEnabled,
                        highlightedGroupId: selectedTokenState.value?.groupId,
                        onTap: () {
                          final pos = Duration(milliseconds: phrase.startTime);
                          ref.read(activePlayerProvider.notifier).seek(pos);
                          ref.read(activePlayerProvider.notifier).play();
                          ref.read(isAutoScrollEnabledProvider.notifier).setEnabled(true);
                        },
                        onTokenTap: (token) {
                          if (selectedTokenState.value == token) {
                            selectedTokenState.value = null;
                          } else {
                            selectedTokenState.value = token;
                          }
                          onTokenTap?.call(token);
                        },
                      );
                    },
                  ),
                ),
              );
            },
            loading: () => Center(
              child: CircularProgressIndicator(color: colors.activeAccentColor),
            ),
            error: (err, stack) => Center(
              child: Text(
                'Error loading phrases: $err',
                style: const TextStyle(color: Colors.redAccent, fontSize: 12),
              ),
            ),
          ),
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
