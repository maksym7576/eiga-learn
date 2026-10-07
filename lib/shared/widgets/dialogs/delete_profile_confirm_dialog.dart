import 'package:flutter/material.dart';
import '../cards/language_pair_card.dart';
import '../cards/video_list_card.dart';
import '../cards/mini_video_card.dart';
import '../detected_videos_card.dart';
import 'confirm_dialog_shell.dart';

class DeleteProfileConfirmDialog extends StatelessWidget {
  final String sourceLang;
  final String targetLang;
  final List<MiniVideoData> videos;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;

  const DeleteProfileConfirmDialog({
    super.key,
    required this.sourceLang,
    required this.targetLang,
    required this.videos,
    required this.onConfirm,
    required this.onCancel,
    this.title = 'Delete profile?',
    this.message = 'This profile and everything inside it will be removed. This can’t be undone.',
    this.confirmLabel = 'Delete profile',
    this.cancelLabel = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
    final count = videos.length;

    return ConfirmDialogShell(
      accent: ConfirmAccent.danger,
      icon: Icons.delete_outline_rounded,
      title: title,
      message: message,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      onConfirm: onConfirm,
      onCancel: onCancel,
      content: [
        const SizedBox(height: 14),
        LanguagePairCard(
          sourceLang: sourceLang,
          targetLang: targetLang,
        ),
        const SizedBox(height: 10),
        DetectedVideosCard(
          count: count,
          accent: ConfirmAccent.danger.c1,
        ),
        if (count > 0) ...[
          const SizedBox(height: 8),
          VideoListCard(
            videos: videos,
            accent: ConfirmAccent.danger,
          ),
        ],
      ],
    );
  }
}
