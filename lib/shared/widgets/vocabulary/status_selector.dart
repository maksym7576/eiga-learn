import 'package:flutter/material.dart';
import 'package:eiga/database/models/word_models.dart';
import 'package:eiga/core/theme/vocabulary_theme.dart';

class StatusSelector extends StatelessWidget {
  const StatusSelector({super.key, required this.status, required this.onChanged, required this.onReset, this.t});
  final WordStatus status;
  final ValueChanged<WordStatus> onChanged;
  final VoidCallback onReset;
  final String Function(String key)? t;

  static const _options = [WordStatus.unknown, WordStatus.learning, WordStatus.known];

  String _statusLabel(WordStatus s) {
    if (t == null) return s.label;
    return switch (s) {
      WordStatus.unknown => t!('status_unknown'),
      WordStatus.learning => t!('status_learning'),
      WordStatus.known => t!('status_known'),
      WordStatus.none => '',
    };
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.w(.07),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.w(.14)),
        ),
        child: Row(children: [
          for (final s in _options) ...[
            Expanded(child: _StatusButton(status: s, label: _statusLabel(s), selected: status == s, onTap: () => onChanged(s))),
            const SizedBox(width: 6),
          ],
          _ResetButton(enabled: status != WordStatus.none, onTap: onReset),
        ]),
      );
}

class _StatusButton extends StatelessWidget {
  const _StatusButton({required this.status, required this.label, required this.selected, required this.onTap});
  final WordStatus status;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.status(status)!;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 36,
        decoration: BoxDecoration(
          color: selected ? c.withValues(alpha: .22) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? c : Colors.transparent, width: 1.5),
          boxShadow: selected ? [BoxShadow(color: c.withValues(alpha: .5), blurRadius: 18, spreadRadius: -8, offset: const Offset(0, 6))] : null,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(width: 9, height: 9, decoration: BoxDecoration(color: c, shape: BoxShape.circle)),
          const SizedBox(width: 7),
          Text(label,
              style: AppText.ui(size: 13, weight: FontWeight.w800, color: selected ? Colors.white : AppColors.w(.7))),
        ]),
      ),
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton({required this.enabled, required this.onTap});
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: enabled ? 1 : .3,
        child: GestureDetector(
          onTap: enabled ? onTap : null,
          child: Container(
            width: 42,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.w(.06),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.w(.14)),
            ),
            child: Text('✕', style: AppText.ui(size: 15, color: AppColors.w(.75))),
          ),
        ),
      );
}
