import 'package:flutter/material.dart';
import 'package:eiga/shared/phrase/core/layers/layer_config.dart';
import 'layer_style.dart';

class PhraseBlockStyle {
  final Map<String, LayerStyle> resolvedLayerStyles; // layerId -> LayerStyle
  final double globalOutlineWidth; // go
  final double backdropOpacity; // bop
  final double backdropPadding; // bp
  final bool showBackdrop; // bd
  final bool showShimmer;
  final bool showSkeleton;
  final double? maxWidth;
  final EdgeInsets padding;

  const PhraseBlockStyle({
    required this.resolvedLayerStyles,
    this.globalOutlineWidth = 1.0,
    this.backdropOpacity = 0.6,
    this.backdropPadding = 8.0,
    this.showBackdrop = true,
    this.showShimmer = false,
    this.showSkeleton = false,
    this.maxWidth,
    this.padding = const EdgeInsets.all(8.0),
  });

  LayerStyle getStyleForLayer(LayerConfig layer) {
    final base = resolvedLayerStyles[layer.id] ?? layer.style;
    final effectiveOutline = globalOutlineWidth * base.outlineWidth;
    return base.copyWith(outlineWidth: effectiveOutline);
  }
}
