import 'package:flutter/material.dart';
import 'package:eiga/database/models/word_models.dart';
import 'glass_sheet.dart';
import 'top_bar.dart';
import 'word_header.dart';
import 'status_selector.dart';
import 'card_tabs.dart';
import 'overview_tab.dart';
import 'examples_tab.dart';
import 'related_tab.dart';

class WordCard extends StatefulWidget {
  const WordCard({
    super.key,
    required this.dictionary,
    required this.initialKey,
    this.initialStatuses = const {},
    this.onPlay,
    this.onStatusChanged,
    this.t,
  });

  final Map<String, WordEntry> dictionary;
  final String initialKey;
  final Map<String, WordStatus> initialStatuses;
  final ValueChanged<Example>? onPlay;
  final void Function(String key, WordStatus status)? onStatusChanged;
  final String Function(String key)? t;

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  late final List<String> _stack = [widget.initialKey];
  late final Map<String, WordStatus> _status = {...widget.initialStatuses};
  CardTab _tab = CardTab.overview;
  int _exampleIndex = 0;
  bool _showKana = true, _showRomaji = true;

  String get _key => _stack.last;
  WordEntry get _word => widget.dictionary[_key]!;
  WordStatus _statusOf(String k) => _status[k] ?? WordStatus.none;

  void _setStatus(WordStatus s) {
    setState(() => s == WordStatus.none ? _status.remove(_key) : _status[_key] = s);
    widget.onStatusChanged?.call(_key, s);
  }

  void _open(String key) => setState(() {
        _stack.add(key);
        _exampleIndex = 0;
      });

  void _back() => setState(() {
        _stack.removeLast();
        _exampleIndex = 0;
      });

  @override
  Widget build(BuildContext context) {
    final w = _word;
    return GlassSheet(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TopBar(
          backLabel: _stack.length > 1 ? widget.dictionary[_stack[_stack.length - 2]]!.original : null,
          onBack: _back,
          showKana: _showKana,
          showRomaji: _showRomaji,
          onToggleKana: () => setState(() => _showKana = !_showKana),
          onToggleRomaji: () => setState(() => _showRomaji = !_showRomaji),
        ),
        const SizedBox(height: 12),
        WordHeader(word: w, showKana: _showKana, showRomaji: _showRomaji, t: widget.t),
        const SizedBox(height: 12),
        StatusSelector(status: _statusOf(_key), onChanged: _setStatus, onReset: () => _setStatus(WordStatus.none), t: widget.t),
        const SizedBox(height: 16),
        CardTabs(
          current: _tab,
          onChanged: (t) => setState(() => _tab = t),
          counts: {
            CardTab.examples: w.examples.length,
            CardTab.related: w.synonyms.length + w.antonyms.length,
          },
          t: widget.t,
        ),
        const SizedBox(height: 16),
        switch (_tab) {
          CardTab.overview => OverviewTab(word: w, t: widget.t, showKana: _showKana, showRomaji: _showRomaji),
          CardTab.examples => ExamplesTab(
              examples: w.examples,
              index: _exampleIndex,
              onSelect: (i) => setState(() => _exampleIndex = i),
              showKana: _showKana,
              showRomaji: _showRomaji,
              onPlay: widget.onPlay,
              t: widget.t,
            ),
          CardTab.related => RelatedTab(word: w, dictionary: widget.dictionary, statusOf: _statusOf, onOpen: _open, t: widget.t),
        },
      ]),
    );
  }
}
