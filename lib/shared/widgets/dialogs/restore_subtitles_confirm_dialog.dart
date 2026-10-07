import 'package:flutter/material.dart';
import '../cards/video_confirm_info_card.dart';
import 'confirm_dialog_shell.dart';

class RestoreSubtitlesConfirmDialog extends StatelessWidget {
  final String videoTitle;
  final String? coverUrl;
  final String subTag;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;

  const RestoreSubtitlesConfirmDialog({
    super.key,
    required this.videoTitle,
    this.coverUrl,
    this.subTag = 'Fix gaps',
    required this.onConfirm,
    required this.onCancel,
    this.title = 'Restore subtitles?',
    this.message = 'Missing or broken subtitles will be restored.',
    this.confirmLabel = 'Restore',
    this.cancelLabel = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
    return ConfirmDialogShell(
      accent: ConfirmAccent.restoreSubtitlesAccent,
      icon: Icons.restore_rounded,
      title: title,
      message: message,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      onConfirm: onConfirm,
      onCancel: onCancel,
      content: [
        VideoConfirmInfoCard(
          title: videoTitle,
          coverUrl: coverUrl,
          tag: subTag,
          tagColor: ConfirmAccent.restoreSubtitlesAccent.c1,
        ),
      ],
    );
  }
}
