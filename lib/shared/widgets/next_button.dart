import 'package:flutter/material.dart';
import '../../features/startup/welcome_config.dart';
import 'primary_gradient_button.dart';
import 'button_entrance_transition.dart';

/// Кнопка Next з анімацією появи для welcome-екрана.
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
