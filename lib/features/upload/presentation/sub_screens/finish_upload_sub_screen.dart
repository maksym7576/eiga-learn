import 'package:flutter/material.dart';

class FinishUploadSubScreen extends StatelessWidget {
  const FinishUploadSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      alignment: Alignment.center,
      child: const Text(
        'Step 4: Review and start processing / finish upload.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
