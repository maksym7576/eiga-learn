import '../policy/failure_type.dart';

class StepOutcome {
  StepOutcome.success({this.acceptedPhrasesCount = 0})
      : isSuccess = true,
        isPartial = false,
        failureType = null,
        errorMessage = null;

  StepOutcome.partial({required this.acceptedPhrasesCount, required this.errorMessage})
      : isSuccess = false,
        isPartial = true,
        failureType = null;

  StepOutcome.failure({required this.failureType, required this.errorMessage})
      : isSuccess = false,
        isPartial = false,
        acceptedPhrasesCount = 0;

  final bool isSuccess;
  final bool isPartial;
  final int acceptedPhrasesCount;
  final FailureType? failureType;
  final String? errorMessage;
}
