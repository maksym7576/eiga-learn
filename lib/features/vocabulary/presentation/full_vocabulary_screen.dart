import 'package:flutter/material.dart';

class FullVocabularyScreen extends StatelessWidget {
  const FullVocabularyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Full Vocabulary')),
      body: const Center(
        child: Text('Vocabulary List'),
      ),
    );
  }
}
