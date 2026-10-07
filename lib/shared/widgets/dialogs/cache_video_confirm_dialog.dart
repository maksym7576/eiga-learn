import 'package:flutter/material.dart';
import '../cards/video_confirm_info_card.dart';
import 'confirm_dialog_shell.dart';

class CacheVideoConfirmDialog extends StatelessWidget {
  final String videoTitle;
  final String? coverUrl;
  final String sizeTag;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;

  const CacheVideoConfirmDialog({
    super.key,
    required this.videoTitle,
    this.coverUrl,
    this.sizeTag = '≈ 1.4 GB',
    required this.onConfirm,
    required this.onCancel,
    this.title = 'Cache video?',
    this.message = 'The video will be saved on this device.',
    this.confirmLabel = 'Cache',
    this.cancelLabel = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
    return ConfirmDialogShell(
      accent: ConfirmAccent.cacheAccent,
      icon: Icons.download_rounded,
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
          tag: sizeTag,
          tagColor: ConfirmAccent.cacheAccent.c1,
        ),
      ],
    );
  }
}
