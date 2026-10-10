import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';
import 'player_glass_button.dart';

enum PlayerLockPhase { unlocked, pending, locked }

enum _NoteKind { info, ok }

class PlayerRail extends StatefulWidget {
  final VoidCallback onToggleSettings;
  final VoidCallback onToggleSpeed;
  final double currentSpeed;
  final bool isPanelOpen;
  final ValueChanged<PlayerLockPhase> onLockChanged;
  final VoidCallback onInteraction;
  final int autoLockTrigger;
  final int cancelLockTrigger;

  const PlayerRail({
    Key? key,
    required this.onToggleSettings,
    required this.onToggleSpeed,
    required this.currentSpeed,
    required this.isPanelOpen,
    required this.onLockChanged,
    required this.onInteraction,
    this.autoLockTrigger = 0,
    this.cancelLockTrigger = 0,
  }) : super(key: key);

  @override
  State<PlayerRail> createState() => _PlayerRailState();
}

class _PlayerRailState extends State<PlayerRail> with TickerProviderStateMixin {
  PlayerLockPhase _phase = PlayerLockPhase.unlocked;
  bool _busy = false;

  String _noteText = '';
  _NoteKind _noteKind = _NoteKind.info;
  bool _noteShow = false;
  bool _countdown = false;
  int _cdKey = 0;

  Timer? _cdTimer, _noteTimer, _collapseTimer, _busyTimer;

  late final AnimationController _wig =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  late final AnimationController _pend =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

  // keyframes wig: 0 → -14° → 12° → -6° → 0
  late final Animation<double> _wigAngle = TweenSequence<double>([
    _seg(0, -14, 20),
    _seg(-14, 12, 25),
    _seg(12, -6, 25),
    _seg(-6, 0, 30),
  ]).animate(_wig);

  TweenSequenceItem<double> _seg(double a, double b, double w) => TweenSequenceItem(
        tween: Tween(begin: a, end: b).chain(CurveTween(curve: Curves.easeInOut)),
        weight: w,
      );

  @override
  void dispose() {
    _cdTimer?.cancel();
    _noteTimer?.cancel();
    _collapseTimer?.cancel();
    _busyTimer?.cancel();
    _wig.dispose();
    _pend.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PlayerRail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.autoLockTrigger != oldWidget.autoLockTrigger) {
      if (_phase == PlayerLockPhase.unlocked && !_busy) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _startLock(); // Авто-блокування з 3-секундним відліком (показує кнопку і пілюлю)
          }
        });
      }
    }
    if (widget.cancelLockTrigger != oldWidget.cancelLockTrigger) {
      if (_phase == PlayerLockPhase.pending) {
        _cancelLock();
      }
    }
  }

  void _note(String text, _NoteKind kind, {Duration? hideAfter, bool countdown = false}) {
    _noteTimer?.cancel();
    setState(() {
      _noteText = text;
      _noteKind = kind;
      _noteShow = true;
      _countdown = countdown;
      if (countdown) _cdKey++;
    });
    if (hideAfter != null) {
      _noteTimer = Timer(hideAfter, () {
        if (mounted) setState(() => _noteShow = false);
      });
    }
  }

  void _notify() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.onLockChanged(_phase);
      }
    });
  }

  void _startLock() {
    var c = 3;
    setState(() => _phase = PlayerLockPhase.pending);
    _pend.repeat(reverse: true);
    _note('Блокування через 3 с', _NoteKind.info, countdown: true);
    _notify();
    widget.onInteraction();
    _cdTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      c--;
      if (c > 0) {
        setState(() => _noteText = 'Блокування через $c с');
      } else {
        t.cancel();
        _doLock();
      }
    });
  }

  void _cancelLock() {
    _cdTimer?.cancel();
    _pend.reset();
    setState(() => _phase = PlayerLockPhase.unlocked);
    _note('Скасовано', _NoteKind.info, hideAfter: const Duration(milliseconds: 900));
    _notify();
    widget.onInteraction();
  }

  void _doLock() {
    _cdTimer?.cancel();
    _pend.reset();
    setState(() {
      _phase = PlayerLockPhase.unlocked;
      _busy = true;
    });
    _notify();
    _wig.duration = const Duration(milliseconds: 200);
    _wig.forward(from: 0);
    _busyTimer = Timer(const Duration(milliseconds: 200), () {
      if (!mounted) return;
      setState(() {
        _phase = PlayerLockPhase.locked;
        _busy = false;
        _noteShow = false;
      });
      _note('Заблоковано', _NoteKind.info, hideAfter: const Duration(milliseconds: 900));
      _notify();
      widget.onInteraction();
    });
  }

  void _unlock() {
    _collapseTimer?.cancel();
    setState(() {
      _busy = true;
    });
    _wig.duration = const Duration(milliseconds: 160);
    _wig.forward(from: 0);
    _busyTimer = Timer(const Duration(milliseconds: 160), () {
      if (!mounted) return;
      setState(() {
        _phase = PlayerLockPhase.unlocked;
        _busy = false;
      });
      _note('Розблоковано', _NoteKind.info, hideAfter: const Duration(milliseconds: 900));
      _notify();
      widget.onInteraction();
    });
  }

  void _onLockTap() {
    if (_busy) return;
    switch (_phase) {
      case PlayerLockPhase.pending:
        _cancelLock();
        _doLock(); // При ручному кліку — блокуємо миттєво
      case PlayerLockPhase.unlocked:
        _doLock(); // Миттєве блокування при кліку
      case PlayerLockPhase.locked:
        _unlock();
    }
  }

  @override
  Widget build(BuildContext context) {
    final locked = _phase == PlayerLockPhase.locked;
    final pending = _phase == PlayerLockPhase.pending;
    final speed = widget.currentSpeed;

    final lockButton = PlayerGlassButton(
      tooltip: 'Блокування',
      isOn: locked || pending,
      onPressed: _onLockTap,
      builder: (color) => _LockIcon(color: color, closed: locked),
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 44,
                spreadRadius: -14,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E0A34).withOpacity(0.72),
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: Colors.white.withOpacity(0.22), width: 1.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PlayerGlassButton(
                      tooltip: 'Налаштування субтитрів',
                      isOn: widget.isPanelOpen,
                      onPressed: widget.onToggleSettings,
                      builder: (c) => Icon(Icons.tune, size: 20, color: c),
                    ),
                    const SizedBox(width: 6),
                    PlayerGlassButton(
                      tooltip: 'Швидкість',
                      onPressed: widget.onToggleSpeed,
                      builder: (c) => Text(
                        '${speed.toStringAsFixed(speed == 1.0 ? 1 : 2)}x',
                        style: TextStyle(
                          color: c,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    AnimatedBuilder(
                      animation: Listenable.merge([_wig, _pend]),
                      child: lockButton,
                      builder: (context, child) {
                        final scale = 1 + 0.12 * Curves.easeInOut.transform(_pend.value);
                        return Transform.rotate(
                          angle: _wigAngle.value * math.pi / 180,
                          child: Transform.scale(scale: scale, child: child),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // пілюля, що "виростає" під замочком
        Positioned(right: 1.5, top: 61.5, child: _buildNote()),
      ],
    );
  }

  Widget _buildNote() {
    final ok = _noteKind == _NoteKind.ok;
    return IgnorePointer(
      child: AnimatedOpacity(
        opacity: _noteShow ? 1 : 0,
        duration: const Duration(milliseconds: 150),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: AnimatedAlign(
            alignment: Alignment.centerRight,
            widthFactor: _noteShow ? 1 : 0,
            heightFactor: 1,
            duration: Duration(milliseconds: _noteShow ? 350 : 160),
            curve: Curves.easeOutCubic,
            child: Container(
              height: 32,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: ok
                    ? const Color.fromRGBO(10, 40, 52, 0.94)
                    : const Color.fromRGBO(14, 10, 34, 0.94),
                borderRadius: BorderRadius.circular(99),
                border: Border.all(
                  color: ok ? AppColors.cyan300.withOpacity(0.7) : Colors.white.withOpacity(0.25),
                  width: 1.5,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    _noteText,
                    maxLines: 1,
                    style: TextStyle(
                      color: ok ? AppColors.cyan300 : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (_countdown)
                    Positioned(
                      left: -14,
                      right: -14,
                      bottom: -1.5,
                      height: 3,
                      child: TweenAnimationBuilder<double>(
                        key: ValueKey(_cdKey),
                        tween: Tween(begin: 0, end: 1),
                        duration: const Duration(seconds: 3),
                        builder: (context, v, _) => Align(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: v,
                            heightFactor: 1,
                            child: const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF3B82F6), Color(0xFF06B6D4), Color(0xFF38BDF8)],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF0EA5E9),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Замочок як в HTML: дужка повертається навколо (8, 11) і "защіскується".
class _LockIcon extends StatelessWidget {
  final Color color;
  final bool closed;
  const _LockIcon({required this.color, required this.closed});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(end: closed ? 0 : -32),
      duration: Duration(milliseconds: closed ? 300 : 160),
      curve: closed ? const Cubic(0.3, 1.7, 0.5, 1) : Curves.easeOut,
      builder: (context, angle, _) => SizedBox(
        width: 20,
        height: 20,
        child: CustomPaint(painter: _LockPainter(angle, color)),
      ),
    );
  }
}

class _LockPainter extends CustomPainter {
  final double angleDeg;
  final Color color;
  _LockPainter(this.angleDeg, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 24, size.height / 24);

    canvas.save();
    canvas.translate(8, 11);
    canvas.rotate(angleDeg * math.pi / 180);
    canvas.translate(-8, -11);
    final shackle = Path()
      ..moveTo(8, 11)
      ..lineTo(8, 7)
      ..arcToPoint(const Offset(16, 7), radius: const Radius.circular(4), clockwise: true)
      ..lineTo(16, 11);
    canvas.drawPath(
      shackle,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round,
    );
    canvas.restore();

    canvas.drawRRect(
      RRect.fromRectAndRadius(const Rect.fromLTWH(4, 11, 16, 10), const Radius.circular(2.5)),
      Paint()..color = color,
    );
    canvas.drawCircle(const Offset(12, 16), 1.5, Paint()..color = const Color(0xFF14102A));
  }

  @override
  bool shouldRepaint(covariant _LockPainter old) =>
      old.angleDeg != angleDeg || old.color != color;
}
