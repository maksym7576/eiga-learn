import 'package:eiga/database/embedded/stage_entry.dart';
import 'package:eiga/shared/phrase/core/domain/layer_state.dart';

class LoadStateResolver {
  static LayerState resolve({
    required bool hasTextData,
    required bool isProcessing,
    required List<StageEntry> stages,
    String? stageKey,
  }) {
    if (hasTextData) {
      return LayerState.ready;
    }

    if (isProcessing) {
      return LayerState.processing;
    }

    if (stageKey != null) {
      final stage = stages.firstWhere(
        (s) => s.key == stageKey,
        orElse: () => StageEntry(),
      );
      if (stage.state == 'in_progress' || stage.state == 'queued') {
        return LayerState.processing;
      }
    }

    return LayerState.missing;
  }
}
