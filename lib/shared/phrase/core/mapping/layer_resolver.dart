import 'package:eiga/shared/phrase/core/domain/layer_text.dart';
import 'package:eiga/shared/phrase/core/domain/phrase_view_data.dart';
import 'package:eiga/shared/phrase/core/layers/layer_config.dart';

class ResolvedLayer {
  final LayerConfig config;
  final LayerText text;

  const ResolvedLayer({
    required this.config,
    required this.text,
  });

  bool get shouldRender => config.visible && text.isNotEmpty;
}

class LayerResolver {
  static List<ResolvedLayer> resolveLayers({
    required PhraseViewData data,
    required List<LayerConfig> layers,
  }) {
    final result = <ResolvedLayer>[];

    for (final config in layers) {
      final text = data.getText(config.source);
      if (text != null) {
        result.add(ResolvedLayer(config: config, text: text));
      }
    }

    return result;
  }
}
