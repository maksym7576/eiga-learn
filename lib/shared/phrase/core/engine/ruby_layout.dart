import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:eiga/shared/phrase/core/domain/token.dart';

class RubyPlacedItem {
  final Token anchorToken;
  final Token? rubyToken;
  final Rect anchorRect;
  final Rect? rubyRect;
  final double totalWidth;

  const RubyPlacedItem({
    required this.anchorToken,
    this.rubyToken,
    required this.anchorRect,
    this.rubyRect,
    required this.totalWidth,
  });
}

class RubyLayout {
  /// Розраховує взаємне розміщення слів та їх фурігани/рубі
  static RubyPlacedItem layoutPair({
    required Token anchorToken,
    Token? rubyToken,
    required TextPainter anchorPainter,
    TextPainter? rubyPainter,
    required Offset position,
  }) {
    final anchorWidth = anchorPainter.width;
    final anchorHeight = anchorPainter.height;

    if (rubyToken == null || rubyPainter == null) {
      final aRect = Rect.fromLTWH(position.dx, position.dy, anchorWidth, anchorHeight);
      return RubyPlacedItem(
        anchorToken: anchorToken,
        anchorRect: aRect,
        totalWidth: anchorWidth,
      );
    }

    final rubyWidth = rubyPainter.width;
    final rubyHeight = rubyPainter.height;
    final maxW = math.max(anchorWidth, rubyWidth);

    final rubyDx = position.dx + (maxW - rubyWidth) / 2;
    final anchorDx = position.dx + (maxW - anchorWidth) / 2;

    final rRect = Rect.fromLTWH(rubyDx, position.dy, rubyWidth, rubyHeight);
    final aRect = Rect.fromLTWH(anchorDx, position.dy + rubyHeight + 1.0, anchorWidth, anchorHeight);

    return RubyPlacedItem(
      anchorToken: anchorToken,
      rubyToken: rubyToken,
      anchorRect: aRect,
      rubyRect: rRect,
      totalWidth: maxW,
    );
  }
}
