import 'package:flutter/material.dart';
import '../cards/video_confirm_info_card.dart';
import 'confirm_dialog_shell.dart';

class DeleteVideoConfirmDialog extends StatelessWidget {
  final String videoTitle;
  final String? coverUrl;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;

  const DeleteVideoConfirmDialog({
    super.key,
    required this.videoTitle,
    this.coverUrl,
    required this.onConfirm,
    required this.onCancel,
    this.title = 'Delete video?',
    this.message = 'This video and everything inside it will be removed. This can’t be undone.',
    this.confirmLabel = 'Delete video',
    this.cancelLabel = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
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
        VideoConfirmInfoCard(
          title: videoTitle,
          coverUrl: coverUrl,
          tag: 'Delete',
          tagColor: ConfirmAccent.danger.c1,
        ),
      ],
    );
  }
}
