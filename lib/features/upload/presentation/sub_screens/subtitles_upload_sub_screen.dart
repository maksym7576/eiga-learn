import 'package:flutter/material.dart';
import 'package:eiga/shared/widgets/cards/glass_card.dart';

class SubtitlesUploadSubScreen extends StatelessWidget {
  const SubtitlesUploadSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGlassCard(
      padding: const EdgeInsets.all(40),
      child: const Center(
        child: Text(
          'Step 3: Subtitles processing and translation options go here.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
