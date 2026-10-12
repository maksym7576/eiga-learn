import 'package:flutter/material.dart';
import 'package:eiga/shared/phrase/core/style/layer_style.dart';
import 'layer_config.dart';
import 'layer_source.dart';
import 'phrase_layout.dart';

class DefaultLayoutFactory {
  static PhraseLayout create({
    required String langCode,
    List<String> availableReadings = const [],
    List<String> availableTranslations = const [],
  }) {
    final layers = <LayerConfig>[];

    // Оригінальний шар
    const originalStyle = LayerStyle(
      fontSize: 18.0,
      thickness: 0.5,
      color: Colors.white,
      topGap: 0,
    );

    layers.add(const LayerConfig(
      id: 'original',
      source: ReadingSource('original'),
      placement: LayerPlacement.line,
      visible: true,
      style: originalStyle,
    ));

    // Японська мова: кана як rubyAbove
    if (langCode == 'ja' || availableReadings.contains('kana')) {
      layers.add(const LayerConfig(
        id: 'kana',
        source: ReadingSource('kana'),
        placement: LayerPlacement.rubyAbove,
        anchorId: 'original',
        visible: true,
        style: LayerStyle(
          fontSize: 11.0,
          thickness: 0.4,
          color: Color(0xFF9AA3B6),
          topGap: 0,
        ),
      ));
    }

    // Переклади
    for (final transLang in availableTranslations.isNotEmpty ? availableTranslations : ['uk']) {
      layers.add(LayerConfig(
        id: 'trans_$transLang',
        source: TranslationSource(transLang),
        placement: LayerPlacement.line,
        visible: true,
        style: const LayerStyle(
          fontSize: 14.5,
          thickness: 0.4,
          color: Color(0xFFAAB1C2),
          topGap: 4.0,
        ),
      ));
    }

    return PhraseLayout(layers: layers);
  }
}
