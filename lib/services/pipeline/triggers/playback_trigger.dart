import '../pipeline_service.dart';

class PlaybackTrigger {
  PlaybackTrigger(this.pipelineService);
  final PipelineService pipelineService;

  int? _lastProcessedPosition;

  void onPositionChanged(int videoId, int positionMs) {
    if (_lastProcessedPosition == null || (positionMs - _lastProcessedPosition!).abs() > 3000) {
      _lastProcessedPosition = positionMs;
      pipelineService.requestObserve(videoId, positionMs);
    }
  }

  void onVideoChanged(int videoId) {
    _lastProcessedPosition = null;
  }
}
