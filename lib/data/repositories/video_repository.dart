import 'package:isar_community/isar.dart';
import '../../database/models/video.dart';
import 'base_repository.dart';

class VideoRepository extends BaseRepository<Video> {
  VideoRepository(super.isar);

  @override
  IsarCollection<Video> get collection => isar.videos;

  Stream<Video?> watchById(Id id) {
    return isar.videos.watchObject(id, fireImmediately: true);
  }

  Future<List<Video>> getByPipeline(String pipelineId) async {
    return await isar.videos.filter().pipelineIdentifierEqualTo(pipelineId).findAll();
  }
}
