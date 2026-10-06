import '../core/search_models.dart';
import '../core/search_source.dart';
import '../../../database/dtos/language_dto.dart';
import '../../../services/language/language_processing_service.dart';

class LanguageLocalizationSearchSource extends SearchSource<LanguageDto> {
  LanguageLocalizationSearchSource(this.languageProcessingService)
      : super(
          fetch: (query) async {
            final allLanguages = languageProcessingService.getLocalizedLanguages();
            final text = query.text.trim().toLowerCase();
            final filtered = allLanguages.where((l) {
              if (text.isEmpty) return true;
              return l.name.toLowerCase().contains(text) ||
                  l.subtitle.toLowerCase().contains(text) ||
                  l.code.toLowerCase().contains(text);
            }).toList();

            filtered.sort((a, b) => a.name.compareTo(b.name));

            return SearchPage(filtered, hasMore: false);
          },
          idOf: (item) => item.code,
          minQueryLength: 0,
          searchOnEmpty: true,
          debounce: const Duration(milliseconds: 150),
        );

  final LanguageProcessingService languageProcessingService;
}
