import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'video_item.dart';

/// Кнопка "три крапки" + випадаюче меню. Логіка пунктів як у HTML-макеті.
class VideoKebabMenu extends StatelessWidget {
  const VideoKebabMenu({super.key, required this.video, required this.onSelected});

  final VideoItem video;
  final ValueChanged<VideoMenuAction> onSelected;

  static const _emerald = Color(0xFF6EE7B7);
  static const _amber = Color(0xFFFCD34D);
  static const _red = Color(0xFFFCA5A5);

  @override
  Widget build(BuildContext context) {
    final busy = video.isBusy;

    return PopupMenuButton<VideoMenuAction>(
      tooltip: 'More',
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      offset: const Offset(0, 6),
      color: AppColors.menuBg,
      elevation: 12,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black,
      constraints: const BoxConstraints.tightFor(width: 236),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.white26, width: 1.5),
      ),
      onSelected: onSelected,
      itemBuilder: (_) => [
        if (video.cached)
          _item(VideoMenuAction.cache, 'Cached', Icons.check_rounded,
              enabled: false, color: _emerald, dim: false)
        else
          _item(VideoMenuAction.cache, 'Cache video', Icons.download_rounded, enabled: !busy),
        _item(VideoMenuAction.translateAll, 'Translate all', Icons.translate_rounded, enabled: !busy),
        if (video.hasSubtitles)
          _item(VideoMenuAction.restoreSubtitles, 'Restore subtitles', Icons.restore_rounded, enabled: !busy)
        else
          _item(VideoMenuAction.createSubtitles, 'Create subtitles', Icons.subtitles_outlined, enabled: !busy),
        const PopupMenuDivider(height: 9),
        _item(VideoMenuAction.details, 'Details & statistics', Icons.bar_chart_rounded),
        _item(VideoMenuAction.rerender, 'Re-render subtitles', Icons.autorenew_rounded,
            enabled: !busy && video.hasSubtitles, iconColor: _amber),
        _item(VideoMenuAction.delete, 'Delete video', Icons.delete_outline_rounded,
            color: _red, iconColor: _red),
      ],
      child: const SizedBox(
        width: 30,
        height: 30,
        child: Icon(Icons.more_vert_rounded, size: 20, color: Color.fromRGBO(255, 255, 255, .75)),
      ),
    );
  }

  PopupMenuEntry<VideoMenuAction> _item(
    VideoMenuAction value,
    String label,
    IconData icon, {
    bool enabled = true,
    Color color = Colors.white,
    Color? iconColor,
    bool dim = true,
  }) {
    final opacity = (!enabled && dim) ? .42 : 1.0;
    return PopupMenuItem<VideoMenuAction>(
      value: value,
      enabled: enabled,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Opacity(
        opacity: opacity,
        child: Row(
          children: [
            Icon(icon, size: 18, color: iconColor ?? color),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
