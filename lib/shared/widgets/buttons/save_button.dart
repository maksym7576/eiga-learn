import 'package:flutter/material.dart';
import '../../../features/startup/welcome_config.dart';
import '../animation/button_entrance_transition.dart';
import '../primary_gradient_button.dart';

/// Кнопка Save з опціональною анімацією появи.
class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    this.master,
    this.onPressed,
    this.text = 'Save',
    this.icon,
    this.isIconLeading = false,
  });

  final Animation<double>? master;
  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;
  final bool isIconLeading;

  @override
  Widget build(BuildContext context) {
    final button = PrimaryGradientButton(
      text: text,
      onPressed: onPressed,
      icon: icon,
      isIconLeading: isIconLeading,
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
