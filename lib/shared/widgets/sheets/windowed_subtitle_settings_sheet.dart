import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../player/subtitle_settings_provider.dart';
import '../../player/subtitle_settings_state.dart';
import '../logo/mini_app_logo.dart';
import '../buttons/cancel_button.dart' as app_widgets;
import '../buttons/primary_gradient_button.dart';
import 'app_bottom_sheet_mobile.dart';

String _f1(double v) => v.toStringAsFixed(1);
String _f2(double v) => v.toStringAsFixed(2);
String _px(double v) => '${v.round()}px';
String _pct(double v) => '${(v * 100).round()}%';

class WindowedSubtitleSettingsSheet extends ConsumerWidget {
  const WindowedSubtitleSettingsSheet({super.key});

  static Future<void> show(BuildContext context) {
    return AppBottomSheetMobile.show(
      context: context,
      heightFactor: 0.85,
      child: const WindowedSubtitleSettingsSheet(),
    );
  }

  void _step(WidgetRef ref, String key, double cur, double step, double min, double max, int dir) {
    final v = (cur + dir * step).clamp(min, max).toDouble();
    ref
        .read(subtitleSettingsProvider.notifier)
        .updateSetting(key, double.parse(v.toStringAsFixed(3)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(subtitleSettingsProvider);
    final notifier = ref.read(subtitleSettingsProvider.notifier);

    final isWide = MediaQuery.sizeOf(context).width >= 560;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isWide ? 28 : 20, vertical: 16),
        child: Column(
          children: [
            const Center(child: MiniAppLogo(size: 34)),
            const SizedBox(height: 10),
            const Text(
              'Subtitle Settings',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -0.5,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Configure size, scale, position & backdrop for phrase list',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),

            // Settings Content Grid (Multi-column)
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Section 1: Layout & Position (2-column Grid)
                    _SectionHeader(title: 'LAYOUT & POSITION'),
                    const SizedBox(height: 8),
                    _GridRow(
                      children: [
                        _ControlCard(
                          label: 'Font Size',
                          valueStr: _px(settings.fs),
                          onMinus: () => _step(ref, 'fs', settings.fs, 1, 10, 48, -1),
                          onPlus: () => _step(ref, 'fs', settings.fs, 1, 10, 48, 1),
                        ),
                        _ControlCard(
                          label: 'Vertical Position',
                          valueStr: _f2(settings.vo),
                          onMinus: () => _step(ref, 'vo', settings.vo, 0.02, 0.0, 1.0, -1),
                          onPlus: () => _step(ref, 'vo', settings.vo, 0.02, 0.0, 1.0, 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Section 2: Text Scale & Furigana (Multi-column)
                    _SectionHeader(title: 'TEXT SCALE & FURIGANA'),
                    const SizedBox(height: 8),
                    _GridRow(
                      children: [
                        _ControlCard(
                          label: 'Original Scale',
                          valueStr: _pct(settings.so),
                          onMinus: () => _step(ref, 'so', settings.so, 0.05, 0.5, 2.5, -1),
                          onPlus: () => _step(ref, 'so', settings.so, 0.05, 0.5, 2.5, 1),
                        ),
                        _ControlCard(
                          label: 'Furigana Scale',
                          valueStr: _pct(settings.as),
                          onMinus: () => _step(ref, 'as', settings.as, 0.05, 0.5, 2.5, -1),
                          onPlus: () => _step(ref, 'as', settings.as, 0.05, 0.5, 2.5, 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _GridRow(
                      children: [
                        _ControlCard(
                          label: 'Translation Scale',
                          valueStr: _pct(settings.ts),
                          onMinus: () => _step(ref, 'ts', settings.ts, 0.05, 0.5, 2.5, -1),
                          onPlus: () => _step(ref, 'ts', settings.ts, 0.05, 0.5, 2.5, 1),
                        ),
                        _ControlCard(
                          label: 'Outline Width',
                          valueStr: _f1(settings.go),
                          onMinus: () => _step(ref, 'go', settings.go, 0.1, 0.0, 3.0, -1),
                          onPlus: () => _step(ref, 'go', settings.go, 0.1, 0.0, 3.0, 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Section 3: Spacing & Gaps (Multi-column)
                    _SectionHeader(title: 'SPACING & GAPS'),
                    const SizedBox(height: 8),
                    _GridRow(
                      children: [
                        _ControlCard(
                          label: 'Translation Gap',
                          valueStr: _f2(settings.gap),
                          onMinus: () => _step(ref, 'gap', settings.gap, 0.05, 0.0, 3.0, -1),
                          onPlus: () => _step(ref, 'gap', settings.gap, 0.05, 0.0, 3.0, 1),
                        ),
                        _ControlCard(
                          label: 'Furigana Gap',
                          valueStr: _f2(settings.ga),
                          onMinus: () => _step(ref, 'ga', settings.ga, 0.05, 0.0, 3.0, -1),
                          onPlus: () => _step(ref, 'ga', settings.ga, 0.05, 0.0, 3.0, 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _GridRow(
                      children: [
                        _ControlCard(
                          label: 'Letter Spacing',
                          valueStr: _f1(settings.lo),
                          onMinus: () => _step(ref, 'lo', settings.lo, 0.5, 0.0, 10.0, -1),
                          onPlus: () => _step(ref, 'lo', settings.lo, 0.5, 0.0, 10.0, 1),
                        ),
                        _BackdropCard(
                          value: settings.bd,
                          opacityStr: _f2(settings.bop),
                          onToggle: (v) => notifier.toggleBackdrop(v),
                          onMinusOpacity: () => _step(ref, 'bop', settings.bop, 0.05, 0.0, 1.0, -1),
                          onPlusOpacity: () => _step(ref, 'bop', settings.bop, 0.05, 0.0, 1.0, 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Footer Actions
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Row(
                children: [
                  Expanded(
                    child: app_widgets.CancelButton(
                      onPressed: () {
                        notifier.reset();
                        Navigator.pop(context);
                      },
                      text: 'Reset',
                      icon: Icons.refresh_rounded,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PrimaryGradientButton(
                      text: 'Done',
                      onPressed: () => Navigator.pop(context),
                      icon: Icons.check_rounded,
                      isIconLeading: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: Color(0xFF67E8F9),
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class _GridRow extends StatelessWidget {
  final List<Widget> children;
  const _GridRow({required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < children.length; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          Expanded(child: children[i]),
        ],
      ],
    );
  }
}

class _ControlCard extends StatelessWidget {
  final String label;
  final String valueStr;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const _ControlCard({
    required this.label,
    required this.valueStr,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0C081E).withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.18), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StepBtn(label: '-', onTap: onMinus),
              Text(
                valueStr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF67E8F9),
                  fontSize: 15,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.w800,
                ),
              ),
              _StepBtn(label: '+', onTap: onPlus),
            ],
          ),
        ],
      ),
    );
  }
}

class _BackdropCard extends StatelessWidget {
  final bool value;
  final String opacityStr;
  final ValueChanged<bool> onToggle;
  final VoidCallback onMinusOpacity;
  final VoidCallback onPlusOpacity;

  const _BackdropCard({
    required this.value,
    required this.opacityStr,
    required this.onToggle,
    required this.onMinusOpacity,
    required this.onPlusOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0C081E).withOpacity(0.85),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.18), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Backdrop',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              _MiniSwitch(value: value, onChanged: onToggle),
            ],
          ),
          if (value) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StepBtn(label: '-', onTap: onMinusOpacity),
                Text(
                  opacityStr,
                  style: const TextStyle(
                    color: Color(0xFF67E8F9),
                    fontSize: 15,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                _StepBtn(label: '+', onTap: onPlusOpacity),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _StepBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _StepBtn({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(99),
      child: Container(
        width: 34,
        height: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.1),
          border: Border.all(color: Colors.white.withOpacity(0.25)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1,
            fontWeight: FontWeight.w900,
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
        width: 34,
        height: 20,
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
                width: 16,
                height: 16,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
