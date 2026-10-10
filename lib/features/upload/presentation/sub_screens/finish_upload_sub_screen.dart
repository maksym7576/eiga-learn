import 'package:flutter/material.dart';
import 'package:eiga/shared/widgets/cards/glass_card.dart';

class FinishUploadSubScreen extends StatelessWidget {
  const FinishUploadSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGlassCard(
      padding: const EdgeInsets.all(40),
      child: const Center(
        child: Text(
          'Step 4: Review and start processing / finish upload.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
