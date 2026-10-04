import 'package:isar_community/isar.dart';

part 'video_metadata.g.dart';

@embedded
class VideoMetadata {
  String? name;
  int? season;
  int? episode;
  String? description;
  DateTime? createdAt;
  String? videoFileName;
  String? subtitleFileName;
  String? metadataSource;
  String? metadataSourceId;
  String? subtitleMethodUsed;
  String? subtitleSourceId;
  String? videoSource;
  int? duration; // мс
  double? size;
}
