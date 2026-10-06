import 'package:flutter/material.dart';
import '../../../features/startup/welcome_config.dart';
import '../animation/button_entrance_transition.dart';
import '../primary_gradient_button.dart';

/// Кнопка Next з анімацією появи.
class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.master,
    this.onPressed,
    this.text = 'Next',
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
      ),
    );
  }
}
