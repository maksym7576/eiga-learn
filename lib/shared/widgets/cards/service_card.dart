import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

/// Базова "скляна" картка сервісу (іконка + назва + опис + тег).
/// Підтримує hover (web/desktop) та ефект натискання.
class ServiceCard extends StatefulWidget {
  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.tag,
    this.isMain = false,
    this.tagStyle = ServiceTagStyle.neutral,
    this.isSelected = false,
    this.hasToken = false,
    this.onTap,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final String tag;
  final bool isMain;
  final ServiceTagStyle tagStyle;
  final bool isSelected;
  final bool hasToken;
  final VoidCallback? onTap;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

enum ServiceTagStyle { neutral, accent }

class _ServiceCardState extends State<ServiceCard> {
  bool _hover = false;
  bool _pressed = false;

  static const _radius = 24.0;
  static const _anim = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final main = widget.hasToken;

    // ---- Фон ----
    final Gradient? gradient = main
        ? (_hover
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.violet600,
                  AppColors.sky500.withOpacity(0.95),
                ],
              )
            : AppColors.gradSelected)
        : null;

    final Color? bgColor = main
        ? null
        : (_hover ? AppColors.surfaceGlassHover : AppColors.surfaceGlass);

    // ---- Рамка ----
    final Color border = _hover
        ? (main ? AppColors.cyan200.withOpacity(0.9) : AppColors.borderHover)
        : (main ? AppColors.borderSelected : AppColors.borderStrong);

    // ---- Тінь ----
    final List<BoxShadow> shadows = [
      BoxShadow(
        color: main
            ? (_hover
                ? AppColors.sky400.withOpacity(0.55)
                : AppColors.indigo500.withOpacity(0.55))
            : (_hover
                ? AppColors.sky400.withOpacity(0.35)
                : Colors.black.withOpacity(0.55)),
        blurRadius: _hover ? 40 : 32,
        offset: Offset(0, _hover ? 20 : 14),
        spreadRadius: -8,
      ),
    ];

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() {
        _hover = false;
        _pressed = false;
      }),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: _anim,
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, _pressed ? -1.0 : (_hover ? -4.0 : 0.0))
            ..scale(_pressed ? 0.98 : 1.0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius),
            boxShadow: shadows,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_radius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: AnimatedContainer(
                duration: _anim,
                curve: Curves.easeOut,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: bgColor,
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(_radius),
                  border: Border.all(color: border, width: 1.5),
                ),
                child: Row(
                  children: [
                    _IconBox(isMain: main, hover: _hover, child: widget.icon),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.title,
                            style: AppTypography.title.copyWith(height: 1.15),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.subtitle,
                            style: AppTypography.bodySm.copyWith(
                              color: Colors.white.withOpacity(main ? 0.70 : 0.60),
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: _TagPill(
                              text: widget.tag,
                              style: widget.tagStyle,
                              hover: _hover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IconBox extends StatelessWidget {
  const _IconBox({
    required this.isMain,
    required this.hover,
    required this.child,
  });

  final bool isMain;
  final bool hover;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: hover ? 1.12 : 1.0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutBack,
      child: AnimatedRotation(
        turns: hover ? -6 / 360 : 0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        child: Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: isMain
                ? const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [AppColors.violet700, AppColors.sky400],
                  )
                : null,
            color: isMain ? null : Colors.white.withOpacity(0.10),
            border: isMain
                ? null
                : Border.all(color: Colors.white.withOpacity(0.15)),
            boxShadow: isMain
                ? [
                    BoxShadow(
                      color: AppColors.indigo500.withOpacity(0.30),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          child: child,
        ),
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  const _TagPill({
    required this.text,
    required this.style,
    required this.hover,
  });

  final String text;
  final ServiceTagStyle style;
  final bool hover;

  @override
  Widget build(BuildContext context) {
    for (final c in [Colors.white]) {
      // dummy loop to avoid unused if needed
      c;
    }
    final accent = style == ServiceTagStyle.accent;

    final Color bg = hover
        ? Colors.white.withOpacity(0.28)
        : (accent
            ? AppColors.cyan300.withOpacity(0.10)
            : Colors.white.withOpacity(0.15));
    final Color border = hover
        ? Colors.white.withOpacity(0.50)
        : (accent ? AppColors.borderAccentSoft : Colors.white.withOpacity(0.20));
    final Color fg = hover
        ? Colors.white
        : (accent ? AppColors.textAccent : Colors.white);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: border),
      ),
      child: Text(
        text,
        style: AppTypography.caption.copyWith(
          color: fg,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
