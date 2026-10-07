import 'package:isar_community/isar.dart';
import '../../database/models/video.dart';

class VideoRepository {
  VideoRepository(this.isar);

  final Isar isar;

  /// CRUD: Save / Update video
  Future<void> save(Video video) async {
    await isar.writeTxn(() async {
      await isar.videos.put(video);
    });
  }

  /// CRUD: Save multiple videos (for seeding/bulk)
  Future<void> saveAll(List<Video> videos) async {
    await isar.writeTxn(() async {
      await isar.videos.putAll(videos);
    });
  }

  /// CRUD: Get video by ID
  Future<Video?> getById(Id id) async {
    return await isar.videos.get(id);
  }

  /// Get all videos
  Future<List<Video>> getAll() async {
    return await isar.videos.where().findAll();
  }

  /// Watch all videos in real-time (with fireImmediately: true)
  Stream<List<Video>> watchAll() {
    return isar.videos.where().watch(fireImmediately: true);
  }

  /// CRUD: Delete video by ID
  Future<bool> delete(Id id) async {
    return await isar.writeTxn(() async {
      return await isar.videos.delete(id);
    });
  }

  /// Clear all videos
  Future<void> clear() async {
    await isar.writeTxn(() async {
      await isar.videos.clear();
    });
  }
}
