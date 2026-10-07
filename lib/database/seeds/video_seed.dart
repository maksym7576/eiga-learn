import '../models/video.dart';
import '../embedded/video_metadata.dart';
import '../embedded/sync_meta.dart';
import '../../data/repositories/video_repository.dart';

class VideoSeed {
  static List<Video> get sampleVideos => [
        Video()
          ..videoPath = 'sample_kimi_no_nawa.mp4'
          ..coverImagePath = r'C:\Users\fcjhx\Downloads\photo 1.webp'
          ..originalLanguage = 'ja'
          ..translatedLanguage = 'uk'
          ..isCached = true
          ..subtitleScans = []
          ..metadata = (VideoMetadata()
            ..name = 'Kimi no Na wa. (Your Name)'
            ..description = 'Director’s Cut with Commentary and Extended Epilogue'
            ..size = 1.4
            ..duration = 6480000 // ms
            ..episode = 1
            ..createdAt = DateTime.now())
          ..sync = (SyncMeta()
            ..syncId = 'sync_kimi'
            ..ownerId = 'local'
            ..isSynced = true
            ..updatedAt = DateTime.now()),
        Video()
          ..videoPath = 'sample_tenki_no_ko.mp4'
          ..coverImagePath = r'C:\Users\fcjhx\Downloads\phroto 2.webp'
          ..originalLanguage = 'ja'
          ..translatedLanguage = 'uk'
          ..isCached = true
          ..subtitleScans = []
          ..metadata = (VideoMetadata()
            ..name = 'Tenki no Ko (Weathering With You)'
            ..description = 'Weathering With You movie file'
            ..size = 1.1
            ..duration = 6600000
            ..episode = 4
            ..createdAt = DateTime.now())
          ..sync = (SyncMeta()
            ..syncId = 'sync_tenki'
            ..ownerId = 'local'
            ..isSynced = true
            ..updatedAt = DateTime.now()),
        Video()
          ..videoPath = 'sample_suzume.mp4'
          ..coverImagePath = null // тестимо CoverPlaceholder з логотипом
          ..originalLanguage = 'ja'
          ..translatedLanguage = 'uk'
          ..isCached = false
          ..subtitleScans = []
          ..metadata = (VideoMetadata()
            ..name = 'Suzume no Tojimari'
            ..description = 'Not cached yet'
            ..size = 0.0
            ..duration = 7200000
            ..episode = null
            ..createdAt = DateTime.now())
          ..sync = (SyncMeta()
            ..syncId = 'sync_suzume'
            ..ownerId = 'local'
            ..isSynced = false
            ..updatedAt = DateTime.now()),
      ];

  static Future<void> seedIfEmpty(VideoRepository repository) async {
    final existing = await repository.getAll();
    if (existing.isEmpty) {
      await repository.saveAll(sampleVideos);
    }
  }
}
