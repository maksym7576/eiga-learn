import 'package:flutter/material.dart';
import 'jimaku_metadata_models.dart';

enum MatchMode {
  search,
  manual,
}

enum CoverSource {
  automatic,
  device,
}

class MatchMediaItem {
  final String id;
  final String title;
  final String providerId;
  final String? kind;
  final int? episodes;
  final double? score;
  final String? coverUrl;
  final List<Color>? coverGradient;
  final UnifiedMetadataDTO? rawMetadata;

  const MatchMediaItem({
    required this.id,
    required this.title,
    required this.providerId,
    this.kind,
    this.episodes,
    this.score,
    this.coverUrl,
    this.coverGradient,
    this.rawMetadata,
  });

  String get providerName {
    final provider = MatchProviderItem.defaultProviders.firstWhere(
      (p) => p.id == providerId,
      orElse: () => MatchProviderItem(
        id: providerId,
        name: providerId.toUpperCase(),
        shortCode: providerId.substring(0, 1).toUpperCase(),
        primaryColor: const Color(0xFF67E8F9),
        secondaryColor: const Color(0xFF38BDF8),
      ),
    );
    return provider.name;
  }
}

class MatchProviderItem {
  final String id;
  final String name;
  final String shortCode;
  final Color primaryColor;
  final Color secondaryColor;

  const MatchProviderItem({
    required this.id,
    required this.name,
    required this.shortCode,
    required this.primaryColor,
    required this.secondaryColor,
  });

  static const List<MatchProviderItem> defaultProviders = [
    MatchProviderItem(
      id: 'anilist',
      name: 'AniList',
      shortCode: 'A',
      primaryColor: Color(0xFF02A9FF),
      secondaryColor: Color(0xFF0075FF),
    ),
    MatchProviderItem(
      id: 'tvmaze',
      name: 'TVmaze',
      shortCode: 'T',
      primaryColor: Color(0xFF3C948B),
      secondaryColor: Color(0xFF19504B),
    ),
    MatchProviderItem(
      id: 'shikimori',
      name: 'Shikimori',
      shortCode: 'S',
      primaryColor: Color(0xFFD62B2B),
      secondaryColor: Color(0xFF8F1919),
    ),
  ];
}

class MatchSubtitleSourceItem {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final String? infoText;

  const MatchSubtitleSourceItem({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.infoText,
  });

  static const List<MatchSubtitleSourceItem> defaultSources = [
    MatchSubtitleSourceItem(
      id: 'ai',
      title: 'Generate from audio',
      description: 'AI transcription',
      icon: Icons.auto_awesome_rounded,
      infoText: 'Subtitles will be generated automatically from the video’s audio.',
    ),
    MatchSubtitleSourceItem(
      id: 'local',
      title: 'Local file',
      description: 'Pick .srt / .ass',
      icon: Icons.insert_drive_file_rounded,
      infoText: 'You will select a .srt or .ass file on the next step.',
    ),
    MatchSubtitleSourceItem(
      id: 'cloud',
      title: 'Cloud libraries',
      description: 'Search several services at once',
      icon: Icons.cloud_outlined,
    ),
  ];

  static const List<MatchSubtitleSourceItem> manualSources = [
    MatchSubtitleSourceItem(
      id: 'ai',
      title: 'Generate from audio',
      description: 'AI transcription',
      icon: Icons.auto_awesome_rounded,
      infoText: 'Subtitles will be generated automatically from the video’s audio.',
    ),
    MatchSubtitleSourceItem(
      id: 'local',
      title: 'Local file',
      description: 'Pick .srt / .ass',
      icon: Icons.insert_drive_file_rounded,
      infoText: 'You will select a .srt or .ass file on the next step.',
    ),
  ];
}

class MatchCloudLibraryItem {
  final String id;
  final String name;
  final String description;

  const MatchCloudLibraryItem({
    required this.id,
    required this.name,
    this.description = 'Cloud library',
  });

  static const List<MatchCloudLibraryItem> defaultLibraries = [
    MatchCloudLibraryItem(id: 'jimaku', name: 'Jimaku'),
    MatchCloudLibraryItem(id: 'opensubtitles', name: 'OpenSubtitles'),
    MatchCloudLibraryItem(id: 'kitsunekko', name: 'Kitsunekko'),
    MatchCloudLibraryItem(id: 'subdl', name: 'SubDL'),
    MatchCloudLibraryItem(id: 'subscene', name: 'Subscene'),
  ];
}
