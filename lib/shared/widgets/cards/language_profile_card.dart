import 'package:flutter/material.dart';

/// Одна картка профілю з ефектом наведення (hover) та нейтральною кнопкою видалення.
class LanguageProfileCard extends StatefulWidget {
  const LanguageProfileCard({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
    this.onDelete,
  });

  final String title;
  final bool isActive;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  @override
  State<LanguageProfileCard> createState() => _LanguageProfileCardState();
}

class _LanguageProfileCardState extends State<LanguageProfileCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(18);

    final bgColor = widget.isActive
        ? null
        : (_hover ? const Color(0x1AFFFFFF) : const Color(0x0DFFFFFF)); // rgba(255,255,255,.1)

    final borderColor = widget.isActive
        ? const Color(0x9967E8F9)
        : (_hover ? const Color(0x4DFFFFFF) : const Color(0x24FFFFFF)); // rgba(255,255,255,.3)

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
          gradient: widget.isActive
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0x597C3AED), Color(0x380EA5E9)],
                )
              : null,
          borderRadius: radius,
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: radius,
            onTap: widget.onTap,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 62),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      widget.isActive
                          ? Icons.radio_button_checked_rounded
                          : Icons.radio_button_off_rounded,
                      color: widget.isActive ? const Color(0xFF67E8F9) : cs.onSurfaceVariant,
                      size: 22,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (widget.onDelete != null)
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          hoverColor: const Color(0x28EF4444), // м'який червоний при наведенні
                          onTap: widget.onDelete,
                          child: const SizedBox(
                            width: 36,
                            height: 36,
                            child: Center(
                              child: Icon(
                                Icons.delete_outline_rounded,
                                size: 20,
                                color: Colors.white54, // нейтральний непомітний колір в звичайному стані
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
      ),
    );
  }
}
