import 'package:flutter/material.dart';
import 'package:eiga/core/theme/vocabulary_theme.dart';

class Pill extends StatelessWidget {
  const Pill({super.key, required this.label, required this.onTap, this.dimmed = false});
  final String label;
  final VoidCallback onTap;
  final bool dimmed;

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: dimmed ? .45 : 1,
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.w(.09),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.w(.2), width: 1.5),
            ),
            child: Text(label, style: AppText.ui(size: 12, weight: FontWeight.w800)),
          ),
        ),
      );
}

enum ChipKind { normal, jlpt, note, meaning }

class InfoChip extends StatelessWidget {
  const InfoChip(this.label, {super.key, this.kind = ChipKind.normal});
  final String label;
  final ChipKind kind;

  @override
  Widget build(BuildContext context) {
    final (bg, border, fg) = switch (kind) {
      ChipKind.normal => (AppColors.w(.12), AppColors.w(.18), Colors.white),
      ChipKind.jlpt => (AppColors.violet.withValues(alpha: .25), AppColors.violet.withValues(alpha: .6), Colors.white),
      ChipKind.note => (AppColors.amber.withValues(alpha: .15), AppColors.amber.withValues(alpha: .5), AppColors.amberSoft),
      ChipKind.meaning => (AppColors.green.withValues(alpha: .18), AppColors.green.withValues(alpha: .55), AppColors.greenSoft),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: border),
      ),
      child: Text(label, style: AppText.ui(size: 11, weight: FontWeight.w800, color: fg)),
    );
  }
}

class SectionBlock extends StatelessWidget {
  const SectionBlock({super.key, required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(),
              style: AppText.ui(size: 11, weight: FontWeight.w800, color: AppColors.w(.5), letterSpacing: .77)),
          const SizedBox(height: 8),
          child,
        ],
      );
}

class EmptyBox extends StatelessWidget {
  const EmptyBox(this.text, {super.key, this.padding = 22});
  final String text;
  final double padding;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: padding, horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.w(.06),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.w(.16)),
        ),
        child: Text(text,
            textAlign: TextAlign.center, style: AppText.ui(size: 13, weight: FontWeight.w500, color: AppColors.w(.65))),
      );
}

class ShimmerBar extends StatefulWidget {
  const ShimmerBar({super.key});
  @override
  State<ShimmerBar> createState() => _ShimmerBarState();
}

class _ShimmerBarState extends State<ShimmerBar> with SingleTickerProviderStateMixin {
  late final _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1900))..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
        widthFactor: .7,
        alignment: Alignment.centerLeft,
        child: Container(
          height: 22,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: AppColors.w(.12), borderRadius: BorderRadius.circular(8)),
          child: AnimatedBuilder(
            animation: _c,
            builder: (_, __) => Align(
              alignment: Alignment(-2 + 4 * _c.value, 0),
              child: FractionallySizedBox(
                widthFactor: .45,
                heightFactor: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.transparent, AppColors.cyan.withValues(alpha: .35), Colors.transparent]),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
