import 'package:eiga/core/theme/phrase_theme_data.dart';
import 'package:eiga/shared/phrase/core/style/layer_style.dart';
import 'package:eiga/shared/phrase/core/style/phrase_block_style.dart';

class ListStyleAdapter {
  static PhraseBlockStyle createStyle({
    double baseFontSize = 16.0,
    bool isProcessing = false,
    required PhraseThemeData theme,
  }) {
    final styles = <String, LayerStyle>{
      'original': LayerStyle(
        fontSize: baseFontSize,
        thickness: 0.5,
        color: theme.foregroundColor,
        outlineWidth: 0.0,
        topGap: 0,
      ),
      'kana': LayerStyle(
        fontSize: baseFontSize * 0.72,
        thickness: 0.4,
        color: theme.dimTextColor,
        outlineWidth: 0.0,
        topGap: 0,
      ),
      'trans_uk': LayerStyle(
        fontSize: baseFontSize * 0.82,
        thickness: 0.4,
        color: theme.translationColor,
        outlineWidth: 0.0,
        topGap: 4,
      ),
      'trans_en': LayerStyle(
        fontSize: baseFontSize * 0.82,
        thickness: 0.4,
        color: theme.translationColor,
        outlineWidth: 0.0,
        topGap: 4,
      ),
    };

    return PhraseBlockStyle(
      resolvedLayerStyles: styles,
      globalOutlineWidth: 0.0,
      showBackdrop: false,
      showShimmer: isProcessing,
      backdropPadding: 0.0,
    );
  }
}
