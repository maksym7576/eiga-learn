import 'package:flutter/material.dart';
import 'package:eiga/core/theme/dark_theme.dart';
import 'package:eiga/shared/phrase/core/domain/token.dart';
import 'package:eiga/shared/phrase/core/style/layer_style.dart';
import 'package:eiga/shared/phrase/core/style/word_colors.dart';
import 'render_word_flow.dart';
import 'text_painter_cache.dart';

class WordFlowWidget extends StatelessWidget {
  final Map<String, List<Token>> lineTokensMap;
  final Map<String, LayerStyle> stylesMap;
  final List<String> lineOrder;
  final Map<String, String> rubyAnchorMap;
  final int? highlightedGroupId;
  final WordColors colors;
  final ValueChanged<Token>? onTokenTap;
  final VoidCallback? onCardTap;

  const WordFlowWidget({
    super.key,
    required this.lineTokensMap,
    required this.stylesMap,
    required this.lineOrder,
    this.rubyAnchorMap = const {},
    this.highlightedGroupId,
    this.colors = const WordColors(darkPhraseThemeData),
    this.onTokenTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutData = WordFlowEngine.computeLayout(
          lineTokensMap: lineTokensMap,
          stylesMap: stylesMap,
          lineOrder: lineOrder,
          rubyAnchorMap: rubyAnchorMap,
          maxWidth: constraints.maxWidth > 0 ? constraints.maxWidth : 600,
        );

        return SizedBox(
          width: layoutData.totalSize.width,
          height: layoutData.totalSize.height,
          child: CustomPaint(
            painter: _WordFlowPainter(
              boxes: layoutData.boxes,
              stylesMap: stylesMap,
              highlightedGroupId: highlightedGroupId,
              colors: colors,
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTapUp: (details) {
                final pos = details.localPosition;
                bool hitToken = false;
                for (final box in layoutData.boxes) {
                  if (box.bounds.inflate(4.0).contains(pos)) {
                    hitToken = true;
                    onTokenTap?.call(box.token);
                    break;
                  }
                }
                if (!hitToken) {
                  onCardTap?.call();
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class _WordFlowPainter extends CustomPainter {
  final List<RenderedTokenBox> boxes;
  final Map<String, LayerStyle> stylesMap;
  final int? highlightedGroupId;
  final WordColors colors;

  _WordFlowPainter({
    required this.boxes,
    required this.stylesMap,
    required this.highlightedGroupId,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Прохід підсвітки пар (highlightedGroupId)
    if (highlightedGroupId != null) {
      final hlPaint = Paint()
        ..color = colors.highlightBg
        ..style = PaintingStyle.fill;

      for (final box in boxes) {
        if (box.groupId == highlightedGroupId) {
          final r = RRect.fromRectAndRadius(
            box.bounds.inflate(2.0),
            const Radius.circular(4.0),
          );
          canvas.drawRRect(r, hlPaint);
        }
      }
    }

    // 2. Прохід обведення (Pass 1: Outline)
    for (final box in boxes) {
      final style = stylesMap[box.layerId] ?? const LayerStyle();
      if (style.outlineWidth > 0) {
        final strokePainter = TextPainterCache.get(
          text: box.token.text,
          style: TextStyle(
            fontSize: style.fontSize,
            letterSpacing: style.letterSpacing,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = style.outlineWidth
              ..color = style.outlineColor,
          ),
          textDirection: TextDirection.ltr,
        );
        strokePainter.paint(canvas, box.bounds.topLeft);
      }
    }

    // 3. Прохід заливки тексту (Pass 2: Text Fill)
    for (final box in boxes) {
      final style = stylesMap[box.layerId] ?? const LayerStyle();
      final fillPainter = TextPainterCache.get(
        text: box.token.text,
        style: TextStyle(
          fontSize: style.fontSize,
          letterSpacing: style.letterSpacing,
          color: style.color,
        ),
        textDirection: TextDirection.ltr,
      );
      fillPainter.paint(canvas, box.bounds.topLeft);
    }
  }

  @override
  bool shouldRepaint(covariant _WordFlowPainter oldDelegate) {
    return oldDelegate.boxes != boxes ||
        oldDelegate.highlightedGroupId != highlightedGroupId ||
        oldDelegate.stylesMap != stylesMap ||
        oldDelegate.colors != colors;
  }
}
