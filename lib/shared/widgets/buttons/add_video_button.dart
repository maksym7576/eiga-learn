import 'package:flutter/material.dart';

/// Велика кнопка «Add Video».
class AddVideoButton extends StatefulWidget {
  const AddVideoButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.height = 88,
  });

  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final double height;

  @override
  State<AddVideoButton> createState() => _AddVideoButtonState();
}

class _AddVideoButtonState extends State<AddVideoButton>
    with TickerProviderStateMixin {
  static const _radius = 28.0;
  static const _violet = Color(0xFF7C3AED);
  static const _indigo = Color(0xFF6366F1);
  static const _sky = Color(0xFF0EA5E9);
  static const _skyGlow = Color(0xFF38BDF8);
  static const _plusColor = Color(0xFF6D28D9);
  static const _focusColor = Color(0xFF67E8F9);

  late final AnimationController _halo = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  );
  late final AnimationController _shine = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  );

  bool _hover = false;
  bool _down = false;
  bool _focus = false;
  bool? _reduced;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduced = MediaQuery.disableAnimationsOf(context);
    if (reduced == _reduced) return;
    _reduced = reduced;
    if (reduced) {
      _halo.stop();
      _shine.stop();
    } else {
      _halo.repeat();
      _shine.repeat();
    }
  }

  @override
  void dispose() {
    _halo.dispose();
    _shine.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = _down ? .97 : (_hover ? 1.015 : 1.0);
    final lift = (_hover && !_down) ? -4.0 : 0.0;
    const br = BorderRadius.all(Radius.circular(_radius));

    return AnimatedBuilder(
      animation: _halo,
      builder: (context, child) {
        final t = Curves.easeOut.transform(_halo.value);
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: br,
            boxShadow: _reduced == true
                ? null
                : [
                    BoxShadow(
                      color: _violet.withOpacity(.6 * (1 - t)),
                      spreadRadius: 24 * t,
                    ),
                  ],
          ),
          child: child,
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: const Cubic(.2, .9, .3, 1.2),
              height: widget.height,
              transformAlignment: Alignment.center,
              transform: Matrix4.identity()
                ..translate(0.0, lift)
                ..scale(scale),
              decoration: BoxDecoration(
                borderRadius: br,
                boxShadow: [
                  BoxShadow(
                    color: (_hover ? _skyGlow : _indigo).withOpacity(.85),
                    blurRadius: _hover ? 70 : 50,
                    spreadRadius: _hover ? -8 : -10,
                    offset: Offset(0, _hover ? 28 : 18),
                  ),
                ],
              ),
              child: Material(
                type: MaterialType.transparency,
                borderRadius: br,
                clipBehavior: Clip.antiAlias,
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: br,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [_violet, _indigo, _sky],
                      stops: [0, .5, 1],
                    ),
                    border: Border.all(color: Colors.white.withOpacity(.45)),
                  ),
                  child: InkWell(
                    borderRadius: br,
                    onTap: widget.onPressed,
                    onHighlightChanged: (v) => setState(() => _down = v),
                    onFocusChange: (v) => setState(() => _focus = v),
                    splashFactory: InkRipple.splashFactory,
                    splashColor: Colors.white.withOpacity(.45),
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: _radius,
                          right: _radius,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.45),
                            ),
                          ),
                        ),
                        _content(),
                        if (_reduced != true) _shineBand(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (_focus)
              Positioned(
                left: -7,
                right: -7,
                top: -7,
                bottom: -7,
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_radius + 7),
                      border: Border.all(color: _focusColor, width: 3),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _content() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          AnimatedRotation(
            turns: _hover ? .25 : 0,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutBack,
            child: AnimatedScale(
              scale: _hover ? 1.1 : 1,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutBack,
              child: Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.add_rounded, size: 34, color: _plusColor),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.5,
                    height: 1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 13,
                    height: 1,
                    color: Colors.white.withOpacity(.8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          AnimatedSlide(
            offset: Offset(_hover ? 8 / 28 : 0, 0),
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutBack,
            child: const Icon(Icons.arrow_forward_rounded,
                size: 28, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _shineBand() {
    return Positioned.fill(
      child: IgnorePointer(
        child: LayoutBuilder(
          builder: (context, c) {
            final w = c.maxWidth;
            return AnimatedBuilder(
              animation: _shine,
              builder: (context, _) {
                final raw = ((_shine.value - .55) / .45).clamp(0.0, 1.0);
                final t = Curves.easeInOut.transform(raw);
                final left = (-.4 + 1.7 * t) * w;
                return Stack(
                  children: [
                    Positioned(
                      left: left,
                      top: 0,
                      bottom: 0,
                      width: .28 * w,
                      child: Transform(
                        transform: Matrix4.skewX(-20 * 3.1415926535 / 180),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.white.withOpacity(.4),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
