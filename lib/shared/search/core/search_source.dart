import 'search_models.dart';

typedef SearchFetcher<T> = Future<SearchPage<T>> Function(SearchQuery query);

class SearchSource<T> {
  const SearchSource({
    required this.fetch,          // ← ТВІЙ get
    required this.idOf,           // як відрізнити один запис від іншого
    this.minQueryLength = 2,
    this.debounce = const Duration(milliseconds: 500),
    this.searchOnEmpty = false,   // true для локальних списків
  });

  final SearchFetcher<T> fetch;
  final String Function(T) idOf;
  final int minQueryLength;
  final Duration debounce;
  final bool searchOnEmpty;
}
