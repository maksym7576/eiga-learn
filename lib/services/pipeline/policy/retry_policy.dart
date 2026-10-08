import '../models/model_stats_service.dart';
import 'failure_type.dart';

enum RetryAction { retry, changeModel, splitBatch, stop }

class RetryPolicy {
  RetryPolicy(this.statsService);
  final ModelStatsService statsService;

  RetryAction decide({
    required FailureType failureType,
    required int attempt,
    required int batchSize,
  }) {
    if (attempt > 3) {
      return RetryAction.stop;
    }
    switch (failureType) {
      case FailureType.rateLimit:
      case FailureType.timeout:
      case FailureType.networkError:
        return RetryAction.retry;
      case FailureType.badFormat:
      case FailureType.contextLengthExceeded:
        if (batchSize > 1) {
          return RetryAction.splitBatch;
        }
        return RetryAction.changeModel;
      case FailureType.quotaExceeded:
      case FailureType.noApiKey:
        return RetryAction.stop;
      case FailureType.unknown:
        return RetryAction.retry;
    }
  }
}
