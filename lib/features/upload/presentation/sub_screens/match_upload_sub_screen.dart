import 'package:flutter/material.dart';

class MatchUploadSubScreen extends StatelessWidget {
  const MatchUploadSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      alignment: Alignment.center,
      child: const Text(
        'Step 2: Match content & episodes alignment configuration goes here.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
