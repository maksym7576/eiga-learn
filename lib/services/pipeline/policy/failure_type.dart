enum FailureType {
  rateLimit,
  quotaExceeded,
  badFormat,
  networkError,
  noApiKey,
  timeout,
  contextLengthExceeded,
  unknown,
}

FailureType parseFailureType(String? errorType, int? httpCode, String? message) {
  if (httpCode == 429) return FailureType.rateLimit;
  if (httpCode == 403 || (message?.toLowerCase().contains('quota') ?? false)) {
    return FailureType.quotaExceeded;
  }
  if (httpCode == 401 || (message?.toLowerCase().contains('api key') ?? false)) {
    return FailureType.noApiKey;
  }
  if (errorType == 'timeout' || httpCode == 408) return FailureType.timeout;
  if (errorType == 'bad_json' || errorType == 'format') return FailureType.badFormat;
  if (errorType == 'context_length_exceeded' || (message?.toLowerCase().contains('context') ?? false)) {
    return FailureType.contextLengthExceeded;
  }
  if (errorType == 'network' || httpCode == null || httpCode >= 500) {
    return FailureType.networkError;
  }
  return FailureType.unknown;
}
