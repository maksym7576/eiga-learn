import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/player_video_providers.dart';
import 'player_phrase_item.dart';

class PlayerPhraseList extends HookConsumerWidget {
  const PlayerPhraseList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phrasesAsync = ref.watch(phrasesStreamProvider);
    final isAutoScrollEnabled = ref.watch(isAutoScrollEnabledProvider);

    final itemScrollController = useMemoized(() => ItemScrollController());
    final itemPositionsListener = useMemoized(() => ItemPositionsListener.create());
    final searchQuery = useState<String>('');
    final searchController = useTextEditingController();

    // Слухаємо зміну активної фрази для автоскролу
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
      decoration: BoxDecoration(
        color: const Color(0xFF0C081E).withOpacity(0.85),
        border: const Border(
          left: BorderSide(color: Color(0x20FFFFFF), width: 1),
        ),
      ),
      child: Column(
        children: [
          // Шапка панелі субтитрів
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                const Icon(Icons.subtitles_rounded, size: 20, color: AppColors.cyanLight),
                const SizedBox(width: 8),
                const Text(
                  'Phrases',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                if (phrasesAsync.value != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.white15,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${phrasesAsync.value!.length}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                const Spacer(),

                // Перемикач автоскролу
                Tooltip(
                  message: isAutoScrollEnabled ? 'Auto-scroll active' : 'Enable auto-scroll',
                  child: InkWell(
                    onTap: () {
                      ref.read(isAutoScrollEnabledProvider.notifier).toggle();
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: isAutoScrollEnabled ? AppColors.violet800.withOpacity(0.6) : AppColors.white10,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isAutoScrollEnabled ? AppColors.cyanLight : Colors.white.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isAutoScrollEnabled ? Icons.my_location_rounded : Icons.location_searching_rounded,
                            size: 14,
                            color: isAutoScrollEnabled ? AppColors.cyanLight : Colors.white60,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Auto',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: isAutoScrollEnabled ? AppColors.cyanLight : Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Поле пошуку
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.white10,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white.withOpacity(0.12)),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (val) => searchQuery.value = val,
                style: const TextStyle(fontSize: 13, color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search subtitle phrases...',
                  hintStyle: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.4)),
                  prefixIcon: Icon(Icons.search_rounded, size: 18, color: Colors.white.withOpacity(0.5)),
                  suffixIcon: searchQuery.value.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close_rounded, size: 16, color: Colors.white60),
                          onPressed: () {
                            searchController.clear();
                            searchQuery.value = '';
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Список карточок фраз
          Expanded(
            child: phrasesAsync.when(
              data: (allPhrases) {
                if (allPhrases.isEmpty) {
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

                final q = searchQuery.value.trim().toLowerCase();
                final phrases = q.isEmpty
                    ? allPhrases
                    : allPhrases.where((p) {
                        final orig = p.originalVersions.firstOrNull?.text.toLowerCase() ?? '';
                        final trans = p.translatedPhrase?.toLowerCase() ?? '';
                        return orig.contains(q) || trans.contains(q);
                      }).toList();

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
                    padding: const EdgeInsets.only(bottom: 24),
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
                child: CircularProgressIndicator(color: AppColors.cyanLight),
              ),
              error: (err, stack) => Center(
                child: Text(
                  'Error loading phrases: $err',
                  style: const TextStyle(color: Colors.redAccent, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
