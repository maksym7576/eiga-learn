import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/shared/player/active_player_provider.dart';
import 'package:eiga/shared/widgets/cards/glass_card.dart';
import 'package:eiga/features/upload/domain/models/match_models.dart';
import 'package:eiga/features/upload/presentation/providers/upload_match_provider.dart';
import 'package:eiga/features/upload/presentation/widgets/match/match_accordion_picker.dart';
import 'package:eiga/features/upload/presentation/widgets/match/match_banner.dart';
import 'package:eiga/features/upload/presentation/widgets/match/match_manual_section.dart';
import 'package:eiga/features/upload/presentation/widgets/match/match_search_section.dart';
import 'package:eiga/features/upload/presentation/widgets/match/match_segmented_control.dart';

class MatchUploadSubScreen extends ConsumerStatefulWidget {
  const MatchUploadSubScreen({super.key});

  @override
  ConsumerState<MatchUploadSubScreen> createState() =>
      _MatchUploadSubScreenState();
}

class _MatchUploadSubScreenState extends ConsumerState<MatchUploadSubScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final matchState = ref.read(uploadMatchProvider);
      final playerState = ref.read(activePlayerProvider);

      if (matchState.searchQuery.isEmpty && playerState.videoPath != null) {
        final fileName = playerState.videoPath!.split(RegExp(r'[\\/]')).last;
        ref.read(uploadMatchProvider.notifier).performSearch(fileName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final matchState = ref.watch(uploadMatchProvider);
    final matchNotifier = ref.read(uploadMatchProvider.notifier);
    final isCloudSource = matchState.selectedSubtitleSourceId == 'cloud';

    return AppGlassCard(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          const Text(
            'Media Match',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Find the series or movie so subtitles and cover match automatically.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.60),
            ),
          ),
          const SizedBox(height: 24),

          // 1. Metadata Section (Providers)
          _buildSectionLabel('Metadata'),
          const SizedBox(height: 8),
          MatchSegmentedControl(
            mode: matchState.mode,
            onModeChanged: (MatchMode mode) => matchNotifier.setMode(mode),
          ),

          if (matchState.mode == MatchMode.search) ...[
            const SizedBox(height: 12),
            _buildSubLabel('Search in'),
            const SizedBox(height: 8),
            MatchAccordionPicker(
              items: MatchProviderItem.defaultProviders.map((p) {
                return MatchAccordionItemData(
                  id: p.id,
                  title: p.name,
                  shortCode: p.shortCode,
                  color: p.primaryColor,
                );
              }).toList(),
              selectedIds: matchState.selectedProviderIds,
              isSingleSelect: false,
              unitLabel: 'providers',
              onSelectionChanged: (selected) {
                matchNotifier.setSelectedProviders(selected);
              },
            ),
          ] else ...[
            const SizedBox(height: 8),
            Text(
              'No online search: you type the title and choose a cover. Switch to “Search online” anytime.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.50),
                height: 1.4,
              ),
            ),
          ],

          const SizedBox(height: 24),

          // 2. Subtitle Source Section
          _buildSectionLabel('Subtitle source'),
          const SizedBox(height: 8),
          MatchAccordionPicker(
            items: (matchState.mode == MatchMode.manual
                    ? MatchSubtitleSourceItem.manualSources
                    : MatchSubtitleSourceItem.defaultSources)
                .map((s) {
              return MatchAccordionItemData(
                id: s.id,
                title: s.title,
                description: s.description,
                icon: s.icon,
              );
            }).toList(),
            selectedIds: {matchState.selectedSubtitleSourceId},
            isSingleSelect: true,
            unitLabel: 'source',
            onSelectionChanged: (selected) {
              if (selected.isNotEmpty) {
                matchNotifier.setSubtitleSource(selected.first);
              }
            },
          ),

          // Info banner if source has specific instructions
          _buildSubtitleSourceInfoBanner(matchState.selectedSubtitleSourceId),

          // Cloud Libraries multi-select if 'cloud' is selected (Visible when Cloud is active)
          if (isCloudSource) ...[
            const SizedBox(height: 12),
            _buildSubLabel('Search in'),
            const SizedBox(height: 8),
            MatchAccordionPicker(
              items: MatchCloudLibraryItem.defaultLibraries.map((lib) {
                return MatchAccordionItemData(
                  id: lib.id,
                  title: lib.name,
                  description: lib.description,
                  icon: Icons.cloud_outlined,
                );
              }).toList(),
              selectedIds: matchState.selectedCloudLibraryIds,
              isSingleSelect: false,
              unitLabel: 'libraries',
              onSelectionChanged: (selected) {
                matchNotifier.setCloudLibraries(selected);
              },
            ),
          ],

          const SizedBox(height: 24),

          // 3. Search Section / Manual Section
          if (matchState.mode == MatchMode.search)
            MatchSearchSection(
              searchQuery: matchState.searchQuery,
              searchResults: matchState.searchResults,
              selectedMedia: matchState.selectedMedia,
              isLoading: matchState.isLoading,
              errorMessage: matchState.errorMessage,
              selectedProviderIds: isCloudSource
                  ? matchState.selectedCloudLibraryIds
                  : matchState.selectedProviderIds,
              onQueryChanged: (q) => matchNotifier.setSearchQuery(q),
              onSearchSubmitted: () => matchNotifier.performSearch(),
              onMediaSelected: (MatchMediaItem media) =>
                  matchNotifier.selectMedia(media),
            )
          else
            MatchManualSection(
              title: matchState.manualTitle,
              onTitleChanged: (t) => matchNotifier.setManualTitle(t),
            ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.8,
        color: Colors.white.withOpacity(0.50),
      ),
    );
  }

  Widget _buildSubLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.6,
        color: Colors.white.withOpacity(0.50),
      ),
    );
  }

  Widget _buildSubtitleSourceInfoBanner(String sourceId) {
    final source = MatchSubtitleSourceItem.defaultSources.firstWhere(
      (s) => s.id == sourceId,
      orElse: () => MatchSubtitleSourceItem.defaultSources.first,
    );

    if (source.infoText == null || sourceId == 'cloud') {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: MatchBanner(
        text: source.infoText!,
        type: MatchBannerType.info,
      ),
    );
  }
}
