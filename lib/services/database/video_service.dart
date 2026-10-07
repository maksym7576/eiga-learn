import 'package:isar_community/isar.dart';
import '../../data/repositories/video_repository.dart';
import '../../database/models/video.dart';
import '../../database/embedded/video_metadata.dart';
import '../../database/embedded/sync_meta.dart';
import '../../database/embedded/subtitle_scan.dart';

class VideoService {
  VideoService(this.repository);

  final VideoRepository repository;

  Future<void> saveVideo(Video video) => repository.save(video);

  Future<void> saveVideos(List<Video> videos) => repository.saveAll(videos);

  Future<Video?> getById(Id id) => repository.getById(id);

  Future<List<Video>> getAll() => repository.getAll();

  /// Watch all videos in real-time
  Stream<List<Video>> watchAll() => repository.watchAll();

  Future<bool> delete(Id id) => repository.delete(id);

  /// Helper to create and save a video object
  Future<Video> createVideo({
    String? title,
    String? videoPath,
    String? coverImagePath,
    String? subtitlePath,
    required String originalLanguage,
    required String translatedLanguage,
    bool isCached = false,
    double? size,
    int? duration,
    List<SubtitleScan> subtitleScans = const [],
  }) async {
    final video = Video()
      ..videoPath = videoPath
      ..coverImagePath = coverImagePath
      ..subtitlePath = subtitlePath
      ..originalLanguage = originalLanguage
      ..translatedLanguage = translatedLanguage
      ..isCached = isCached
      ..subtitleScans = subtitleScans
      ..metadata = (VideoMetadata()
        ..name = title ?? 'Untitled Video'
        ..size = size
        ..duration = duration
        ..createdAt = DateTime.now())
      ..sync = (SyncMeta()
        ..syncId = DateTime.now().millisecondsSinceEpoch.toString()
        ..ownerId = 'local'
        ..isSynced = false
        ..updatedAt = DateTime.now());

    await repository.save(video);
    return video;
  }
}
