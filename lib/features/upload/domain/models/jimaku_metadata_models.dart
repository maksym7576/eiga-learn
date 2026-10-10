class FileJimakuDTO {
  final String name;
  final String url;
  final int size;
  final DateTime lastModified;

  FileJimakuDTO({
    required this.name,
    required this.url,
    required this.size,
    required this.lastModified,
  });

  factory FileJimakuDTO.fromJson(Map<String, dynamic> json) {
    String? rawDate = json['last_modified'] as String?;
    DateTime parsedDate;
    try {
      parsedDate = rawDate != null ? DateTime.parse(rawDate) : DateTime.now();
    } catch (_) {
      parsedDate = DateTime.now();
    }

    return FileJimakuDTO(
      name: json['name'] as String? ??
          json['filename'] as String? ??
          json['display_name'] as String? ??
          'Unknown file',
      url: json['url'] as String? ?? '',
      size: json['size'] as int? ?? 0,
      lastModified: parsedDate,
    );
  }
}

class JimakuGroup {
  final String name;
  final List<FileJimakuDTO> files;
  bool isExpanded;

  JimakuGroup({
    required this.name,
    required this.files,
    this.isExpanded = false,
  });
}

class JimakuFileOrGroupDTO {
  final FileJimakuDTO? file;
  final JimakuGroup? group;

  JimakuFileOrGroupDTO({this.file, this.group});

  bool get isGroup => group != null;
  bool get isFile => file != null;

  String get id => isGroup ? 'group_${group!.name}' : file!.url;
  String get name => isGroup ? group!.name : file!.name;
}

class UnifiedMetadataDTO {
  final String sourceId;
  final String title;
  final String? subtitle;
  final String? originalTitle;
  final String? description;
  final String? imageUrl;
  final String? imagePath; // Local cache path
  final String? bannerUrl;
  final String? bannerPath; // Local cache path
  final int? episodes;
  final List<String> genres;
  final String? type;
  final String? status;
  final double? score;
  final int? colorThemeValue;
  final String? linkUrl;
  
  // Cross-platform IDs
  final int? anilistId;
  final int? malId;
  final int? tvmazeId;
  final int? shikimoriId;
  final int? jimakuId;
  final String? tmdbId;
  final String? imdbId;
  final String? thetvdbId;

  // New unified lists
  final List<MediaEpisodeDTO>? episodesList;
  final List<MediaCastDTO>? cast;
  
  // Technical/Internal
  final Map<String, dynamic> extras;

  const UnifiedMetadataDTO({
    required this.sourceId,
    required this.title,
    this.subtitle,
    this.originalTitle,
    this.description,
    this.imageUrl,
    this.imagePath,
    this.bannerUrl,
    this.bannerPath,
    this.episodes,
    this.genres = const [],
    this.type,
    this.status,
    this.score,
    this.colorThemeValue,
    this.linkUrl,
    this.anilistId,
    this.malId,
    this.tvmazeId,
    this.shikimoriId,
    this.jimakuId,
    this.tmdbId,
    this.imdbId,
    this.thetvdbId,
    this.episodesList,
    this.cast,
    this.extras = const {},
  });

  UnifiedMetadataDTO copyWith({
    String? imageUrl,
    bool? clearImageUrl,
    String? imagePath,
    String? bannerPath,
    int? episodes,
    int? jimakuId,
    List<MediaEpisodeDTO>? episodesList,
    List<MediaCastDTO>? cast,
    Map<String, dynamic>? extras,
  }) {
    return UnifiedMetadataDTO(
      sourceId: sourceId,
      title: title,
      subtitle: subtitle,
      originalTitle: originalTitle,
      description: description,
      imageUrl: clearImageUrl == true ? null : (imageUrl ?? this.imageUrl),
      imagePath: imagePath ?? this.imagePath,
      bannerUrl: bannerUrl,
      bannerPath: bannerPath ?? this.bannerPath,
      episodes: episodes ?? this.episodes,
      genres: genres,
      type: type,
      status: status,
      score: score,
      colorThemeValue: colorThemeValue,
      linkUrl: linkUrl,
      anilistId: anilistId,
      malId: malId,
      tvmazeId: tvmazeId,
      shikimoriId: shikimoriId,
      jimakuId: jimakuId ?? this.jimakuId,
      tmdbId: tmdbId,
      imdbId: imdbId,
      thetvdbId: thetvdbId,
      episodesList: episodesList ?? this.episodesList,
      cast: cast ?? this.cast,
      extras: extras ?? this.extras,
    );
  }
}

class MediaEpisodeDTO {
  final int id;
  final String? name;
  final int? season;
  final int? number;
  final String? type;
  final String? airdate;
  final String? airtime;
  final int? runtime;
  final String? summary;
  final String? imageUrl;

  const MediaEpisodeDTO({
    required this.id,
    this.name,
    this.season,
    this.number,
    this.type,
    this.airdate,
    this.airtime,
    this.runtime,
    this.summary,
    this.imageUrl,
  });

  factory MediaEpisodeDTO.fromJson(Map<String, dynamic> json) {
    final image = json['image'] as Map<String, dynamic>?;
    return MediaEpisodeDTO(
      id: json['id'] as int,
      name: json['name'] as String?,
      season: json['season'] as int?,
      number: json['number'] as int?,
      type: json['type'] as String?,
      airdate: json['airdate'] as String?,
      airtime: json['airtime'] as String?,
      runtime: json['runtime'] as int?,
      summary: json['summary'] as String?,
      imageUrl: image?['medium'] ?? image?['original'],
    );
  }
}

class MediaCastDTO {
  final int personId;
  final String personName;
  final String? personImageUrl;
  final int? characterId;
  final String? characterName;
  final bool boolVal = false, voiceVal = false;
  final bool self;
  final bool voice;

  const MediaCastDTO({
    required this.personId,
    required this.personName,
    this.personImageUrl,
    this.characterId,
    this.characterName,
    this.self = false,
    this.voice = false,
  });

  factory MediaCastDTO.fromJson(Map<String, dynamic> json) {
    final person = json['person'] as Map<String, dynamic>?;
    final character = json['character'] as Map<String, dynamic>?;
    final image = person?['image'] as Map<String, dynamic>?;
    return MediaCastDTO(
      personId: person?['id'] as int? ?? 0,
      personName: person?['name'] as String? ?? '',
      personImageUrl: image?['medium'] ?? image?['original'],
      characterId: character?['id'] as int?,
      characterName: character?['name'] as String?,
      self: json['self'] as bool? ?? false,
      voice: json['voice'] as bool? ?? false,
    );
  }
}

class NoMetadataDTO {
  const NoMetadataDTO();
}
