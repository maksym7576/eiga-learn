import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'sub_screens/language_startup_sub_screen.dart';
import 'sub_screens/welcome_startup_sub_screen.dart';
import '../../../shared/widgets/aurora_background.dart';

class StartupScreen extends ConsumerStatefulWidget {
  const StartupScreen({super.key});

  @override
  ConsumerState<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends ConsumerState<StartupScreen> {
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    // Закоментовано перевірку, щоб стартовий екран завжди запускався при старті:
    /*
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appConfig = ref.read(appConfigProvider);
      if (appConfig.getHasCompletedStartup) {
        if (!mounted) return;
        context.go('/main');
      }
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AuroraBackground(),
          _currentStep == 0
              ? LanguageStartupSubScreen(
                  key: const ValueKey(0),
                  onNext: (selectedLang) {
                    setState(() {
                      _currentStep = 1;
                    });
                  },
                )
              : WelcomeStartupSubScreen(
                  key: const ValueKey(1),
                  onBack: () {
                    setState(() {
                      _currentStep = 0;
                    });
                  },
                  onNext: () async {
                    if (!mounted) return;
                    context.go('/main');
                  },
                ),
        ],
      ),
    );
  }
}
