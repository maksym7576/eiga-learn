import 'package:eiga/shared/phrase/core/layers/layer_source.dart';
import 'layer_text.dart';

class PhraseViewData {
  final String phraseId;
  final Duration start;
  final Duration end;
  final Map<LayerSource, LayerText> texts;

  const PhraseViewData({
    required this.phraseId,
    required this.start,
    required this.end,
    required this.texts,
  });

  LayerText? getText(LayerSource source) => texts[source];
}
