import 'layer_config.dart';

class PhraseLayout {
  final List<LayerConfig> layers; // Порядок у списку = порядок на екрані

  const PhraseLayout({required this.layers});

  PhraseLayout copyWith({List<LayerConfig>? layers}) {
    return PhraseLayout(layers: layers ?? this.layers);
  }
}
