import 'package:flutter/material.dart';
import 'package:eiga/shared/player/video_player_container.dart';
import 'empty_player.dart';
import 'video_info_row.dart';
import 'tracks_panel.dart';

class SourceUploadSubScreen extends StatelessWidget {
  final String? videoPath;
  final VoidCallback onPickVideo;
  final String? details;
  final List<Map<String, String>> audioTracks;
  final List<Map<String, String>> subtitleTracks;
  final int? selectedAudio;
  final int? selectedSubtitle;
  final ValueChanged<int> onAudioSelected;
  final ValueChanged<int> onSubtitleSelected;
  final Function(List<Map<String, String>>, List<Map<String, String>>) onTracksLoaded;
  final Function(Duration, int?, int?) onMetaLoaded;

  const SourceUploadSubScreen({
    super.key,
    required this.videoPath,
    required this.onPickVideo,
    required this.details,
    required this.audioTracks,
    required this.subtitleTracks,
    required this.selectedAudio,
    required this.selectedSubtitle,
    required this.onAudioSelected,
    required this.onSubtitleSelected,
    required this.onTracksLoaded,
    required this.onMetaLoaded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (videoPath == null)
          EmptyPlayer(onAddVideo: onPickVideo)
        else
          VideoPlayerContainer(
            videoPath: videoPath,
            onTracksLoaded: onTracksLoaded,
            onMetaLoaded: onMetaLoaded,
          ),
        const SizedBox(height: 16),
        VideoInfoRow(
          title: videoPath?.split(RegExp(r'[\\/]')).last,
          details: details,
          onReplace: onPickVideo,
        ),
        const SizedBox(height: 16),
        TracksPanel(
          audioTracks: audioTracks,
          subtitleTracks: subtitleTracks,
          selectedAudio: selectedAudio,
          selectedSubtitle: selectedSubtitle,
          onAudioSelected: onAudioSelected,
          onSubtitleSelected: onSubtitleSelected,
        ),
      ],
    );
  }
}
