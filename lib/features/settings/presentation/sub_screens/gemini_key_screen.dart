import 'package:flutter/material.dart';
import 'api_key_screen_base.dart';

/// Екран ключа Gemini.
class GeminiKeyScreen extends StatelessWidget {
  const GeminiKeyScreen({super.key});

  static Route<void> route() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const GeminiKeyScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
      );

  @override
  Widget build(BuildContext context) {
    return const ApiKeyScreenBase(tokenId: 'gemini');
  }
}
