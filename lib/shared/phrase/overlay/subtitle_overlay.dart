import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/core/theme/dark_theme.dart';
import 'package:eiga/shared/player/subtitle_settings_provider.dart';
import 'package:eiga/shared/phrase/core/layers/default_layout_factory.dart';
import 'package:eiga/shared/phrase/core/mapping/phrase_mapper.dart';
import 'package:eiga/shared/phrase/core/parts/phrase_block.dart';
import 'package:eiga/shared/phrase/core/style/word_colors.dart';
import 'active_phrases_provider.dart';
import 'subtitle_positioner.dart';
import 'subtitle_style_adapter.dart';

class SubtitleOverlay extends ConsumerWidget {
  final bool isFullScreen;
  final bool showInWindowedMode;

  const SubtitleOverlay({
    super.key,
    this.isFullScreen = false,
    this.showInWindowedMode = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isFullScreen && !showInWindowedMode) {
      return const SizedBox.shrink();
    }

    final activePhrases = ref.watch(activePhrasesProvider);
    if (activePhrases.isEmpty) return const SizedBox.shrink();

    final settings = ref.watch(isFullScreen ? subtitleSettingsFullscreenProvider : subtitleSettingsProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final videoH = constraints.maxHeight > 0 ? constraints.maxHeight : 300.0;
        final blockStyle = SubtitleStyleAdapter.createStyleFromSettings(
          settings,
          videoHeight: videoH,
        );

        final layout = DefaultLayoutFactory.create(
          langCode: 'ja',
          availableReadings: ['kana'],
          availableTranslations: ['uk'],
        );

        return SubtitlePositioner(
          verticalOffset: settings.vo,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: activePhrases.map((phrase) {
              final viewData = PhraseMapper.fromPhrase(phrase);
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: PhraseBlock(
                  viewData: viewData,
                  layout: layout,
                  style: blockStyle,
                  colors: const WordColors(darkPhraseThemeData),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
