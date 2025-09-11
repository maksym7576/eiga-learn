
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class thumbnail_service {
  Future<String?> generateThumbnail(String videoPath) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final thumbnailPath = '${tempDir.path}/${path.basename(videoPath)}.png';

      final fileName = await VideoThumbnail.thumbnailFile(
          video: videoPath,
      thumbnailPath: tempDir.path,
      imageFormat: ImageFormat.PNG,
      maxHeight: 200,
      quality: 75,
      timeMs: 0,
      );
      return fileName;
    } catch (e) {
      print('Error generate an image: $e');
      return null;
    }
  }
}