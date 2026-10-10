import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'subtitle_settings_state.dart';

class SubtitleSettingsNotifier extends Notifier<SubtitleSettingsState> {
  @override
  SubtitleSettingsState build() => const SubtitleSettingsState();

  void updateSetting(String key, double value) {
    switch (key) {
      case 'fs':
        state = state.copyWith(fs: value);
        break;
      case 'vo':
        state = state.copyWith(vo: value);
        break;
      case 'gap':
        state = state.copyWith(gap: value);
        break;
      case 'ga':
        state = state.copyWith(ga: value);
        break;
      case 'lo':
        state = state.copyWith(lo: value);
        break;
      case 'lt':
        state = state.copyWith(lt: value);
        break;
      case 'th':
        state = state.copyWith(th: value);
        break;
      case 'go':
        state = state.copyWith(go: value);
        break;
      case 'oo':
        state = state.copyWith(oo: value);
        break;
      case 'to':
        state = state.copyWith(to: value);
        break;
      case 'bop':
        state = state.copyWith(bop: value);
        break;
      case 'bp':
        state = state.copyWith(bp: value);
        break;
      case 'so':
        state = state.copyWith(so: value);
        break;
      case 'as':
        state = state.copyWith(as: value);
        break;
      case 'ts':
        state = state.copyWith(ts: value);
        break;
    }
  }

  void toggleBackdrop(bool value) {
    state = state.copyWith(bd: value);
  }

  void reset() {
    state = const SubtitleSettingsState();
  }
}

final subtitleSettingsProvider =
    NotifierProvider<SubtitleSettingsNotifier, SubtitleSettingsState>(() {
  return SubtitleSettingsNotifier();
});
