import 'package:flutter/material.dart';
import '../../../features/startup/welcome_config.dart';
import '../animation/eiga_logo_animation.dart';
import 'tagline_text.dart';

/// Віджет, що об'єднує анімацію логотипу Eiga та TaglineText (як на стартовому екрані),
/// але без переходу в HelloText.
class EigaLogoTagline extends StatefulWidget {
  const EigaLogoTagline({
    super.key,
    this.taglineText = 'Learn languages by watching',
    this.autoPlay = true,
  });

  final String taglineText;
  final bool autoPlay;

  @override
  State<EigaLogoTagline> createState() => _EigaLogoTaglineState();
}

class _EigaLogoTaglineState extends State<EigaLogoTagline>
    with SingleTickerProviderStateMixin {
  late final AnimationController _master = AnimationController(
    vsync: this,
    // Тривалість до завершення появи tagline (без exit)
    duration: const Duration(
      milliseconds: WelcomeConfig.taglineInStartMs + WelcomeConfig.taglineInDurMs + 200,
    ),
  );

  @override
  void initState() {
    super.initState();
    if (widget.autoPlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _master.forward();
      });
    }
  }

  @override
  void dispose() {
    _master.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fs = WelcomeConfig.heroFontSize(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: fs * 1.5,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              EigaLogoAnimation(
                master: _master,
                fontSize: fs,
                enableExit: false,
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(0, fs * WelcomeConfig.taglineGap),
          child: TaglineText(
            master: _master,
            text: widget.taglineText,
            showOut: false,
          ),
        ),
      ],
    );
  }
}
