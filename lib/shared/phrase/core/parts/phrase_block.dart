import 'package:flutter/material.dart';
import 'package:eiga/core/theme/dark_theme.dart';
import 'package:eiga/shared/phrase/core/domain/phrase_view_data.dart';
import 'package:eiga/shared/phrase/core/domain/token.dart';
import 'package:eiga/shared/phrase/core/engine/word_flow.dart';
import 'package:eiga/shared/phrase/core/layers/layer_config.dart';
import 'package:eiga/shared/phrase/core/layers/phrase_layout.dart';
import 'package:eiga/shared/phrase/core/mapping/layer_resolver.dart';
import 'package:eiga/shared/phrase/core/style/layer_style.dart';
import 'package:eiga/shared/phrase/core/style/phrase_block_style.dart';
import 'package:eiga/shared/phrase/core/style/word_colors.dart';
import 'phrase_backdrop.dart';
import 'phrase_shimmer.dart';

class PhraseBlock extends StatelessWidget {
  final PhraseViewData viewData;
  final PhraseLayout layout;
  final PhraseBlockStyle style;
  final WordColors colors;
  final int? highlightedGroupId;
  final ValueChanged<Token>? onTokenTap;
  final VoidCallback? onCardTap;

  const PhraseBlock({
    super.key,
    required this.viewData,
    required this.layout,
    required this.style,
    this.colors = const WordColors(darkPhraseThemeData),
    this.highlightedGroupId,
    this.onTokenTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    final resolved = LayerResolver.resolveLayers(
      data: viewData,
      layers: layout.layers,
    );

    final lineTokensMap = <String, List<Token>>{};
    final stylesMap = <String, LayerStyle>{};
    final lineOrder = <String>[];
    final rubyAnchorMap = <String, String>{};

    for (final res in resolved) {
      if (!res.shouldRender) continue;

      final layerStyle = style.getStyleForLayer(res.config);
      stylesMap[res.config.id] = layerStyle;

      if (res.config.placement == LayerPlacement.line) {
        lineTokensMap[res.config.id] = res.text.tokens;
        lineOrder.add(res.config.id);
      } else if (res.config.placement == LayerPlacement.rubyAbove ||
          res.config.placement == LayerPlacement.rubyBelow) {
        lineTokensMap[res.config.id] = res.text.tokens;
        if (res.config.anchorId != null) {
          rubyAnchorMap[res.config.id] = res.config.anchorId!;
        }
      }
    }

    final content = WordFlowWidget(
      lineTokensMap: lineTokensMap,
      stylesMap: stylesMap,
      lineOrder: lineOrder,
      rubyAnchorMap: rubyAnchorMap,
      highlightedGroupId: highlightedGroupId,
      colors: colors,
      onTokenTap: onTokenTap,
      onCardTap: onCardTap,
    );

    final backdropContent = PhraseBackdrop(
      showBackdrop: style.showBackdrop,
      opacity: style.backdropOpacity,
      padding: style.backdropPadding,
      child: content,
    );

    if (style.showShimmer) {
      return PhraseShimmer(child: backdropContent);
    }

    return backdropContent;
  }
}
