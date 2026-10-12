import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:eiga/shared/phrase/core/domain/token.dart';
import 'package:eiga/shared/phrase/core/style/layer_style.dart';
import 'ruby_layout.dart';
import 'text_painter_cache.dart';

class RenderedTokenBox {
  final Token token;
  final Rect bounds;
  final String layerId;
  final int? groupId;

  const RenderedTokenBox({
    required this.token,
    required this.bounds,
    required this.layerId,
    this.groupId,
  });
}

class RenderWordFlowData {
  final List<RenderedTokenBox> boxes;
  final Size totalSize;

  const RenderWordFlowData({
    required this.boxes,
    required this.totalSize,
  });
}

/// Рушій компонування слів, фурігани та рядочків перекладу
class WordFlowEngine {
  static RenderWordFlowData computeLayout({
    required Map<String, List<Token>> lineTokensMap, // layerId -> tokens
    required Map<String, LayerStyle> stylesMap, // layerId -> LayerStyle
    required List<String> lineOrder, // порядок шарів рядків
    required Map<String, String> rubyAnchorMap, // rubyLayerId -> anchorLayerId
    required double maxWidth,
  }) {
    final boxes = <RenderedTokenBox>[];
    double currentY = 0.0;
    double maxLineWidth = 0.0;

    for (final lineLayerId in lineOrder) {
      final tokens = lineTokensMap[lineLayerId] ?? [];
      final style = stylesMap[lineLayerId] ?? const LayerStyle();
      if (tokens.isEmpty) continue;

      // Знаходимо чи є ruby шар, прив'язаний до цього рядка
      String? rubyLayerId;
      for (final entry in rubyAnchorMap.entries) {
        if (entry.value == lineLayerId) {
          rubyLayerId = entry.key;
          break;
        }
      }

      final rubyTokens = rubyLayerId != null ? (lineTokensMap[rubyLayerId] ?? []) : <Token>[];
      final rubyStyle = rubyLayerId != null ? (stylesMap[rubyLayerId] ?? const LayerStyle()) : const LayerStyle();

      currentY += style.topGap;
      double currentX = 0.0;
      double currentLineMaxH = 0.0;

      for (var i = 0; i < tokens.length; i++) {
        final token = tokens[i];
        final anchorPainter = TextPainterCache.get(
          text: token.text,
          style: TextStyle(
            fontSize: style.fontSize,
            fontWeight: _getFontWeight(style.thickness),
            color: style.color,
            letterSpacing: style.letterSpacing,
          ),
          textDirection: TextDirection.ltr,
        );

        // Шукаємо ruby токен за орієнтиром індексу (1:1)
        Token? rubyToken;
        TextPainter? rubyPainter;
        if (rubyTokens.isNotEmpty && i < rubyTokens.length) {
          rubyToken = rubyTokens[i];
          rubyPainter = TextPainterCache.get(
            text: rubyToken.text,
            style: TextStyle(
              fontSize: rubyStyle.fontSize,
              fontWeight: _getFontWeight(rubyStyle.thickness),
              color: rubyStyle.color,
              letterSpacing: rubyStyle.letterSpacing,
            ),
            textDirection: TextDirection.ltr,
          );
        }

        final placed = RubyLayout.layoutPair(
          anchorToken: token,
          rubyToken: rubyToken,
          anchorPainter: anchorPainter,
          rubyPainter: rubyPainter,
          position: Offset(currentX, currentY),
        );

        // Перевірка на перенесення рядка
        if (currentX > 0 && (currentX + placed.totalWidth) > maxWidth) {
          currentX = 0.0;
          currentY += currentLineMaxH + 4.0;
          currentLineMaxH = 0.0;

          // Повторне компонування на новому рядку
          final newPlaced = RubyLayout.layoutPair(
            anchorToken: token,
            rubyToken: rubyToken,
            anchorPainter: anchorPainter,
            rubyPainter: rubyPainter,
            position: Offset(currentX, currentY),
          );

          _addPlacedToBoxes(boxes, newPlaced, lineLayerId, rubyLayerId);
          currentX += newPlaced.totalWidth + 6.0;
          currentLineMaxH = math.max(currentLineMaxH, newPlaced.anchorRect.height + (newPlaced.rubyRect?.height ?? 0));
        } else {
          _addPlacedToBoxes(boxes, placed, lineLayerId, rubyLayerId);
          currentX += placed.totalWidth + 6.0;
          currentLineMaxH = math.max(currentLineMaxH, placed.anchorRect.height + (placed.rubyRect?.height ?? 0));
        }

        maxLineWidth = math.max(maxLineWidth, currentX);
      }

      currentY += currentLineMaxH + 6.0;
    }

    return RenderWordFlowData(
      boxes: boxes,
      totalSize: Size(maxLineWidth, currentY),
    );
  }

  static void _addPlacedToBoxes(
    List<RenderedTokenBox> boxes,
    RubyPlacedItem placed,
    String lineLayerId,
    String? rubyLayerId,
  ) {
    boxes.add(RenderedTokenBox(
      token: placed.anchorToken,
      bounds: placed.anchorRect,
      layerId: lineLayerId,
      groupId: placed.anchorToken.groupId,
    ));

    if (placed.rubyToken != null && placed.rubyRect != null && rubyLayerId != null) {
      boxes.add(RenderedTokenBox(
        token: placed.rubyToken!,
        bounds: placed.rubyRect!,
        layerId: rubyLayerId,
        groupId: placed.rubyToken!.groupId,
      ));
    }
  }

  static FontWeight _getFontWeight(double thickness) {
    if (thickness <= 0.25) return FontWeight.w300;
    if (thickness <= 0.45) return FontWeight.w400;
    if (thickness <= 0.65) return FontWeight.w500;
    if (thickness <= 0.85) return FontWeight.w600;
    return FontWeight.w700;
  }
}
