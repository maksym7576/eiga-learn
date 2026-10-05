import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'welcome_screen.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeScreen(
      onNext: () => context.go('/main'),
    );
  }
}
