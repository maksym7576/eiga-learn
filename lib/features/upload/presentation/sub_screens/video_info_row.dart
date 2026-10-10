import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';
import 'package:eiga/shared/widgets/cards/glass_card.dart';

/// Video info row with Replace button inside unified AppGlassCard.
class VideoInfoRow extends StatelessWidget {
  final String? title;
  final String? details;
  final VoidCallback onReplace;
  final String replaceLabel;

  const VideoInfoRow({
    Key? key,
    this.title,
    this.details,
    required this.onReplace,
    this.replaceLabel = 'Replace',
  }) : super(key: key);

  bool get _empty => title == null;

  @override
  Widget build(BuildContext context) {
    final mut = Colors.white.withOpacity(0.5);

    return AppGlassCard(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(builder: (context, c) {
        final compact = c.maxWidth <= 420;
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF1B143B).withOpacity(0.70),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.18), width: 1.2),
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                ),
                child: Icon(Icons.movie, size: 16, color: _empty ? mut : AppColors.cyan300),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _empty ? 'No video' : title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: _empty ? mut : Colors.white,
                        fontSize: 14,
                        height: 1.25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      _empty ? 'Add a video to see its details' : (details ?? ''),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: mut,
                        fontSize: 11,
                        height: 1.25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              _ReplaceButton(label: replaceLabel, compact: compact, onTap: onReplace),
            ],
          ),
        );
      }),
    );
  }
}

class _ReplaceButton extends StatefulWidget {
  final String label;
  final bool compact;
  final VoidCallback onTap;
  const _ReplaceButton({required this.label, required this.compact, required this.onTap});

  @override
  State<_ReplaceButton> createState() => _ReplaceButtonState();
}

class _ReplaceButtonState extends State<_ReplaceButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            height: 36,
            width: widget.compact ? 36 : null,
            padding: widget.compact ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_hover ? 0.16 : 0.09),
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: Colors.white.withOpacity(0.20), width: 1.2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.refresh, size: 15, color: AppColors.cyan300),
                if (!widget.compact) ...[
                  const SizedBox(width: 7),
                  Text(
                    widget.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
