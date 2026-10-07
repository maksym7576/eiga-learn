import 'dart:async';

import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

/// Анімований логотип «eiga».
/// «e» стоїть на місці, «ig + a/あ» зсувається вгору, згасає,
/// символ змінюється, і все повертається назад.
class EigaLogo extends StatefulWidget {
  const EigaLogo({
    super.key,
    this.size = 28,
    this.firstSwapDelay = const Duration(seconds: 5),
    this.swapInterval = const Duration(seconds: 30),
    this.glowColor,
  });

  final double size;
  final Duration firstSwapDelay;
  final Duration swapInterval;
  final Color? glowColor;

  @override
  State<EigaLogo> createState() => _EigaLogoState();
}

class _EigaLogoState extends State<EigaLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
  );

  Timer? _first;
  Timer? _periodic;
  bool _kana = false;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _first = Timer(widget.firstSwapDelay, () => _swap(true));
    _periodic = Timer.periodic(widget.swapInterval, (_) => _swap(!_kana));
  }

  @override
  void dispose() {
    _first?.cancel();
    _periodic?.cancel();
    _c.dispose();
    super.dispose();
  }

  Future<void> _swap(bool toKana) async {
    if (_busy || !mounted) return;
    _busy = true;

    if (MediaQuery.disableAnimationsOf(context)) {
      setState(() => _kana = toKana);
      _busy = false;
      return;
    }

    await _c.animateTo(1, curve: Curves.easeOut);
    if (!mounted) return;
    setState(() => _kana = toKana);
    await _c.animateBack(0, curve: Curves.easeIn);
    _busy = false;
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.size;
    final glow = widget.glowColor ?? AppColors.sky400;

    final latin = TextStyle(
      fontFamily: AppTypography.fontSans,
      fontWeight: FontWeight.w800,
      fontSize: s,
      height: 1,
      letterSpacing: -s * 0.02,
      color: Colors.white,
      shadows: [
        Shadow(color: glow.withOpacity(0.5), blurRadius: 24),
      ],
    );

    final jp = TextStyle(
      fontFamily: AppTypography.fontJp,
      fontFamilyFallback: const ['Noto Sans JP'],
      fontWeight: FontWeight.w800,
      fontSize: s,
      height: 1,
      color: Colors.white,
    );

    final char = Stack(
      children: [
        Opacity(opacity: 0, child: Text('あ', style: jp)),
        _kana
            ? Transform.translate(
                offset: Offset(0, s * 0.09),
                child: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (r) => AppColors.gradTextCyan.createShader(r),
                  child: Text('あ', style: jp),
                ),
              )
            : Text('a', style: latin),
      ],
    );

    return GestureDetector(
      onTap: () => _swap(!_kana),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Semantics(
          label: 'eiga',
          button: true,
          excludeSemantics: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('e', style: latin),
              AnimatedBuilder(
                animation: _c,
                builder: (context, child) => Opacity(
                  opacity: 1 - _c.value,
                  child: Transform.translate(
                    offset: Offset(0, -s * 0.35 * _c.value),
                    child: child,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [Text('ig', style: latin), char],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
