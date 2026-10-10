import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/match_repository.dart';
import '../../domain/models/match_models.dart';

class UploadMatchState {
  final MatchMode mode;
  final Set<String> selectedProviderIds;
  final String selectedSubtitleSourceId;
  final Set<String> selectedCloudLibraryIds;
  final String searchQuery;
  final List<MatchMediaItem> searchResults;
  final MatchMediaItem? selectedMedia;
  final bool isLoading;
  final String? errorMessage;
  final String manualTitle;
  final CoverSource coverSource;
  final String? manualCoverPath;

  const UploadMatchState({
    this.mode = MatchMode.search,
    this.selectedProviderIds = const {'anilist', 'tvmaze', 'shikimori'},
    this.selectedSubtitleSourceId = 'local',
    this.selectedCloudLibraryIds = const {'jimaku'},
    this.searchQuery = '',
    this.searchResults = const [],
    this.selectedMedia,
    this.isLoading = false,
    this.errorMessage,
    this.manualTitle = '',
    this.coverSource = CoverSource.automatic,
    this.manualCoverPath,
  });

  UploadMatchState copyWith({
    MatchMode? mode,
    Set<String>? selectedProviderIds,
    String? selectedSubtitleSourceId,
    Set<String>? selectedCloudLibraryIds,
    String? searchQuery,
    List<MatchMediaItem>? searchResults,
    MatchMediaItem? selectedMedia,
    bool? clearSelectedMedia,
    bool? isLoading,
    String? errorMessage,
    bool? clearErrorMessage,
    String? manualTitle,
    CoverSource? coverSource,
    String? manualCoverPath,
    bool? clearManualCoverPath,
  }) {
    return UploadMatchState(
      mode: mode ?? this.mode,
      selectedProviderIds: selectedProviderIds ?? this.selectedProviderIds,
      selectedSubtitleSourceId:
          selectedSubtitleSourceId ?? this.selectedSubtitleSourceId,
      selectedCloudLibraryIds:
          selectedCloudLibraryIds ?? this.selectedCloudLibraryIds,
      searchQuery: searchQuery ?? this.searchQuery,
      searchResults: searchResults ?? this.searchResults,
      selectedMedia: clearSelectedMedia == true
          ? null
          : (selectedMedia ?? this.selectedMedia),
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearErrorMessage == true
          ? null
          : (errorMessage ?? this.errorMessage),
      manualTitle: manualTitle ?? this.manualTitle,
      coverSource: coverSource ?? this.coverSource,
      manualCoverPath: clearManualCoverPath == true
          ? null
          : (manualCoverPath ?? this.manualCoverPath),
    );
  }
}

class UploadMatchNotifier extends Notifier<UploadMatchState> {
  final MatchRepository _matchRepository = MatchRepository();

  @override
  UploadMatchState build() {
    return const UploadMatchState();
  }

  void setMode(MatchMode mode) {
    if (mode == MatchMode.manual && state.selectedSubtitleSourceId == 'cloud') {
      state = state.copyWith(
        mode: mode,
        selectedSubtitleSourceId: 'local',
      );
    } else {
      state = state.copyWith(mode: mode);
    }
    if (mode == MatchMode.search && state.searchResults.isEmpty && state.searchQuery.isNotEmpty) {
      performSearch(state.searchQuery);
    }
  }

  void toggleProvider(String providerId) {
    final updated = Set<String>.from(state.selectedProviderIds);
    if (updated.contains(providerId)) {
      if (updated.length <= 1) return; // Must have at least 1 provider
      updated.remove(providerId);
    } else {
      updated.add(providerId);
    }
    state = state.copyWith(selectedProviderIds: updated);
    if (state.searchQuery.isNotEmpty) {
      performSearch(state.searchQuery);
    }
  }

  void setSelectedProviders(Set<String> providerIds) {
    if (providerIds.isEmpty) return;
    state = state.copyWith(selectedProviderIds: providerIds);
    if (state.searchQuery.isNotEmpty) {
      performSearch(state.searchQuery);
    }
  }

  void setSubtitleSource(String sourceId) {
    state = state.copyWith(selectedSubtitleSourceId: sourceId);
    if (state.searchQuery.isNotEmpty) {
      performSearch(state.searchQuery);
    }
  }

  void toggleCloudLibrary(String libraryId) {
    final updated = Set<String>.from(state.selectedCloudLibraryIds);
    if (updated.contains(libraryId)) {
      if (updated.length <= 1) return;
      updated.remove(libraryId);
    } else {
      updated.add(libraryId);
    }
    state = state.copyWith(selectedCloudLibraryIds: updated);
  }

  void setCloudLibraries(Set<String> libraryIds) {
    if (libraryIds.isEmpty) return;
    state = state.copyWith(selectedCloudLibraryIds: libraryIds);
    if (state.searchQuery.isNotEmpty) {
      performSearch(state.searchQuery);
    }
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  Future<void> performSearch([String? customQuery]) async {
    final query = customQuery ?? state.searchQuery;
    final cleaned = _matchRepository.cleanFilenameQuery(query);

    if (cleaned.trim().isEmpty) return;

    state = state.copyWith(
      isLoading: true,
      clearErrorMessage: true,
      searchQuery: query,
    );

    try {
      final isCloud = state.selectedSubtitleSourceId == 'cloud';
      final activeIds = isCloud ? state.selectedCloudLibraryIds : state.selectedProviderIds;

      final results = await _matchRepository.fetchUnifiedMetadata(
        query: cleaned,
        activeIds: activeIds,
        isCloudSource: isCloud,
      );

      if (results.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          searchResults: [],
          clearSelectedMedia: true,
          errorMessage: 'No metadata found. Try other keywords or select more providers/libraries.',
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          searchResults: results,
          selectedMedia: results.first,
          clearErrorMessage: true,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        searchResults: [],
        clearSelectedMedia: true,
        errorMessage: 'An error occurred while searching: $e',
      );
    }
  }

  void selectMedia(MatchMediaItem media) {
    state = state.copyWith(selectedMedia: media);
  }

  void setManualTitle(String title) {
    state = state.copyWith(manualTitle: title);
  }

  void setCoverSource(CoverSource source) {
    state = state.copyWith(coverSource: source);
  }

  void setManualCoverPath(String? path) {
    if (path == null) {
      state = state.copyWith(clearManualCoverPath: true);
    } else {
      state = state.copyWith(manualCoverPath: path, coverSource: CoverSource.device);
    }
  }

  void reset() {
    state = const UploadMatchState();
  }
}

final uploadMatchProvider =
    NotifierProvider<UploadMatchNotifier, UploadMatchState>(() {
  return UploadMatchNotifier();
});
