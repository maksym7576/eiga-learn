import 'package:flutter/material.dart';
import '../cards/video_confirm_info_card.dart';
import 'confirm_dialog_shell.dart';

class TranslateAllConfirmDialog extends StatelessWidget {
  final String videoTitle;
  final String? coverUrl;
  final String sourceLang;
  final String targetLang;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String title;
  final String? message;
  final String confirmLabel;
  final String cancelLabel;

  const TranslateAllConfirmDialog({
    super.key,
    required this.videoTitle,
    this.coverUrl,
    required this.sourceLang,
    required this.targetLang,
    required this.onConfirm,
    required this.onCancel,
    this.title = 'Translate all?',
    this.message,
    this.confirmLabel = 'Translate',
    this.cancelLabel = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
    final s = sourceLang.toUpperCase();
    final t = targetLang.toUpperCase();
    final msg = message ?? 'All subtitles will be translated from $s to $t.';

    return ConfirmDialogShell(
      accent: ConfirmAccent.translateAccent,
      icon: Icons.translate_rounded,
      title: title,
      message: msg,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      onConfirm: onConfirm,
      onCancel: onCancel,
      content: [
        VideoConfirmInfoCard(
          title: videoTitle,
          coverUrl: coverUrl,
          tag: '$s → $t',
          tagColor: ConfirmAccent.translateAccent.c1,
        ),
      ],
    );
  }
}
