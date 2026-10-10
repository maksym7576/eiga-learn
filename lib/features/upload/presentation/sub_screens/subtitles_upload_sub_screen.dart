import 'package:flutter/material.dart';

class SubtitlesUploadSubScreen extends StatelessWidget {
  const SubtitlesUploadSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      alignment: Alignment.center,
      child: const Text(
        'Step 3: Subtitles processing and translation options go here.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
