import 'package:flutter/material.dart';

import 'package:eiga/shared/player/subtitle_settings_state.dart';
import 'package:eiga/shared/phrase/core/style/layer_style.dart';
import 'package:eiga/shared/phrase/core/style/phrase_block_style.dart';

class SubtitleStyleAdapter {
  static PhraseBlockStyle createStyleFromSettings(
    SubtitleSettingsState settings, {
    required double videoHeight,
  }) {
    // fs розраховується пропорційно до висоти відео прямокутника
    final baseFs = videoHeight * (settings.fs / 400.0);

    final styles = <String, LayerStyle>{
      'original': LayerStyle(
        fontSize: baseFs * settings.so,
        letterSpacing: settings.lo,
        thickness: settings.th,
        outlineWidth: settings.oo,
        color: Colors.white,
        outlineColor: Colors.black,
        topGap: 0,
        alignment: TextAlign.center,
      ),
      'kana': LayerStyle(
        fontSize: baseFs * settings.so * 0.7 * settings.as,
        letterSpacing: settings.lo,
        thickness: settings.th * 0.8,
        outlineWidth: settings.oo * 0.8,
        color: const Color(0xFFE2E8F0),
        outlineColor: Colors.black,
        topGap: settings.ga,
        alignment: TextAlign.center,
      ),
      'trans_uk': LayerStyle(
        fontSize: baseFs * settings.ts,
        letterSpacing: settings.lt,
        thickness: settings.th * 0.9,
        outlineWidth: settings.to,
        color: const Color(0xFF818CF8),
        outlineColor: Colors.black,
        topGap: settings.gap * 10.0,
        alignment: TextAlign.center,
      ),
      'trans_en': LayerStyle(
        fontSize: baseFs * settings.ts,
        letterSpacing: settings.lt,
        thickness: settings.th * 0.9,
        outlineWidth: settings.to,
        color: const Color(0xFF818CF8),
        outlineColor: Colors.black,
        topGap: settings.gap * 10.0,
        alignment: TextAlign.center,
      ),
    };

    return PhraseBlockStyle(
      resolvedLayerStyles: styles,
      globalOutlineWidth: settings.go,
      backdropOpacity: settings.bop,
      backdropPadding: settings.bp,
      showBackdrop: settings.bd,
      showShimmer: false,
    );
  }
}
