import 'package:flutter/material.dart';
import 'package:eiga/core/theme/dark_theme.dart';
import 'package:eiga/core/theme/phrase_theme_data.dart';
import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/shared/phrase/core/domain/token.dart';
import 'package:eiga/shared/phrase/core/layers/default_layout_factory.dart';
import 'package:eiga/shared/phrase/core/layers/phrase_layout.dart';
import 'package:eiga/shared/phrase/core/mapping/phrase_mapper.dart';
import 'package:eiga/shared/phrase/core/parts/phrase_block.dart';
import 'package:eiga/shared/phrase/core/style/word_colors.dart';
import 'active_phrase_background.dart';
import 'list_style_adapter.dart';
import 'phrase_time_label.dart';

class PhraseTile extends StatelessWidget {
  final Phrase phrase;
  final bool isActive;
  final PhraseThemeData theme;
  final bool isAutoScrollEnabled;
  final PhraseLayout? customLayout;
  final int? highlightedGroupId;
  final VoidCallback? onTap;
  final ValueChanged<Token>? onTokenTap;

  PhraseTile({
    super.key,
    required this.phrase,
    required this.isActive,
    PhraseThemeData? theme,
    this.isAutoScrollEnabled = false,
    this.customLayout,
    this.highlightedGroupId,
    this.onTap,
    this.onTokenTap,
  }) : theme = theme ?? darkPhraseThemeData;

  @override
  Widget build(BuildContext context) {
    final viewData = PhraseMapper.fromPhrase(phrase);
    final layout = customLayout ??
        DefaultLayoutFactory.create(
          langCode: 'ja',
          availableReadings: ['kana'],
          availableTranslations: ['uk'],
        );

    final colors = WordColors(theme);
    final isProcessing = phrase.hasProcessingStage == true || phrase.activeJobId != null;
    final style = ListStyleAdapter.createStyle(
      isProcessing: isProcessing,
      theme: theme,
    );

    return RepaintBoundary(
      child: ActivePhraseBackground(
        isActive: isActive,
        colors: colors,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCubic,
                alignment: Alignment.centerLeft,
                widthFactor: isAutoScrollEnabled ? 0.0 : 1.0,
                child: ClipRect(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isAutoScrollEnabled ? 0.0 : 1.0,
                    child: SizedBox(
                      width: 42,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PhraseTimeLabel(
                            startMs: phrase.startTime,
                            isActive: isActive,
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PhraseBlock(
                  viewData: viewData,
                  layout: layout,
                  style: style,
                  colors: colors,
                  highlightedGroupId: highlightedGroupId,
                  onTokenTap: onTokenTap,
                  onCardTap: onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
