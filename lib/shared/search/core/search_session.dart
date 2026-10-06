import 'dart:async';
import 'package:flutter/foundation.dart';
import 'search_models.dart';
import 'search_source.dart';

class SearchSession<T> extends ChangeNotifier {
  SearchSession(this.source);
  final SearchSource<T> source;

  Timer? _timer;
  int _searchId = 0;          // стара відповідь ігнорується
  bool _disposed = false;

  String query = '';
  List<T> results = const [];
  int page = 1;
  bool hasMore = false;
  bool isSearching = false;
  bool isLoadingMore = false;
  Object? error;
  T? selected;

  bool get _valid =>
      query.length >= source.minQueryLength &&
      (query.isNotEmpty || source.searchOnEmpty);

  bool get isEmptyResult =>
      !isSearching && error == null && results.isEmpty && _valid;

  bool isSelected(T item) =>
      selected != null && source.idOf(selected as T) == source.idOf(item);

  void setQuery(String text, {bool immediate = false}) {
    query = text.trim();
    _timer?.cancel();

    if (!_valid) {
      _searchId++;
      results = const [];
      hasMore = false;
      isSearching = false;
      error = null;
      _notify();
      return;
    }
    if (immediate) {
      search();
    } else {
      _timer = Timer(source.debounce, search);
    }
  }

  Future<void> search() async {
    final id = ++_searchId;
    page = 1;
    hasMore = false;
    isSearching = true;
    error = null;
    _notify();

    try {
      final res = await source.fetch(SearchQuery(query));
      if (id != _searchId) return;
      results = res.items;
      hasMore = res.hasMore;
    } catch (e) {
      if (id != _searchId) return;
      results = const [];
      error = e;
    } finally {
      if (id == _searchId) {
        isSearching = false;
        _notify();
      }
    }
  }

  Future<void> loadMore() async {
    if (isSearching || isLoadingMore || !hasMore || !_valid) return;
    final id = _searchId;
    isLoadingMore = true;
    _notify();
    try {
      final res = await source.fetch(SearchQuery(query, page: page + 1));
      if (id != _searchId) return;
      results = [...results, ...res.items];
      page++;
      hasMore = res.hasMore && res.items.isNotEmpty;
    } catch (_) {
      // мовчки: можна прокрутити ще раз
    } finally {
      if (id == _searchId) {
        isLoadingMore = false;
        _notify();
      }
    }
  }

  void select(T item) {
    selected = item;
    _notify();
  }

  void _notify() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _timer?.cancel();
    super.dispose();
  }
}
