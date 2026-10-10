import 'dart:developer' as developer;
import 'package:eiga/features/upload/domain/models/match_models.dart';
import 'package:eiga/features/upload/domain/models/jimaku_metadata_models.dart';
import 'package:eiga/services/api/anilist_service.dart';
import 'package:eiga/services/api/shikimori_service.dart';
import 'package:eiga/services/api/tvmaze_service.dart';
import 'package:eiga/services/api/jimaku_service.dart';

/// Resolved target services permitted for query execution.
class _SearchTargets {
  final bool fetchJimaku;
  final bool fetchAniList;
  final bool fetchShikimori;
  final bool fetchTVmaze;

  const _SearchTargets({
    required this.fetchJimaku,
    required this.fetchAniList,
    required this.fetchShikimori,
    required this.fetchTVmaze,
  });
}

/// Raw search query results gathered from network services.
class _SearchRawData {
  final List<UnifiedMetadataDTO> jimakuResults;
  final List<UnifiedMetadataDTO> providerResults;

  const _SearchRawData({
    required this.jimakuResults,
    required this.providerResults,
  });
}

/// Primary source mode determining hierarchy for merging metadata.
enum _PrimarySourceMode {
  jimakuBaseWithProviderEnrichment,
  providersPrimary,
}

/// Repository for searching metadata from external anime / TV / movie services.
/// Refactored with modular, single-responsibility phases:
/// 1. Request target calculation (_resolveSearchTargets)
/// 2. Target-restricted network requests (_executeQueries)
/// 3. Primary source priority selection and merging (_mergeResultsByPrimaryPriority)
/// 4. Post-processing, filtering, deduplication, and mapping (_processFinalResults)
class MatchRepository {
  final AniListService _anilistService = AniListService();
  final ShikimoriService _shikimoriService = ShikimoriService();
  final TVmazeService _tvmazeService = TVmazeService();

  /// Cleans technical filename artifacts into a clean search query.
  String cleanFilenameQuery(String raw) {
    var cleaned = raw
        .replaceAll(RegExp(r'\[.*?\]|\(.*?\)', caseSensitive: false), ' ')
        .replaceAll(
            RegExp(r'\.(mp4|mkv|avi|srt|ass|zip|rar|7z|ts|flv|wmv)$',
                caseSensitive: false),
            ' ')
        .replaceAll(
            RegExp(r'[\s\-_.]+(episode|ep|e|part)[\s\-_.]*\d+([\s\-_.]|$)',
                caseSensitive: false),
            ' ')
        .replaceAll(RegExp(r'\s-\s\d+([\s\-_.]|$)'), ' ')
        .replaceAll(RegExp(r'\s[sS]\d+[eE]\d+'), ' ')
        .replaceAll(
            RegExp(
                r'(1080p|720p|480p|2160p|4k|x264|x265|hevc|h264|h265|bluray|bdrip|webrip|web-dl)',
                caseSensitive: false),
            ' ')
        .replaceAll(RegExp(r'[_.\-]'), ' ')
        .trim();

    cleaned = cleaned.replaceAll(RegExp(r'\s+'), ' ');
    return cleaned.length < 2 ? raw : cleaned;
  }

  /// Main entry point for unified metadata search.
  Future<List<MatchMediaItem>> fetchUnifiedMetadata({
    required String query,
    required Set<String> activeIds,
    required bool isCloudSource,
  }) async {
    final cleaned = cleanFilenameQuery(query);
    developer.log('MatchRepository: query="$query" -> cleaned="$cleaned", isCloud=$isCloudSource, activeIds=$activeIds', name: 'MatchRepository');
    if (cleaned.trim().isEmpty) return [];

    // PHASE 1: Calculate request targets (де можна робити запити)
    final targets = _resolveSearchTargets(
      activeIds: activeIds,
      isCloudSource: isCloudSource,
    );

    // PHASE 2: Execute network requests ONLY to allowed targets (запити туди, куди дозволено)
    final searchData = await _executeQueries(
      query: cleaned,
      targets: targets,
    );

    // PHASE 3: Determine primary source priority & merge results (хто головний і об'єднання)
    final rawMergedList = _mergeResultsByPrimaryPriority(
      jimakuList: searchData.jimakuResults,
      providerList: searchData.providerResults,
    );

    // PHASE 4: Process final results (дедуплікація, сувора фільтрація, ранжування та маппінг)
    final results = _processFinalResults(
      rawItems: rawMergedList,
      query: cleaned,
      isCloudSource: isCloudSource,
      activeIds: activeIds,
    );

    developer.log('MatchRepository: Final mapped count=${results.length}', name: 'MatchRepository');
    for (final item in results) {
      developer.log('  -> Card item: "${item.title}" | provider="${item.providerId}" | cover="${item.coverUrl}"', name: 'MatchRepository');
    }

    return results;
  }

  /// PHASE 1: Calculates permitted search targets based on subtitle source and user active selections.
  _SearchTargets _resolveSearchTargets({
    required Set<String> activeIds,
    required bool isCloudSource,
  }) {
    final fetchJimaku = isCloudSource || activeIds.contains('jimaku');
    
    final fetchAniList = activeIds.contains('anilist') || isCloudSource;
    final fetchShikimori = !isCloudSource && activeIds.contains('shikimori');
    final fetchTVmaze = !isCloudSource && activeIds.contains('tvmaze');

    developer.log(
      'MatchRepository [Targets]: Jimaku=$fetchJimaku, AniList=$fetchAniList, Shikimori=$fetchShikimori, TVmaze=$fetchTVmaze',
      name: 'MatchRepository',
    );

    return _SearchTargets(
      fetchJimaku: fetchJimaku,
      fetchAniList: fetchAniList,
      fetchShikimori: fetchShikimori,
      fetchTVmaze: fetchTVmaze,
    );
  }

  /// PHASE 2: Executes requests ONLY to allowed/resolved target services.
  Future<_SearchRawData> _executeQueries({
    required String query,
    required _SearchTargets targets,
  }) async {
    List<UnifiedMetadataDTO> jimakuResults = [];

    // 2a. Fetch Jimaku entries if allowed
    if (targets.fetchJimaku) {
      try {
        final jimakuService = await JimakuService.create();
        jimakuResults = await jimakuService.searchJumakuObjects(query: query);
        developer.log('MatchRepository: Jimaku returned ${jimakuResults.length} items', name: 'MatchRepository');
      } catch (e) {
        developer.log('MatchRepository: Jimaku error: $e', name: 'MatchRepository');
      }
    }

    // 2b. Fetch active metadata providers
    final futures = <Future<List<UnifiedMetadataDTO>>>[];

    if (targets.fetchAniList) {
      futures.add(_anilistService.getByName(query, perPage: 25).catchError((e) {
        developer.log('MatchRepository: AniList error: $e', name: 'MatchRepository');
        return <UnifiedMetadataDTO>[];
      }));
    }

    if (targets.fetchShikimori) {
      futures.add(_shikimoriService.searchAnime(query, limit: 25).catchError((e) {
        developer.log('MatchRepository: Shikimori error: $e', name: 'MatchRepository');
        return <UnifiedMetadataDTO>[];
      }));
    }

    if (targets.fetchTVmaze) {
      futures.add(_tvmazeService.searchShows(query).catchError((e) {
        developer.log('MatchRepository: TVmaze error: $e', name: 'MatchRepository');
        return <UnifiedMetadataDTO>[];
      }));
    }

    // Direct detail queries to AniList for Jimaku entries if AniList target is active
    if (targets.fetchAniList && jimakuResults.isNotEmpty) {
      for (final j in jimakuResults) {
        if (j.anilistId != null) {
          futures.add(_anilistService.getById(j.anilistId!).then((dto) {
            return dto != null ? [dto] : <UnifiedMetadataDTO>[];
          }).catchError((e) {
            developer.log('MatchRepository: AniList getById(${j.anilistId}) error: $e', name: 'MatchRepository');
            return <UnifiedMetadataDTO>[];
          }));
        }
      }
    }

    final responses = await Future.wait(futures);
    final providerResults = <UnifiedMetadataDTO>[];
    final seenKeys = <String>{};

    for (final list in responses) {
      for (final item in list) {
        final key = _getMetadataUniqueKey(item);
        if (!seenKeys.contains(key)) {
          seenKeys.add(key);
          providerResults.add(item);
        }
      }
    }

    return _SearchRawData(
      jimakuResults: jimakuResults,
      providerResults: providerResults,
    );
  }

  /// PHASE 3: Determines primary source priority mode and merges results.
  List<UnifiedMetadataDTO> _mergeResultsByPrimaryPriority({
    required List<UnifiedMetadataDTO> jimakuList,
    required List<UnifiedMetadataDTO> providerList,
  }) {
    final mode = jimakuList.isNotEmpty
        ? _PrimarySourceMode.jimakuBaseWithProviderEnrichment
        : _PrimarySourceMode.providersPrimary;

    developer.log('MatchRepository [PrimaryMode]: $mode', name: 'MatchRepository');

    switch (mode) {
      case _PrimarySourceMode.jimakuBaseWithProviderEnrichment:
        // Jimaku is primary base (preserves subtitle downloads); providers enrich cover photos & extra metadata
        return _enrichJimakuWithProviders(jimakuList, providerList);

      case _PrimarySourceMode.providersPrimary:
        // Metadata providers are primary (Jimaku empty/disabled)
        return providerList;
    }
  }

  /// PHASE 4: Post-processes merged results with deduplication, filtering, and card mapping.
  List<MatchMediaItem> _processFinalResults({
    required List<UnifiedMetadataDTO> rawItems,
    required String query,
    required bool isCloudSource,
    required Set<String> activeIds,
  }) {
    var list = _deduplicateMetadata(rawItems);
    list = _filterAndScoreResults(query, list);

    return list.map((meta) => _mapToMatchItem(meta, isCloudSource, activeIds)).toList();
  }

  /// Unique key for deduplicating raw DTOs before matching.
  String _getMetadataUniqueKey(UnifiedMetadataDTO meta) {
    if (meta.anilistId != null) return 'anilist_${meta.anilistId}';
    if (meta.shikimoriId != null) return 'shikimori_${meta.shikimoriId}';
    if (meta.tvmazeId != null) return 'tvmaze_${meta.tvmazeId}';
    if (meta.malId != null) return 'mal_${meta.malId}';
    return 'source_${meta.sourceId}_${meta.title.toLowerCase().trim()}';
  }

  /// Calculates title similarity score between 0.0 and 1.0.
  double _calculateTitleSimilarity(String title1, String title2) {
    final t1 = title1.toLowerCase().trim();
    final t2 = title2.toLowerCase().trim();

    if (t1 == t2) return 1.0;
    if (t1.contains(t2) || t2.contains(t1)) return 0.8;

    final words1 = t1.split(RegExp(r'\s+')).where((w) => w.length > 1).toSet();
    final words2 = t2.split(RegExp(r'\s+')).where((w) => w.length > 1).toSet();

    if (words1.isEmpty || words2.isEmpty) return 0.0;

    final intersection = words1.intersection(words2);
    final union = words1.union(words2);

    return intersection.length / union.length;
  }

  /// Enriches primary Jimaku entries with cover photos and metadata from providers.
  List<UnifiedMetadataDTO> _enrichJimakuWithProviders(
    List<UnifiedMetadataDTO> jimakuList,
    List<UnifiedMetadataDTO> providerList,
  ) {
    if (jimakuList.isEmpty) return providerList;

    final enriched = <UnifiedMetadataDTO>[];
    final matchedProviderIndices = <int>{};
    final matchedAnilistIds = <int>{};
    final matchedMalIds = <int>{};
    final matchedShikimoriIds = <int>{};
    final matchedTvmazeIds = <int>{};
    final matchedTitles = <String>{};

    for (final j in jimakuList) {
      UnifiedMetadataDTO? bestMatch;
      int bestIndex = -1;
      double highestScore = 0.0;

      for (int i = 0; i < providerList.length; i++) {
        if (matchedProviderIndices.contains(i)) continue;
        final p = providerList[i];

        if (j.anilistId != null && j.anilistId == p.anilistId) {
          bestMatch = p;
          bestIndex = i;
          highestScore = 1.0;
          break;
        }

        final score = _calculateTitleSimilarity(j.title, p.title);
        if (score > highestScore) {
          highestScore = score;
          bestMatch = p;
          bestIndex = i;
        }
      }

      if (bestMatch != null && (highestScore >= 0.2 || (j.anilistId != null && j.anilistId == bestMatch.anilistId))) {
        matchedProviderIndices.add(bestIndex);
        if (bestMatch.anilistId != null) matchedAnilistIds.add(bestMatch.anilistId!);
        if (bestMatch.malId != null) matchedMalIds.add(bestMatch.malId!);
        if (bestMatch.shikimoriId != null) matchedShikimoriIds.add(bestMatch.shikimoriId!);
        if (bestMatch.tvmazeId != null) matchedTvmazeIds.add(bestMatch.tvmazeId!);
        if (bestMatch.title.isNotEmpty) matchedTitles.add(bestMatch.title.toLowerCase().trim());
        if (j.title.isNotEmpty) matchedTitles.add(j.title.toLowerCase().trim());

        developer.log('  -> MATCH FOUND for Jimaku "${j.title}" with "${bestMatch.title}" (score=$highestScore, cover=${bestMatch.imageUrl})', name: 'MatchRepository');
        enriched.add(UnifiedMetadataDTO(
          sourceId: j.sourceId,
          title: j.title,
          subtitle: j.subtitle ?? bestMatch.subtitle,
          originalTitle: j.originalTitle ?? bestMatch.originalTitle,
          anilistId: j.anilistId ?? bestMatch.anilistId,
          malId: j.malId ?? bestMatch.malId,
          tmdbId: j.tmdbId ?? bestMatch.tmdbId,
          shikimoriId: j.shikimoriId ?? bestMatch.shikimoriId,
          tvmazeId: j.tvmazeId ?? bestMatch.tvmazeId,
          type: j.type ?? bestMatch.type,
          episodes: j.episodes ?? bestMatch.episodes,
          score: j.score ?? bestMatch.score,
          imageUrl: bestMatch.imageUrl ?? j.imageUrl,
          imagePath: bestMatch.imagePath ?? j.imagePath,
          linkUrl: j.linkUrl,
          extras: {...j.extras, ...bestMatch.extras},
        ));
      } else {
        developer.log('  -> NO MATCH for Jimaku "${j.title}" (best score=$highestScore)', name: 'MatchRepository');
        enriched.add(j);
      }
    }

    // Add remaining provider items not consumed during Jimaku enrichment
    for (int i = 0; i < providerList.length; i++) {
      if (matchedProviderIndices.contains(i)) continue;
      final p = providerList[i];

      if (p.anilistId != null && matchedAnilistIds.contains(p.anilistId)) continue;
      if (p.malId != null && matchedMalIds.contains(p.malId)) continue;
      if (p.shikimoriId != null && matchedShikimoriIds.contains(p.shikimoriId)) continue;
      if (p.tvmazeId != null && matchedTvmazeIds.contains(p.tvmazeId)) continue;
      if (matchedTitles.contains(p.title.toLowerCase().trim())) continue;

      enriched.add(p);
    }

    return enriched;
  }

  /// Deduplicates metadata items across all provider sources and cross-platform IDs.
  List<UnifiedMetadataDTO> _deduplicateMetadata(List<UnifiedMetadataDTO> items) {
    final result = <UnifiedMetadataDTO>[];
    final seenAnilistIds = <int>{};
    final seenMalIds = <int>{};
    final seenShikimoriIds = <int>{};
    final seenTvmazeIds = <int>{};
    final seenSourceKeys = <String>{};
    final seenNormalizedTitles = <String>{};

    for (final item in items) {
      final sourceKey = '${item.anilistId ?? item.shikimoriId ?? item.tvmazeId ?? item.sourceId}_${item.title.toLowerCase().trim()}';

      if (seenSourceKeys.contains(sourceKey)) continue;

      if (item.anilistId != null && seenAnilistIds.contains(item.anilistId)) continue;
      if (item.malId != null && seenMalIds.contains(item.malId)) continue;
      if (item.shikimoriId != null && seenShikimoriIds.contains(item.shikimoriId)) continue;
      if (item.tvmazeId != null && seenTvmazeIds.contains(item.tvmazeId)) continue;

      final normTitle = item.title.toLowerCase().trim();
      if (normTitle.isNotEmpty && seenNormalizedTitles.contains(normTitle)) continue;

      result.add(item);

      seenSourceKeys.add(sourceKey);
      if (item.anilistId != null) seenAnilistIds.add(item.anilistId!);
      if (item.malId != null) seenMalIds.add(item.malId!);
      if (item.shikimoriId != null) seenShikimoriIds.add(item.shikimoriId!);
      if (item.tvmazeId != null) seenTvmazeIds.add(item.tvmazeId!);
      if (normTitle.isNotEmpty) seenNormalizedTitles.add(normTitle);
    }

    return result;
  }

  String? _cleanImageUrl(String? url) {
    if (url == null || url.trim().isEmpty) return null;
    if (url.contains('missing_original') ||
        url.contains('missing_large') ||
        url.contains('missing_medium')) {
      return null;
    }
    return url;
  }

  /// Filters out irrelevant entries and ranks items by relevance score.
  List<UnifiedMetadataDTO> _filterAndScoreResults(String query, List<UnifiedMetadataDTO> items) {
    final rawQuery = query.toLowerCase().trim();
    final terms = rawQuery
        .split(RegExp(r'[\s\-_\.:;,]+'))
        .where((t) => t.length >= 2)
        .toList();

    if (terms.isEmpty) return items;

    final scoredItems = <Map<String, dynamic>>[];

    for (final rawItem in items) {
      final cleanUrl = _cleanImageUrl(rawItem.imageUrl);
      final item = cleanUrl != rawItem.imageUrl
          ? (cleanUrl == null ? rawItem.copyWith(clearImageUrl: true) : rawItem.copyWith(imageUrl: cleanUrl))
          : rawItem;

      final titleLower = item.title.toLowerCase();
      final subtitleLower = item.subtitle?.toLowerCase() ?? '';
      final originalTitleLower = item.originalTitle?.toLowerCase() ?? '';

      final combinedTitles = '$titleLower $subtitleLower $originalTitleLower';

      double score = 0.0;
      int matchedTermCount = 0;

      for (final term in terms) {
        if (combinedTitles.contains(term)) {
          matchedTermCount++;
          if (titleLower.contains(term)) {
            score += 2.0;
          } else {
            score += 1.0;
          }
        }
      }

      if (titleLower == rawQuery || subtitleLower == rawQuery) {
        score += 10.0;
      }

      final simScore = _calculateTitleSimilarity(query, item.title);
      score += simScore * 5.0;

      if (item.imageUrl != null && item.imageUrl!.isNotEmpty) {
        score += 1.5;
      }

      final isRelevant = matchedTermCount > 0 || simScore >= 0.3 || (item.anilistId != null && item.linkUrl != null);

      if (isRelevant && score > 0.0) {
        scoredItems.add({'item': item, 'score': score});
      }
    }

    scoredItems.sort((a, b) => (b['score'] as double).compareTo(a['score'] as double));

    return scoredItems.map((s) => s['item'] as UnifiedMetadataDTO).toList();
  }

  /// Maps UnifiedMetadataDTO to UI MatchMediaItem with unique ID and accurate provider attribution.
  MatchMediaItem _mapToMatchItem(
    UnifiedMetadataDTO meta,
    bool isCloudSource,
    Set<String> activeIds,
  ) {
    String providerId = 'jimaku.cc';

    if (!isCloudSource) {
      if (meta.shikimoriId != null && activeIds.contains('shikimori')) {
        providerId = 'shikimori';
      } else if (meta.anilistId != null && activeIds.contains('anilist')) {
        providerId = 'anilist';
      } else if (meta.tvmazeId != null && activeIds.contains('tvmaze')) {
        providerId = 'tvmaze';
      } else if (meta.shikimoriId != null) {
        providerId = 'shikimori';
      } else if (meta.anilistId != null) {
        providerId = 'anilist';
      } else if (meta.tvmazeId != null) {
        providerId = 'tvmaze';
      } else {
        providerId = activeIds.isNotEmpty ? activeIds.first : 'jimaku.cc';
      }
    } else {
      providerId = 'jimaku.cc';
    }

    final uniqueId = '${providerId}_${meta.anilistId ?? meta.shikimoriId ?? meta.tvmazeId ?? meta.sourceId}';

    return MatchMediaItem(
      id: uniqueId,
      title: meta.title,
      providerId: providerId,
      kind: meta.type,
      episodes: meta.episodes,
      score: meta.score,
      coverUrl: meta.imageUrl,
      rawMetadata: meta,
    );
  }
}
