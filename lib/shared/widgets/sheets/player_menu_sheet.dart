import 'package:flutter/material.dart';
import 'app_bottom_sheet_mobile.dart';
import 'windowed_subtitle_settings_sheet.dart';
import '../../player/subtitle_settings_panel.dart';

class PlayerMenuSheet extends StatelessWidget {
  final bool isFullScreen;

  const PlayerMenuSheet({super.key, this.isFullScreen = false});

  static Future<void> show(BuildContext context, {bool isFullScreen = false}) {
    return AppBottomSheetMobile.show(
      context: context,
      heightFactor: 0.5,
      child: PlayerMenuSheet(isFullScreen: isFullScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0A22),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Player Settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          // Button 1: Reading settings
          _MenuButton(
            icon: Icons.menu_book_rounded,
            title: 'Reading Settings',
            subtitle: 'Configure reading preferences & tracking',
            onTap: () {
              Navigator.pop(context);
              // TODO: reading settings sheet
            },
          ),
          const SizedBox(height: 12),

          // Button 2: Subtitle settings
          _MenuButton(
            icon: Icons.subtitles_rounded,
            title: 'Subtitle Settings',
            subtitle: isFullScreen ? 'Fullscreen subtitle customization' : 'Windowed subtitle customization',
            onTap: () {
              Navigator.pop(context);
              if (isFullScreen) {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (ctx) => Container(
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0E0A22),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                    ),
                    child: SubtitleSettingsPanel(
                      isOpen: true,
                      isFullScreen: true,
                      onClose: () => Navigator.pop(ctx),
                    ),
                  ),
                );
              } else {
                WindowedSubtitleSettingsSheet.show(context);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.05),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF67E8F9).withOpacity(0.12),
              ),
              child: Icon(icon, color: const Color(0xFF67E8F9), size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.white38),
          ],
        ),
      ),
    );
  }
}
