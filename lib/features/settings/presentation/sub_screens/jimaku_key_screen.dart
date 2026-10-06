import 'package:flutter/material.dart';
import 'api_key_screen_base.dart';

/// Екран ключа Jimaku.
class JimakuKeyScreen extends StatelessWidget {
  const JimakuKeyScreen({super.key});

  static Route<void> route() => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const JimakuKeyScreen(),
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
    return const ApiKeyScreenBase(tokenId: 'jimaku');
  }
}
