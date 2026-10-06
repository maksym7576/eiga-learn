import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/animation/eiga_logo_animation.dart';
import '../../../shared/widgets/aurora_background.dart';
import '../../../shared/widgets/hello_text.dart';
import '../../../shared/widgets/next_button.dart';
import '../../../shared/widgets/tagline_text.dart';
import '../welcome_config.dart';

/// Збирає все докупи. Один головний контролер, а кожен віджет бере свій відрізок.
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, this.onNext});

  final VoidCallback? onNext;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _master = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: WelcomeConfig.totalMs),
  );

  @override
  void initState() {
    super.initState();
    _master.forward();
  }

  @override
  void dispose() {
    _master.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AuroraBackground(),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            EigaLogoAnimation(master: _master),
                            HelloText(master: _master, text: 'Hello'),
                          ],
                        ),
                        const SizedBox(height: 4),
                        TaglineText(master: _master),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 56),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 320),
                    child: NextButton(master: _master, onPressed: widget.onNext, text: 'Next'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
