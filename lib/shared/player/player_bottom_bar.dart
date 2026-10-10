import 'package:flutter/material.dart';
import 'player_slider.dart';

class PlayerBottomBar extends StatelessWidget {
  final double currentPosition;
  final double duration;
  final ValueChanged<double> onSeek; // секунди
  final VoidCallback? onSeekStart;
  final VoidCallback? onSeekEnd;
  final VoidCallback onToggleFullscreen;
  final bool isFullScreen;

  /// true на великих екранах — показуємо кнопку гучності
  final bool showVolume;
  final double volume; // 0..1
  final ValueChanged<double> onVolumeChanged;
  final VoidCallback onToggleMute;

  const PlayerBottomBar({
    Key? key,
    required this.currentPosition,
    required this.duration,
    required this.onSeek,
    required this.onToggleFullscreen,
    required this.isFullScreen,
    this.onSeekStart,
    this.onSeekEnd,
    this.showVolume = false,
    this.volume = 1,
    required this.onVolumeChanged,
    required this.onToggleMute,
  }) : super(key: key);

  String _fmt(double seconds) {
    final s = seconds.clamp(0, duration).floor();
    final h = s ~/ 3600;
    final m = (s % 3600) ~/ 60;
    final sec = s % 60;
    final mStr = m.toString().padLeft(2, '0');
    final sStr = sec.toString().padLeft(2, '0');
    return h > 0 ? '$h:$mStr:$sStr' : '$mStr:$sStr';
  }

  Widget _time(String text, Color color, TextAlign align) => ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 42),
        child: Text(
          text,
          textAlign: align,
          style: TextStyle(
            color: color,
            fontSize: 11.5,
            fontFamily: 'monospace',
            fontWeight: FontWeight.w700,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final frac = duration > 0 ? currentPosition / duration : 0.0;
    final volIcon = volume <= 0
        ? Icons.volume_off
        : (volume < 0.5 ? Icons.volume_down : Icons.volume_up);

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 22, 14, 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0, 0.55, 1],
          colors: [
            Colors.black.withOpacity(0.85),
            Colors.black.withOpacity(0.4),
            Colors.transparent,
          ],
        ),
      ),
      child: Row(
        children: [
          _time(_fmt(currentPosition), Colors.white, TextAlign.left),
          const SizedBox(width: 10),
          Expanded(
            child: PlayerSlider(
              value: frac,
              onChangeStart: onSeekStart,
              onChangeEnd: onSeekEnd,
              onChanged: (f) => onSeek(f * duration),
            ),
          ),
          const SizedBox(width: 10),
          _time(_fmt(duration), Colors.white.withOpacity(0.7), TextAlign.right),
          if (showVolume) ...[
            const SizedBox(width: 10),
            _BarIconButton(icon: volIcon, tooltip: 'Звук', onTap: onToggleMute),
            const SizedBox(width: 8),
            SizedBox(
              width: 90,
              child: PlayerSlider(value: volume, onChanged: onVolumeChanged),
            ),
          ],
          const SizedBox(width: 10),
          _BarIconButton(
            icon: isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
            tooltip: 'На весь екран',
            onTap: onToggleFullscreen,
          ),
        ],
      ),
    );
  }
}

/// .fsb в HTML
class _BarIconButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  const _BarIconButton({required this.icon, required this.tooltip, required this.onTap});

  @override
  State<_BarIconButton> createState() => _BarIconButtonState();
}

class _BarIconButtonState extends State<_BarIconButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(_hover ? 0.7 : 0.45),
            borderRadius: BorderRadius.circular(99),
            border: Border.all(color: Colors.white.withOpacity(0.15), width: 0.8),
          ),
          child: Icon(widget.icon, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}
