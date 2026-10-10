import 'dart:async';
import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/core/theme/app_colors.dart';
import 'player_glass_button.dart';
import 'subtitle_settings_provider.dart';
import 'subtitle_settings_state.dart';

String _f1(double v) => v.toStringAsFixed(1);
String _f2(double v) => v.toStringAsFixed(2);
String _px(double v) => '${v.round()}px';
String _pct(double v) => '${(v * 100).round()}%';

class _Param {
  final String key, label;
  final double min, max, btnStep;
  final String Function(double) fmt;
  final int group;
  const _Param(this.key, this.label, this.min, this.max, this.btnStep, this.fmt, this.group);
}

const _groups = [
  'Layout & Size',
  'Spacing & Gaps',
  'Styling & Strokes',
  'Background Backdrop',
  'Advanced Scaling',
];

const _params = <_Param>[
  _Param('fs', 'Font Size', 4, 60, 1, _px, 0),
  _Param('vo', 'Vertical Position', 0, 1, 0.02, _f2, 0),
  _Param('gap', 'Original - Translation Gap', 0, 3, 0.05, _f2, 1),
  _Param('ga', 'Original - Furigana Gap', 0, 3, 0.05, _f2, 1),
  _Param('lo', 'Original Letter Spacing', 0, 10, 0.5, _f1, 1),
  _Param('lt', 'Translation Letter Spacing', 0, 10, 0.5, _f1, 1),
  _Param('th', 'Word Thickness', 0, 1, 0.05, _f2, 2),
  _Param('go', 'Global Outline Width (All Subtitles)', 0, 3, 0.1, _f1, 2),
  _Param('oo', 'Original Outline Width', 0.5, 4, 0.1, _f1, 2),
  _Param('to', 'Translation Outline Width', 0.5, 4, 0.1, _f1, 2),
  _Param('bop', 'Opacity', 0, 1, 0.05, _f2, 3),
  _Param('bp', 'Padding', 0, 40, 2, _px, 3),
  _Param('so', 'Original Text Scale (includes Furigana)', 0.5, 2.5, 0.05, _pct, 4),
  _Param('as', 'Furigana Scale', 0.5, 2.5, 0.05, _pct, 4),
  _Param('ts', 'Translation Scale', 0.5, 2.5, 0.05, _pct, 4),
];

double _read(SubtitleSettingsState s, String k) => switch (k) {
      'fs' => s.fs,
      'vo' => s.vo,
      'gap' => s.gap,
      'ga' => s.ga,
      'lo' => s.lo,
      'lt' => s.lt,
      'th' => s.th,
      'go' => s.go,
      'oo' => s.oo,
      'to' => s.to,
      'bop' => s.bop,
      'bp' => s.bp,
      'so' => s.so,
      'as' => s.as,
      'ts' => s.ts,
      _ => 0,
    };

class SubtitleSettingsPanel extends ConsumerWidget {
  final VoidCallback onClose;
  final bool isOpen;
  final bool isFullScreen;

  const SubtitleSettingsPanel({
    Key? key,
    required this.onClose,
    required this.isOpen,
    this.isFullScreen = false,
  }) : super(key: key);

  void _step(WidgetRef ref, _Param p, int dir) {
    final cur = _read(ref.read(subtitleSettingsProvider), p.key);
    final v = (cur + dir * p.btnStep).clamp(p.min, p.max).toDouble();
    ref
        .read(subtitleSettingsProvider.notifier)
        .updateSetting(p.key, double.parse(v.toStringAsFixed(3)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(subtitleSettingsProvider);
    final notifier = ref.read(subtitleSettingsProvider.notifier);
    final pad = MediaQuery.of(context).padding;
    final safeTop = isFullScreen ? pad.top : 0.0;
    final safeBottom = isFullScreen ? pad.bottom : 0.0;
    final rowH = isFullScreen ? 36.0 : 30.0;
    final btn = isFullScreen ? 30.0 : 24.0;

    final items = <Widget>[];
    for (var g = 0; g < _groups.length; g++) {
      items.add(Padding(
        padding: EdgeInsets.only(top: g == 0 ? 0 : 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _groups[g].toUpperCase(),
              style: const TextStyle(
                color: AppColors.cyan300,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
              ),
            ),
            if (g == 3) _MiniSwitch(value: settings.bd, onChanged: notifier.toggleBackdrop),
          ],
        ),
      ));
      for (final p in _params.where((p) => p.group == g)) {
        final dis = g == 3 && !settings.bd;
        items.add(Opacity(
          opacity: dis ? 0.3 : 1,
          child: IgnorePointer(
            ignoring: dis,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: rowH),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      p.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _StepButton(label: '−', size: btn, onStep: () => _step(ref, p, -1)),
                  const SizedBox(width: 4),
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 42),
                    child: Text(
                      p.fmt(_read(settings, p.key)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.cyan300,
                        fontSize: 11.5,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  _StepButton(label: '+', size: btn, onStep: () => _step(ref, p, 1)),
                ],
              ),
            ),
          ),
        ));
      }
    }

    final panel = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 36,
            spreadRadius: -12,
            offset: const Offset(-12, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(24)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF0E0A34).withOpacity(0.3),
              border: Border(left: BorderSide(color: Colors.white.withOpacity(0.2))),
            ),
            // поглинаємо тапи, щоб не закривати/перемикати плеєр
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 12 + safeTop, 10, 8),
                    child: Row(
                      children: [
                        const Icon(Icons.tune, color: AppColors.cyan300, size: 18),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Subtitle Settings',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                        PlayerGlassButton(
                          size: 30,
                          idleColor: Colors.white.withOpacity(0.85),
                          tooltip: 'Reset to Defaults',
                          onPressed: notifier.reset,
                          builder: (c) => Icon(Icons.refresh, size: 16, color: c),
                        ),
                        const SizedBox(width: 6),
                        PlayerGlassButton(
                          size: 30,
                          idleColor: Colors.white.withOpacity(0.85),
                          tooltip: 'Close',
                          onPressed: onClose,
                          builder: (c) => Icon(Icons.close, size: 16, color: c),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 14 + safeBottom),
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 6),
                      itemBuilder: (_, i) => items[i],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    return Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      width: isFullScreen ? 340 : 300,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(end: isOpen ? 0.0 : 1.05),
        duration: const Duration(milliseconds: 300),
        curve: const Cubic(0.2, 0.9, 0.3, 1),
        child: panel,
        builder: (context, t, child) {
          if (t >= 1.05) return const SizedBox.shrink(); // повністю закрита — нічого не малюємо
          return FractionalTranslation(translation: Offset(t, 0), child: child);
        },
      ),
    );
  }
}

/// +/− з автоповтором при утриманні (420 мс затримка, потім кожні 70 мс)
class _StepButton extends StatefulWidget {
  final String label;
  final double size;
  final VoidCallback onStep;
  const _StepButton({required this.label, required this.size, required this.onStep});

  @override
  State<_StepButton> createState() => _StepButtonState();
}

class _StepButtonState extends State<_StepButton> {
  Timer? _delay, _repeat;
  bool _down = false, _hover = false;

  void _start() {
    widget.onStep();
    setState(() => _down = true);
    _delay = Timer(const Duration(milliseconds: 420), () {
      _repeat = Timer.periodic(const Duration(milliseconds: 70), (_) => widget.onStep());
    });
  }

  void _stop() {
    _delay?.cancel();
    _repeat?.cancel();
    if (mounted) setState(() => _down = false);
  }

  @override
  void dispose() {
    _delay?.cancel();
    _repeat?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Listener(
        onPointerDown: (_) => _start(),
        onPointerUp: (_) => _stop(),
        onPointerCancel: (_) => _stop(),
        child: AnimatedScale(
          scale: _down ? 0.88 : 1,
          duration: const Duration(milliseconds: 120),
          child: Container(
            width: widget.size,
            height: widget.size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _down
                  ? AppColors.cyan300.withOpacity(0.3)
                  : Colors.white.withOpacity(_hover ? 0.18 : 0.08),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MiniSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const _MiniSwitch({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    const d = Duration(milliseconds: 150);
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: d,
        width: 32,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: value ? const Color(0xFF3B66F5) : Colors.white.withOpacity(0.22),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: d,
              left: value ? 16 : 2,
              top: 2,
              child: Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
