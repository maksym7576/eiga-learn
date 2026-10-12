import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_gradients.dart';
import '../../../core/theme/app_typography.dart';
import '../buttons/confirm_button.dart';

export '../../../core/theme/app_gradients.dart' show ConfirmAccent;

/// Dialog shell: banner, icon, title, message, [content], buttons.
class ConfirmDialogShell extends StatelessWidget {
  final ConfirmAccent accent;
  final IconData icon;
  final String title, message, confirmLabel, cancelLabel;
  final List<Widget> content; // cards go here
  final VoidCallback onConfirm, onCancel;

  const ConfirmDialogShell({
    super.key,
    required this.accent,
    required this.icon,
    required this.title,
    required this.message,
    required this.confirmLabel,
    required this.onConfirm,
    required this.onCancel,
    this.cancelLabel = 'Cancel',
    this.content = const [],
  });

  @override
  Widget build(BuildContext context) {
    final panelColor = AppColors.surfaceDialog;
    final ringDark = AppColors.ink;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: panelColor,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: Colors.white.withOpacity(0.26), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.9),
              blurRadius: 80,
              spreadRadius: -12,
              offset: const Offset(0, 30),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 118,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 92,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: const Alignment(-0.5, -1),
                                end: const Alignment(0.5, 1),
                                colors: accent.banner,
                                stops: const [0, 0.6, 1],
                              ),
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  panelColor.withOpacity(0.1),
                                  panelColor.withOpacity(0.97),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 58,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: accent.gradient,
                          border: Border.all(color: ringDark, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: accent.c2.withOpacity(0.6),
                              blurRadius: 26,
                              spreadRadius: -8,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Icon(icon, size: 30, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTypography.title.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTypography.title.copyWith(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.7),
                        height: 1.5,
                      ),
                    ),
                    ...content,
                    const SizedBox(height: 18),
                    if (cancelLabel.isNotEmpty) ...[
                      Row(
                        children: [
                          Expanded(
                            child: ConfirmButton(
                              label: cancelLabel,
                              onTap: onCancel,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ConfirmButton(
                              label: confirmLabel,
                              onTap: onConfirm,
                              accentColor: accent.c1,
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      SizedBox(
                        width: double.infinity,
                        child: ConfirmButton(
                          label: confirmLabel,
                          onTap: onConfirm,
                          accentColor: accent.c1,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
