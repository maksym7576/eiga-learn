import 'package:flutter/material.dart';
import 'package:eiga/database/models/phrase.dart';
import 'package:eiga/shared/phrase/core/domain/layer_state.dart';
import 'package:eiga/shared/phrase/core/domain/layer_text.dart';
import 'package:eiga/shared/phrase/core/domain/phrase_view_data.dart';
import 'package:eiga/shared/phrase/core/domain/token.dart';
import 'package:eiga/shared/phrase/core/layers/layer_source.dart';
import 'load_state_resolver.dart';
import 'token_aligner.dart';

class PhraseMapper {
  static PhraseViewData fromPhrase(
    Phrase phrase, {
    String targetLang = 'uk',
    TextDirection dir = TextDirection.ltr,
    bool spaced = true,
  }) {
    final texts = <LayerSource, LayerText>{};
    final isProcessing = phrase.hasProcessingStage == true || phrase.activeJobId != null;

    // 1. Оригінальний шар (ReadingSource('original'))
    final originalTokens = <Token>[];
    if (phrase.sourceTokens.isNotEmpty) {
      for (var i = 0; i < phrase.sourceTokens.length; i++) {
        final st = phrase.sourceTokens[i];
        final pos = st.pos ?? i;
        String text = '';
        if (st.versions.isNotEmpty) {
          final origVer = st.versions.firstWhere(
            (v) => v.key == 'original' || v.key.isEmpty,
            orElse: () => st.versions.first,
          );
          text = origVer.text;
        }
        if (text.isEmpty) {
          text = st.wordId ?? '';
        }
        if (text.isNotEmpty) {
          final groupId = TokenAligner.findGroupIdForSourcePos(pos, phrase.groups);
          originalTokens.add(Token(text: text, index: pos, groupId: groupId));
        }
      }
    } else if (phrase.originalVersions.isNotEmpty) {
      final origText = phrase.originalVersions.first.text;
      if (origText.isNotEmpty) {
        final words = spaced ? origText.split(' ') : [origText];
        for (var i = 0; i < words.length; i++) {
          originalTokens.add(Token(text: words[i], index: i));
        }
      }
    }

    texts[const ReadingSource('original')] = LayerText(
      tokens: originalTokens,
      dir: dir,
      spaced: spaced,
      state: LoadStateResolver.resolve(
        hasTextData: originalTokens.isNotEmpty,
        isProcessing: isProcessing,
        stages: phrase.stages,
      ),
    );

    // 2. Kana / Furigana шар (ReadingSource('kana'))
    final kanaTokens = <Token>[];
    if (phrase.sourceTokens.isNotEmpty) {
      for (var i = 0; i < phrase.sourceTokens.length; i++) {
        final st = phrase.sourceTokens[i];
        final pos = st.pos ?? i;
        final kanaVer = st.versions.firstWhere(
          (v) => v.key == 'kana' || v.key == 'furigana' || v.key == 'reading',
          orElse: () => st.versions.isEmpty ? st.versions.first : st.versions.first,
        );
        if (st.versions.isNotEmpty && kanaVer.key == 'kana' && kanaVer.text.isNotEmpty) {
          final groupId = TokenAligner.findGroupIdForSourcePos(pos, phrase.groups);
          kanaTokens.add(Token(text: kanaVer.text, index: pos, groupId: groupId));
        }
      }
    }

    if (kanaTokens.isNotEmpty) {
      texts[const ReadingSource('kana')] = LayerText(
        tokens: kanaTokens,
        dir: dir,
        spaced: false,
        state: LayerState.ready,
      );
    }

    // 3. Переклад (TranslationSource(targetLang))
    final translationTokens = <Token>[];
    if (phrase.targetTokens.isNotEmpty) {
      for (var i = 0; i < phrase.targetTokens.length; i++) {
        final tt = phrase.targetTokens[i];
        final pos = tt.pos ?? i;
        final text = tt.text ?? '';
        if (text.isNotEmpty) {
          final groupId = TokenAligner.findGroupIdForTargetPos(pos, phrase.groups);
          translationTokens.add(Token(text: text, index: pos, groupId: groupId));
        }
      }
    } else if (phrase.translatedPhrase != null && phrase.translatedPhrase!.isNotEmpty) {
      final transText = phrase.translatedPhrase!;
      final words = transText.split(' ');
      for (var i = 0; i < words.length; i++) {
        translationTokens.add(Token(text: words[i], index: i));
      }
    }

    texts[TranslationSource(targetLang)] = LayerText(
      tokens: translationTokens,
      dir: dir,
      spaced: true,
      state: LoadStateResolver.resolve(
        hasTextData: translationTokens.isNotEmpty,
        isProcessing: isProcessing,
        stages: phrase.stages,
        stageKey: 'translation',
      ),
    );

    return PhraseViewData(
      phraseId: phrase.id.toString(),
      start: Duration(milliseconds: phrase.startTime),
      end: Duration(milliseconds: phrase.endTime),
      texts: texts,
    );
  }
}
