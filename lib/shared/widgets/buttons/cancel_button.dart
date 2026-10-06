import 'package:flutter/material.dart';
import '../../../features/startup/welcome_config.dart';
import '../animation/button_entrance_transition.dart';
import '../primary_gradient_button.dart';

/// Кнопка Cancel з опціональною анімацією появи.
class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    this.master,
    this.onPressed,
    this.text = 'Cancel',
    this.icon,
  });

  final Animation<double>? master;
  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final button = PrimaryGradientButton(
      text: text,
      onPressed: onPressed,
      icon: icon ?? Icons.arrow_back_rounded,
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
