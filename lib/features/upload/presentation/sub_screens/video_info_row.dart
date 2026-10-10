import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';

/// Рядок з інформацією про відео + кнопка Replace.
/// [title] == null → порожній стан ("No video").
/// Коли відео є — передай назву файлу і рядок з деталями (розмір, тривалість, роздільність...).
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

    return _GlassCard(
      child: LayoutBuilder(builder: (context, c) {
        // @container (max-width: 420px) → тільки іконка
        final compact = c.maxWidth <= 420;
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.surfaceSubtle,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderDefault, width: 1.2),
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
              border: Border.all(color: AppColors.borderDefault, width: 1.2),
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
