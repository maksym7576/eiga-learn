enum PlanningMode { observe, all, retry, rerender }

class BatchRequest {
  BatchRequest({
    required this.videoId,
    required this.pipelineId,
    required this.mode,
    this.playerPositionMs,
    this.priority = 0,
    this.targetPhraseIds,
    this.targetStepId,
  });

  final int videoId;
  final String pipelineId;
  final PlanningMode mode;
  final int? playerPositionMs;
  final int priority;
  final List<int>? targetPhraseIds;
  final String? targetStepId;
}
