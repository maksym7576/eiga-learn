import 'package:flutter/material.dart';
import '../../features/startup/welcome_config.dart';
import 'animation/button_entrance_transition.dart';
import 'primary_gradient_button.dart';

/// Кнопка Back з анімацією появи для welcome-екрана (виглядає як NextButton).
class WelcomeBackButton extends StatelessWidget {
  const WelcomeBackButton({
    super.key,
    required this.master,
    this.onPressed,
    this.text = 'Back',
  });

  final Animation<double> master;
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final animation = WelcomeConfig.seg(
      master,
      WelcomeConfig.buttonStartMs,
      WelcomeConfig.buttonDurMs,
    );

    return ButtonEntranceTransition(
      animation: animation,
      child: PrimaryGradientButton(
        text: text,
        onPressed: onPressed,
        icon: Icons.arrow_back_rounded,
        isIconLeading: true,
      ),
    );
  }
}
