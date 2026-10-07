import 'package:flutter/material.dart';
import '../dialogs/confirm_dialog_shell.dart';
import 'mini_video_card.dart';

/// Scrollable list of MiniVideoCard with a fade at the bottom.
class VideoListCard extends StatelessWidget {
  final List<MiniVideoData> videos;
  final ConfirmAccent accent;
  final double maxHeight;

  const VideoListCard({
    super.key,
    required this.videos,
    required this.accent,
    this.maxHeight = 196,
  });

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) return const SizedBox.shrink();
    final fade = videos.length > 2;
    Widget list = ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Scrollbar(
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.fromLTRB(0, 2, 4, fade ? 22 : 2),
          itemCount: videos.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, i) => MiniVideoCard(
            video: videos[i],
            accent: accent.c1,
            index: i,
          ),
        ),
      ),
    );
    if (fade) {
      list = ShaderMask(
        blendMode: BlendMode.dstIn,
        shaderCallback: (r) => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.black, Colors.transparent],
          stops: [0, 0.88, 1],
        ).createShader(r),
        child: list,
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: list,
    );
  }
}
