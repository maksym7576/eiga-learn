import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';
import 'package:eiga/shared/widgets/cards/glass_card.dart';

/// Панель аудіотреків для першого екрана.
class TracksPanel extends StatelessWidget {
  final List<Map<String, String>> audioTracks;
  final int? selectedAudio;
  final ValueChanged<int>? onAudioSelected;

  const TracksPanel({
    super.key,
    this.audioTracks = const [],
    this.selectedAudio,
    this.onAudioSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppGlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              const Icon(Icons.volume_down, size: 18, color: Color(0xFF67E8F9)),
              const SizedBox(width: 8),
              const Text(
                'Audio Tracks',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 0.8),
              ),
              const Spacer(),
              Text(
                '${audioTracks.length}',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white.withOpacity(0.6)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (audioTracks.isEmpty)
            _EmptyState(
              icon: Icons.volume_down,
              title: 'No audio tracks',
              text: 'Audio tracks will appear here once a video is added.',
            )
          else
            for (var i = 0; i < audioTracks.length; i++)
              Padding(
                padding: EdgeInsets.only(top: i == 0 ? 0 : 6),
                child: _TrackRow(
                  icon: Icons.volume_down,
                  title: audioTracks[i]['t'] ?? '',
                  language: audioTracks[i]['l'] ?? 'und',
                  selected: selectedAudio == i,
                  onTap: onAudioSelected == null ? null : () => onAudioSelected!(i),
                ),
              ),
        ],
      ),
    );
  }
}

class _TrackRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String language;
  final bool selected;
  final VoidCallback? onTap;
  const _TrackRow({
    required this.icon,
    required this.title,
    required this.language,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mut = Colors.white.withOpacity(0.5);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected ? AppColors.cyan300.withOpacity(0.14) : AppColors.surfaceSubtle,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.borderHover : AppColors.borderDefault,
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)),
              child: Icon(icon, size: 16, color: selected ? AppColors.cyan300 : mut),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    language.toUpperCase(),
                    style: TextStyle(color: mut, fontSize: 11, height: 1.25, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            if (selected) const Icon(Icons.check, size: 18, color: AppColors.cyan300),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  const _EmptyState({required this.icon, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    final mut = Colors.white.withOpacity(0.5);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 30, 12, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: CustomPaint(
              painter: _DashedCirclePainter(Colors.white.withOpacity(0.2)),
              child: Icon(icon, size: 22, color: mut),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: mut, fontSize: 12, height: 1.5, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  final Color color;
  _DashedCirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 1.3, dash = 4.0, gap = 3.0;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    final path = Path()
      ..addOval(Rect.fromLTWH(stroke / 2, stroke / 2, size.width - stroke, size.height - stroke));
    for (final m in path.computeMetrics()) {
      double d = 0;
      while (d < m.length) {
        canvas.drawPath(m.extractPath(d, d + dash), paint);
        d += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedCirclePainter old) => old.color != color;
}
