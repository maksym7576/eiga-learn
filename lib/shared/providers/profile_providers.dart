import 'package:hooks_riverpod/hooks_riverpod.dart';

enum LangSlot { original, translation }

class ProfileDraft {
  const ProfileDraft({
    this.originalCode = '',
    this.translationCode = '',
    this.processingEngineId = '',
  });

  final String originalCode;
  final String translationCode;
  final String processingEngineId;

  // На екрані створення профілю достатньо обрати оригінальну мову та мову перекладу
  bool get isValid => originalCode.isNotEmpty && translationCode.isNotEmpty;

  // Чи повністю готовий чернетковий профіль (включно з рушієм)
  bool get isComplete => originalCode.isNotEmpty && translationCode.isNotEmpty && processingEngineId.isNotEmpty;

  ProfileDraft copyWith({
    String? originalCode,
    String? translationCode,
    String? processingEngineId,
  }) {
    return ProfileDraft(
      originalCode: originalCode ?? this.originalCode,
      translationCode: translationCode ?? this.translationCode,
      processingEngineId: processingEngineId ?? this.processingEngineId,
    );
  }
}

class ProfileDraftNotifier extends Notifier<ProfileDraft> {
  @override
  ProfileDraft build() => const ProfileDraft();

  void select(LangSlot slot, String code) {
    if (slot == LangSlot.original) {
      state = state.copyWith(originalCode: code);
    } else {
      state = state.copyWith(translationCode: code);
    }
  }

  void selectEngine(String engineId) {
    state = state.copyWith(processingEngineId: engineId);
  }

  void swap() {
    state = state.copyWith(
      originalCode: state.translationCode,
      translationCode: state.originalCode,
    );
  }
}

final profileDraftProvider = NotifierProvider<ProfileDraftNotifier, ProfileDraft>(() {
    return ProfileDraftNotifier();
});
