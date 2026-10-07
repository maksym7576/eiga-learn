import 'package:flutter/material.dart';
import '../cards/video_confirm_info_card.dart';
import 'confirm_dialog_shell.dart';

class CreateSubtitlesConfirmDialog extends StatelessWidget {
  final String videoTitle;
  final String? coverUrl;
  final String subTag;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;

  const CreateSubtitlesConfirmDialog({
    super.key,
    required this.videoTitle,
    this.coverUrl,
    this.subTag = 'From audio',
    required this.onConfirm,
    required this.onCancel,
    this.title = 'Create subtitles?',
    this.message = 'Subtitles will be created from the audio of this video.',
    this.confirmLabel = 'Create',
    this.cancelLabel = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
    return ConfirmDialogShell(
      accent: ConfirmAccent.createSubtitlesAccent,
      icon: Icons.subtitles_outlined,
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
          tagColor: ConfirmAccent.createSubtitlesAccent.c1,
        ),
      ],
    );
  }
}
