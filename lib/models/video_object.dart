import 'package:hive/hive.dart';
part 'video_object.g.dart';

@HiveType(typeId: 6)
class video_object extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String videoPath;

  @HiveField(2)
  String? srtPath;

  @HiveField(3)
  DateTime? createdAt;

  @HiveField(4)
  String? thumbnailPath;

  video_object({
    required this.name,
    required this.videoPath,
    required this.srtPath,
    required this.createdAt,
    this.thumbnailPath,
  });

}