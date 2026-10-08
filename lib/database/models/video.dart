import 'package:isar_community/isar.dart';
import '../embedded/sync_meta.dart';
import '../embedded/video_metadata.dart';
import '../embedded/subtitle_scan.dart';
import '../embedded/research_information.dart';

part 'video.g.dart';

@collection
class Video {
  Id id = Isar.autoIncrement;

  String? coverImagePath;
  String? videoPath;
  String? subtitlePath;

  late String originalLanguage;
  late String translatedLanguage;

  String? pipelineIdentifier;
  String? primaryAudio;

  bool isCached = false;
  int? lastVideoPosition; // мс
  bool isResearchDone = false;
  ResearchInformation? researchInformation;

  String? pipelineVersion;
  DateTime? lastProcessedAt;

  late VideoMetadata metadata;
  List<SubtitleScan> subtitleScans = [];

  late SyncMeta sync;
}
