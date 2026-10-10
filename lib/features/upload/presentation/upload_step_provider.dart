import 'package:hooks_riverpod/hooks_riverpod.dart';

class UploadStepState {
  final int currentStep;
  final int maxReachedStep;

  const UploadStepState({
    this.currentStep = 0,
    this.maxReachedStep = 0,
  });

  UploadStepState copyWith({int? currentStep, int? maxReachedStep}) {
    return UploadStepState(
      currentStep: currentStep ?? this.currentStep,
      maxReachedStep: maxReachedStep ?? this.maxReachedStep,
    );
  }
}

class UploadStepNotifier extends Notifier<UploadStepState> {
  @override
  UploadStepState build() {
    return const UploadStepState();
  }

  void setStep(int step) {
    state = state.copyWith(
      currentStep: step,
      maxReachedStep: step > state.maxReachedStep ? step : state.maxReachedStep,
    );
  }

  void prevStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void nextStep() {
    if (state.currentStep < 3) {
      final next = state.currentStep + 1;
      state = state.copyWith(
        currentStep: next,
        maxReachedStep: next > state.maxReachedStep ? next : state.maxReachedStep,
      );
    }
  }

  void reset() {
    state = const UploadStepState();
  }
}

final uploadStepProvider =
    NotifierProvider<UploadStepNotifier, UploadStepState>(() {
  return UploadStepNotifier();
});
