class SearchQuery {
  final String text;
  final int page;
  const SearchQuery(this.text, {this.page = 1});
}

class SearchPage<T> {
  final List<T> items;
  final bool hasMore;
  const SearchPage(this.items, {this.hasMore = false});
}
