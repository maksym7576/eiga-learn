import 'package:flutter/material.dart';
import '../../../core/theme/app_gradients.dart';

/// Градієнтна кнопка-пілюля «Add profile» з виразною реакцією на наведення.
class AddProfileButton extends StatefulWidget {
  const AddProfileButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  State<AddProfileButton> createState() => _AddProfileButtonState();
}

class _AddProfileButtonState extends State<AddProfileButton> {
  bool _hover = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(999);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() {
        _hover = false;
        _pressed = false;
      }),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, _pressed ? 0.0 : (_hover ? -4.0 : 0.0))
            ..scale(_pressed ? 0.96 : (_hover ? 1.04 : 1.0)),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: AppGradients.button,
            borderRadius: radius,
            border: Border.all(
              color: _hover ? const Color(0xFF67E8F9) : const Color(0x66FFFFFF),
              width: _hover ? 2.0 : 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _hover
                    ? const Color(0xFF38BDF8).withOpacity(0.75)
                    : const Color(0xB36366F1),
                blurRadius: _hover ? 36 : 26,
                spreadRadius: _hover ? -2 : -8,
                offset: Offset(0, _hover ? 16 : 10),
              ),
            ],
          ),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_circle_outline_rounded,
                    color: Colors.white, size: 22),
                const SizedBox(width: 10),
                Text(
                  widget.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
