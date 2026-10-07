import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/shared/widgets/cards/video_item.dart';
import 'package:eiga/shared/providers/video_providers.dart';
import 'package:eiga/shared/widgets/dialogs/cache_video_confirm_dialog.dart';
import 'package:eiga/shared/widgets/dialogs/translate_all_confirm_dialog.dart';
import 'package:eiga/shared/widgets/dialogs/create_subtitles_confirm_dialog.dart';
import 'package:eiga/shared/widgets/dialogs/restore_subtitles_confirm_dialog.dart';
import 'package:eiga/shared/widgets/dialogs/delete_video_confirm_dialog.dart';

Future<void> handleVideoMenuAction(
  BuildContext context,
  WidgetRef ref,
  VideoItem video,
  VideoMenuAction action,
) async {
  final videoService = ref.read(videoServiceProvider);

  switch (action) {
    case VideoMenuAction.cache:
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => Dialog(
          backgroundColor: Colors.transparent,
          child: CacheVideoConfirmDialog(
            videoTitle: video.title,
            coverUrl: video.coverUrl,
            onConfirm: () => Navigator.pop(ctx, true),
            onCancel: () => Navigator.pop(ctx, false),
          ),
        ),
      );
      if (confirmed == true) {
        // Action confirmed
      }
      break;
    case VideoMenuAction.translateAll:
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => Dialog(
          backgroundColor: Colors.transparent,
          child: TranslateAllConfirmDialog(
            videoTitle: video.title,
            coverUrl: video.coverUrl,
            sourceLang: video.sourceLang,
            targetLang: video.targetLang,
            onConfirm: () => Navigator.pop(ctx, true),
            onCancel: () => Navigator.pop(ctx, false),
          ),
        ),
      );
      if (confirmed == true) {
        // Action confirmed
      }
      break;
    case VideoMenuAction.createSubtitles:
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => Dialog(
          backgroundColor: Colors.transparent,
          child: CreateSubtitlesConfirmDialog(
            videoTitle: video.title,
            coverUrl: video.coverUrl,
            onConfirm: () => Navigator.pop(ctx, true),
            onCancel: () => Navigator.pop(ctx, false),
          ),
        ),
      );
      if (confirmed == true) {
        // Action confirmed
      }
      break;
    case VideoMenuAction.restoreSubtitles:
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => Dialog(
          backgroundColor: Colors.transparent,
          child: RestoreSubtitlesConfirmDialog(
            videoTitle: video.title,
            coverUrl: video.coverUrl,
            onConfirm: () => Navigator.pop(ctx, true),
            onCancel: () => Navigator.pop(ctx, false),
          ),
        ),
      );
      if (confirmed == true) {
        // Action confirmed
      }
      break;
    case VideoMenuAction.delete:
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => Dialog(
          backgroundColor: Colors.transparent,
          child: DeleteVideoConfirmDialog(
            videoTitle: video.title,
            coverUrl: video.coverUrl,
            onConfirm: () => Navigator.pop(ctx, true),
            onCancel: () => Navigator.pop(ctx, false),
          ),
        ),
      );
      if (confirmed == true) {
        await videoService.delete(int.parse(video.id));
      }
      break;
    default:
      break;
  }
}
