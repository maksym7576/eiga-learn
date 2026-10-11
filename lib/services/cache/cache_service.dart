import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:isar_community/isar.dart';
import '../../database/models/language_profile.dart';

enum CacheType { jimaku, photo, video, metadata }

class CacheConfig {
  final String folderName;
  final Duration? ttl;
  final bool useTemporaryDirectory;

  const CacheConfig({
    required this.folderName,
    required this.ttl,
    required this.useTemporaryDirectory,
  });
}

class CacheService {
  final String? profileId;

  CacheService({this.profileId});

  static const Map<CacheType, CacheConfig> _configs = {
    CacheType.jimaku: CacheConfig(
      folderName: 'jimaku_cache',
      ttl: Duration(hours: 24),
      useTemporaryDirectory: true,
    ),
    CacheType.photo: CacheConfig(
      folderName: 'photo_cache',
      ttl: null, // Unlimited
      useTemporaryDirectory: false,
    ),
    CacheType.video: CacheConfig(
      folderName: 'video_cache',
      ttl: null, // Unlimited
      useTemporaryDirectory: false,
    ),
    CacheType.metadata: CacheConfig(
      folderName: 'metadata_cache',
      ttl: Duration(hours: 24),
      useTemporaryDirectory: true,
    ),
  };

  Future<String> _getCurrentProfileId() async {
    if (profileId != null && profileId!.isNotEmpty) {
      return profileId!;
    }
    try {
      final meta = Isar.getInstance('meta');
      if (meta != null) {
        final activeProfile = await meta.languageProfiles.filter().isActiveEqualTo(true).findFirst();
        if (activeProfile?.dbName != null) {
          return activeProfile!.dbName!;
        }
      }
    } catch (_) {}
    return 'default';
  }

  Future<Directory> _getCacheDirectory(CacheType type) async {
    final config = _configs[type]!;
    final baseDir = config.useTemporaryDirectory
        ? await getTemporaryDirectory()
        : await getApplicationDocumentsDirectory();

    // Bind cache folder to specific profile ID
    final currentProfileId = await _getCurrentProfileId();
    final dir = Directory(p.join(baseDir.path, currentProfileId, config.folderName));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  /// Caches an existing file or a newly downloaded file into the specified cache category.
  Future<String> cacheFile(
    File file,
    CacheType type, {
    String? preferredName,
  }) async {
    if (!await file.exists()) {
      throw Exception('Source file does not exist');
    }

    final cacheDir = await _getCacheDirectory(type);
    final fileName =
        preferredName ??
        '${DateTime.now().microsecondsSinceEpoch}_${p.basename(file.path)}';
    final targetPath = p.join(cacheDir.path, fileName);

    await file.copy(targetPath);

    return targetPath;
  }

  /// Finds a video file on the device and caches it into the profile's video cache folder.
  Future<String?> cacheVideoFromDevice(String filePath, {String? preferredName}) async {
    final file = File(filePath);
    if (!await file.exists()) {
      return null;
    }
    return await cacheFile(file, CacheType.video, preferredName: preferredName);
  }

  /// Caches bytes directly into the specified cache category.
  Future<String> cacheBytes(
    List<int> bytes,
    CacheType type,
    String name,
  ) async {
    final cacheDir = await _getCacheDirectory(type);
    final targetPath = p.join(cacheDir.path, name);
    final targetFile = File(targetPath);
    await targetFile.writeAsBytes(bytes);
    return targetPath;
  }

  Future<String> cacheStream(
    Stream<List<int>> bytes,
    CacheType type,
    String name, {
    required int expectedLength,
    void Function(int receivedBytes)? onProgress,
  }) async {
    final cacheDir = await _getCacheDirectory(type);
    final targetPath = p.join(cacheDir.path, name);
    final targetFile = File(targetPath);
    final sink = targetFile.openWrite();
    var receivedBytes = 0;
    var sinkClosed = false;
    try {
      await for (final chunk in bytes) {
        receivedBytes += chunk.length;
        sink.add(chunk);
        onProgress?.call(receivedBytes);
      }
      await sink.flush();
      await sink.close();
      sinkClosed = true;
      if (receivedBytes != expectedLength) {
        throw FileSystemException(
          'Incomplete cache transfer: expected $expectedLength bytes, received $receivedBytes',
          targetPath,
        );
      }
      return targetPath;
    } catch (_) {
      if (!sinkClosed) await sink.close();
      if (await targetFile.exists()) {
        await targetFile.delete();
      }
      rethrow;
    }
  }

  /// Returns the file path if it already exists and hasn't expired.
  Future<String?> getCachedFilePath(CacheType type, String name) async {
    final cacheDir = await _getCacheDirectory(type);
    final targetPath = p.join(cacheDir.path, name);
    final targetFile = File(targetPath);

    if (await targetFile.exists()) {
      final config = _configs[type]!;
      if (config.ttl != null) {
        final stat = await targetFile.stat();
        if (DateTime.now().difference(stat.modified) > config.ttl!) {
          await targetFile.delete();
          return null;
        }
      }
      return targetPath;
    }
    return null;
  }

  /// Caches a string (like JSON metadata) directly into the specified cache category.
  Future<void> cacheString(String content, CacheType type, String name) async {
    final cacheDir = await _getCacheDirectory(type);
    final targetPath = p.join(cacheDir.path, name);
    final targetFile = File(targetPath);
    await targetFile.writeAsString(content);
  }

  /// Retrieves a cached string if it exists and hasn't expired.
  Future<String?> getCachedString(CacheType type, String name) async {
    final cacheDir = await _getCacheDirectory(type);
    final targetPath = p.join(cacheDir.path, name);
    final targetFile = File(targetPath);

    if (await targetFile.exists()) {
      final config = _configs[type]!;
      if (config.ttl != null) {
        final stat = await targetFile.stat();
        if (DateTime.now().difference(stat.modified) > config.ttl!) {
          await targetFile.delete();
          return null;
        }
      }
      return await targetFile.readAsString();
    }
    return null;
  }

  /// Calculates the total size occupied by a specific cache type in bytes for this profile.
  Future<int> getCacheSize(CacheType type) async {
    try {
      final cacheDir = await _getCacheDirectory(type);
      int totalSize = 0;
      if (await cacheDir.exists()) {
        await for (final entry in cacheDir.list(
          recursive: true,
          followLinks: false,
        )) {
          if (entry is File) {
            totalSize += await entry.length();
          }
        }
      }
      return totalSize;
    } catch (_) {
      return 0;
    }
  }

  /// Clears all files inside the specified cache type directory for this profile.
  Future<void> clearCache(CacheType type) async {
    try {
      final cacheDir = await _getCacheDirectory(type);
      if (await cacheDir.exists()) {
        await cacheDir.delete(recursive: true);
      }
    } catch (_) {}
  }

  /// Clears all caches for this profile.
  Future<void> clearAllProfileCache() async {
    for (final type in CacheType.values) {
      await clearCache(type);
    }
  }

  /// Cleans up any expired files across all cache categories that have a TTL for this profile.
  Future<void> cleanExpiredCache() async {
    final now = DateTime.now();
    for (final type in CacheType.values) {
      final config = _configs[type]!;
      if (config.ttl == null) continue;

      try {
        final cacheDir = await _getCacheDirectory(type);
        if (await cacheDir.exists()) {
          await for (final entry in cacheDir.list()) {
            if (entry is File) {
              final stat = await entry.stat();
              if (now.difference(stat.modified) > config.ttl!) {
                await entry.delete();
              }
            }
          }
        }
      } catch (_) {}
    }
  }
}
