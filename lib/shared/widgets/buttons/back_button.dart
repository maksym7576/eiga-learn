import 'package:flutter/material.dart';
import '../../../features/startup/welcome_config.dart';
import '../animation/button_entrance_transition.dart';
import '../primary_gradient_button.dart';

/// Кнопка Back з опціональною анімацією появи тасинхронізацією з NextButton.
class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
    this.master,
    this.onPressed,
    this.text = 'Back',
  });

  final Animation<double>? master;
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final button = PrimaryGradientButton(
      text: text,
      onPressed: onPressed,
      icon: Icons.arrow_back_rounded,
      isIconLeading: true,
    );

    if (master == null) {
      return button;
    }

    final animation = WelcomeConfig.seg(
      master!,
      WelcomeConfig.buttonStartMs,
      WelcomeConfig.buttonDurMs,
    );

    return ButtonEntranceTransition(
      animation: animation,
      child: button,
    );
  }
}
