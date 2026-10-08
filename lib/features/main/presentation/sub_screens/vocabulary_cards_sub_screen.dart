import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/core/theme/app_colors.dart';
import 'package:eiga/shared/providers/custom_providers.dart';
import 'package:eiga/shared/widgets/cards/custom_library_row.dart';
import 'package:eiga/shared/widgets/backgrounds/aurora_background.dart';
import 'package:eiga/shared/widgets/app_top_bar.dart';
import 'package:eiga/shared/widgets/vocabulary/word_card.dart';
import 'package:eiga/database/seeds/sample_words.dart';
import 'package:eiga/database/models/word_models.dart';
import 'package:eiga/services/database/isar_service.dart';

enum _VocabFilter { all, learning, known, unknown }

/// Субскрін для всіх словникових карток (Vocabulary Cards) з пошуком та фільтрами.
class VocabularyCardsSubScreen extends ConsumerStatefulWidget {
  const VocabularyCardsSubScreen({super.key});

  @override
  ConsumerState<VocabularyCardsSubScreen> createState() => _VocabularyCardsSubScreenState();
}

class _VocabularyCardsSubScreenState extends ConsumerState<VocabularyCardsSubScreen> {
  static const _cyan = Color(0xFF67E8F9);

  final _searchCtrl = TextEditingController();
  _VocabFilter _filter = _VocabFilter.all;
  String _query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<CustomItem> _getFilteredItems(List<CustomItem> items) {
    final q = _query.trim().toLowerCase();
    return items.where((item) {
      if (q.isNotEmpty) {
        final matchTitle = item.title.toLowerCase().contains(q);
        final matchSub = item.subtitle?.toLowerCase().contains(q) ?? false;
        if (!matchTitle && !matchSub) return false;
      }
      switch (_filter) {
        case _VocabFilter.all:
          return true;
        case _VocabFilter.learning:
          return item.status == WordStatus.learning;
        case _VocabFilter.known:
          return item.status == WordStatus.known;
        case _VocabFilter.unknown:
          return item.status == WordStatus.unknown;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final customItems = ref.watch(customItemsProvider);
    final appConfig = ref.watch(appConfigProvider);
    final currentLang = appConfig.getAppLanguage;
    final langRepo = ref.watch(languageRepositoryProvider);
    String t(String key) => langRepo.translate(currentLang, key);

    final filteredItems = _getFilteredItems(customItems);

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
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t('vocabulary_cards'),
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${customItems.length} items',
                                style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(.6)),
                              ),
                              const SizedBox(height: 16),
                              _buildSearch(t),
                              const SizedBox(height: 12),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    _FilterChip(
                                      label: t('filter_all'),
                                      selected: _filter == _VocabFilter.all,
                                      onTap: () => setState(() => _filter = _VocabFilter.all),
                                    ),
                                    const SizedBox(width: 8),
                                    _FilterChip(
                                      label: 'Learning',
                                      selected: _filter == _VocabFilter.learning,
                                      onTap: () => setState(() => _filter = _VocabFilter.learning),
                                    ),
                                    const SizedBox(width: 8),
                                    _FilterChip(
                                      label: 'Known',
                                      selected: _filter == _VocabFilter.known,
                                      onTap: () => setState(() => _filter = _VocabFilter.known),
                                    ),
                                    const SizedBox(width: 8),
                                    _FilterChip(
                                      label: 'Unknown',
                                      selected: _filter == _VocabFilter.unknown,
                                      onTap: () => setState(() => _filter = _VocabFilter.unknown),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (filteredItems.isEmpty)
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(32),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.search_off_rounded, size: 48, color: Colors.white.withOpacity(.4)),
                                  const SizedBox(height: 12),
                                  const Text(
                                    'No vocabulary cards found',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      else
                        SliverPadding(
                          padding: const EdgeInsets.all(24),
                          sliver: SliverGrid(
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 1.15,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                final item = filteredItems[index];
                                return CustomCard(
                                  item: item,
                                  width: double.infinity,
                                  t: t,
                                  onTap: () {
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
                                );
                              },
                              childCount: filteredItems.length,
                            ),
                          ),
                        ),
                      const SliverToBoxAdapter(child: SizedBox(height: 96)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch(String Function(String key) t) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: AppColors.white15,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.white20, width: 1.5),
      ),
      child: TextField(
        controller: _searchCtrl,
        onChanged: (text) => setState(() => _query = text),
        style: const TextStyle(fontSize: 14, color: Colors.white),
        cursorColor: _cyan,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: t('search_hint') != 'search_hint' ? t('search_hint') : 'Search words...',
          hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
          prefixIcon: Icon(Icons.search_rounded, size: 20, color: Colors.white.withOpacity(.7)),
          suffixIcon: _query.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.close_rounded, size: 18, color: Colors.white),
                  onPressed: () => setState(() {
                    _searchCtrl.clear();
                    _query = '';
                  }),
                ),
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected ? const Color(0x2938BDF8) : AppColors.white15,
          border: Border.all(
            color: selected ? const Color(0xFF67E8F9) : AppColors.white20,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: .3,
            color: selected ? const Color(0xFF67E8F9) : Colors.white,
          ),
        ),
      ),
    );
  }
}
