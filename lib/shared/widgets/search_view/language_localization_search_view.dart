import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../database/dtos/language_dto.dart';
import '../../search/core/search_session.dart';
import '../../../services/database/isar_service.dart';
import '../../search/sources/language_localization_search_source.dart';
import '../cards/language_localization_card.dart';

class LanguageLocalizationSearchView extends ConsumerStatefulWidget {
  const LanguageLocalizationSearchView({
    super.key,
    this.onLanguageSelected,
  });

  final ValueChanged<LanguageDto>? onLanguageSelected;

  @override
  ConsumerState<LanguageLocalizationSearchView> createState() => _LanguageLocalizationSearchViewState();
}

class _LanguageLocalizationSearchViewState extends ConsumerState<LanguageLocalizationSearchView> {
  late final SearchSession<LanguageDto> session;
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final languageProcessingService = ref.read(languageProcessingServiceProvider);
    session = SearchSession(LanguageLocalizationSearchSource(languageProcessingService));
    session.setQuery('', immediate: true);
  }

  @override
  void dispose() {
    session.dispose();
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: session,
      builder: (context, _) {
        return Column(
          children: [
            // Glass Search Input Field
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceGlass,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.borderDefault,
                  width: 1.5,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 18,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onChanged: (val) => session.setQuery(val),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      cursorColor: AppColors.cyan300,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.45),
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  if (_textController.text.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _textController.clear();
                        session.setQuery('');
                      },
                      child: Icon(
                        Icons.close_rounded,
                        size: 18,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Results list or states
            Expanded(
              child: _buildBody(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody() {
    if (session.isSearching && session.results.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.cyan300,
        ),
      );
    }

    if (session.error != null) {
      return Center(
        child: Text(
          'Error: ${session.error}',
          style: TextStyle(color: AppColors.danger),
        ),
      );
    }

    if (session.isEmptyResult) {
      return Center(
        child: Text(
          '—',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      itemCount: session.results.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = session.results[index];
        final isActive = session.isSelected(item);
        return LanguageLocalizationCard(
          item: item,
          isActive: isActive,
          onTap: () {
            session.select(item);
            widget.onLanguageSelected?.call(item);
          },
        );
      },
    );
  }
}
