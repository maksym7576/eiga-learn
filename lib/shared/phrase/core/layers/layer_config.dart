import 'package:eiga/shared/phrase/core/style/layer_style.dart';
import 'layer_source.dart';

enum LayerPlacement { line, rubyAbove, rubyBelow }

class LayerConfig {
  final String id;
  final LayerSource source;
  final LayerPlacement placement;
  final String? anchorId; // для ruby: до якого шару прикріплений
  final bool visible;
  final LayerStyle style;

  const LayerConfig({
    required this.id,
    required this.source,
    this.placement = LayerPlacement.line,
    this.anchorId,
    this.visible = true,
    this.style = const LayerStyle(),
  });

  LayerConfig copyWith({
    String? id,
    LayerSource? source,
    LayerPlacement? placement,
    String? anchorId,
    bool? visible,
    LayerStyle? style,
  }) {
    return LayerConfig(
      id: id ?? this.id,
      source: source ?? this.source,
      placement: placement ?? this.placement,
      anchorId: anchorId ?? this.anchorId,
      visible: visible ?? this.visible,
      style: style ?? this.style,
    );
  }
}
