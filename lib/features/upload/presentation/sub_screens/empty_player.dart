import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';

/// Порожній плеєр: одна велика кнопка "Add video".
/// Коли відео вибрано — заміни цей віджет на VideoPlayerContainer.
class EmptyPlayer extends StatefulWidget {
  final VoidCallback onAddVideo;
  final String label;

  /// false — якщо ти вже обгортаєш слот плеєра власною карткою
  final bool withCard;

  const EmptyPlayer({
    Key? key,
    required this.onAddVideo,
    this.label = 'Add video',
    this.withCard = true,
  }) : super(key: key);

  @override
  State<EmptyPlayer> createState() => _EmptyPlayerState();
}

class _EmptyPlayerState extends State<EmptyPlayer> {
  bool _hover = false;
  bool _down = false;
  bool _focus = false;

  @override
  Widget build(BuildContext context) {
    final bg = _down
        ? AppColors.cyan300.withOpacity(0.2)
        : (_hover ? AppColors.cyan300.withOpacity(0.14) : AppColors.surfaceSubtle);
    final border = _hover || _down ? AppColors.borderHover : AppColors.borderDefault;
    const d = Duration(milliseconds: 200);

    final button = AspectRatio(
      aspectRatio: 16 / 9,
      child: Semantics(
        button: true,
        label: widget.label,
        child: FocusableActionDetector(
          mouseCursor: SystemMouseCursors.click,
          onShowHoverHighlight: (v) => setState(() => _hover = v),
          onShowFocusHighlight: (v) => setState(() => _focus = v),
          actions: {
            ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: (_) {
              widget.onAddVideo();
              return null;
            }),
          },
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: (_) => setState(() => _down = true),
            onTapUp: (_) => setState(() => _down = false),
            onTapCancel: () => setState(() => _down = false),
            onTap: widget.onAddVideo,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: d,
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: border, width: 1.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF2563EB), Color(0xFF0EA5E9), Color(0xFF38BDF8)],
                              stops: [0, 0.5, 1],
                            ),
                            border: Border.all(color: Colors.white.withOpacity(0.45), width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF0EA5E9).withOpacity(0.8),
                                blurRadius: 24,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.add, color: Colors.white, size: 28),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_focus)
                  Positioned(
                    left: -5,
                    top: -5,
                    right: -5,
                    bottom: -5,
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: AppColors.cyan300, width: 2),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );

    if (!widget.withCard) return button;
    return _GlassCard(child: button);
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderDefault, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}
