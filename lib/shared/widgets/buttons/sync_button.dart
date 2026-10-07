import 'package:flutter/material.dart';

import 'ghost_button.dart';

/// Кнопка синхронізації. Жовта крапка з пульсуючим кільцем = потрібна синхронізація.
/// Під час [onSync] іконка крутиться. Після завершення змінюй [needsSync] зовні.
class SyncButton extends StatefulWidget {
  const SyncButton({
    super.key,
    required this.needsSync,
    required this.onSync,
    required this.tooltip,
  });

  final bool needsSync;
  final Future<void> Function() onSync;
  final String tooltip;

  @override
  State<SyncButton> createState() => _SyncButtonState();
}

class _SyncButtonState extends State<SyncButton> with TickerProviderStateMixin {
  static const _amber = Color(0xFFFBBF24);

  late final AnimationController _spin = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );
  late final AnimationController _ping = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  );

  bool _syncing = false;

  @override
  void initState() {
    super.initState();
    if (widget.needsSync) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _ping.repeat();
      });
    }
  }

  @override
  void didUpdateWidget(covariant SyncButton old) {
    super.didUpdateWidget(old);
    if (widget.needsSync && !_ping.isAnimating) _ping.repeat();
    if (!widget.needsSync) _ping.stop();
  }

  @override
  void dispose() {
    _spin.stop();
    _ping.stop();
    _spin.dispose();
    _ping.dispose();
    super.dispose();
  }

  Future<void> _run() async {
    if (_syncing) return;
    setState(() => _syncing = true);
    _spin.repeat();
    try {
      await widget.onSync();
    } finally {
      _spin.stop();
      if (mounted) setState(() => _syncing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GhostButton(
          tooltip: widget.tooltip,
          onPressed: _run,
          builder: (_, hovered) {
            const icon = Icon(Icons.sync_rounded, size: 22);
            if (_syncing) return RotationTransition(turns: _spin, child: icon);
            return AnimatedRotation(
              turns: hovered ? .5 : 0,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutBack,
              child: icon,
            );
          },
        ),
        if (widget.needsSync)
          Positioned(
            top: 4,
            right: 4,
            child: IgnorePointer(
              child: SizedBox(
                width: 12,
                height: 12,
                child: AnimatedBuilder(
                  animation: _ping,
                  builder: (_, __) {
                    final t = (_ping.value / .8).clamp(0.0, 1.0);
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Transform.scale(
                          scale: 1 + 1.4 * t,
                          child: Opacity(
                            opacity: .8 * (1 - t),
                            child: const DecoratedBox(
                              decoration: BoxDecoration(
                                  color: _amber, shape: BoxShape.circle),
                              child: SizedBox.expand(),
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: _amber,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: _amber.withOpacity(.9), blurRadius: 12),
                            ],
                          ),
                          child: const SizedBox.expand(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
