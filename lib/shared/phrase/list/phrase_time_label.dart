import 'package:flutter/material.dart';

class PhraseTimeLabel extends StatelessWidget {
  final int startMs;
  final bool isActive;

  const PhraseTimeLabel({
    super.key,
    required this.startMs,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final duration = Duration(milliseconds: startMs);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    final timeColor = isActive ? const Color(0xFF818CF8) : const Color(0xFF6366F1);
    final subColor = isActive ? const Color(0xFFA5B4FC) : const Color(0xFF818CF8).withValues(alpha: 0.65);

    return SizedBox(
      width: 32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hours > 0)
            Text(
              '${hours.toString().padLeft(2, '0')}h',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: timeColor,
                height: 1.0,
              ),
            ),
          Text(
            '${minutes}m',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 11.5,
              fontWeight: FontWeight.bold,
              color: timeColor,
              height: 1.1,
            ),
          ),
          Text(
            '${seconds}s',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 10.5,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              color: subColor,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
