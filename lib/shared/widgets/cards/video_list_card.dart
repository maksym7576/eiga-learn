import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../dialogs/confirm_dialog_shell.dart';
import 'mini_video_card.dart';

/// Scrollable list of MiniVideoCard with a fade at the bottom.
class VideoListCard extends StatefulWidget {
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
  State<VideoListCard> createState() => _VideoListCardState();
}

class _VideoListCardState extends State<VideoListCard> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videos.isEmpty) return const SizedBox.shrink();
    final fade = widget.videos.length > 2;
    Widget list = ConstrainedBox(
      constraints: BoxConstraints(maxHeight: widget.maxHeight),
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(Colors.white.withOpacity(0.3)),
          thickness: WidgetStateProperty.all(5.0),
          radius: const Radius.circular(8),
        ),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: ListView.separated(
            controller: _scrollController,
            padding: EdgeInsets.fromLTRB(0, 2, 12, fade ? 22 : 2),
            itemCount: widget.videos.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, i) => MiniVideoCard(
              video: widget.videos[i],
              accent: widget.accent.c1,
              index: i,
            ),
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
