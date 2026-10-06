import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../services/database/isar_service.dart';
import '../../../../shared/widgets/animation/eiga_logo_animation.dart';
import '../../../../shared/widgets/hello_text.dart';
import '../../../../shared/widgets/tagline_text.dart';
import '../../../../shared/widgets/next_button.dart';
import '../../../../shared/widgets/back_button.dart';
import '../../welcome_config.dart';

class WelcomeStartupSubScreen extends ConsumerStatefulWidget {
  const WelcomeStartupSubScreen({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  ConsumerState<WelcomeStartupSubScreen> createState() =>
      _WelcomeStartupSubScreenState();
}

class _WelcomeStartupSubScreenState
    extends ConsumerState<WelcomeStartupSubScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _master = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: WelcomeConfig.totalMs),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _master.forward();
    });
  }

  @override
  void dispose() {
    _master.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appConfig = ref.watch(appConfigProvider);
    final currentLang = appConfig.getAppLanguage;
    final langRepo = ref.watch(languageRepositoryProvider);

    String t(String key) => langRepo.translate(currentLang, key);
    final fs = WelcomeConfig.heroFontSize(context);

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Та сама висота, що й у логотипа (fs * 1.5) — без обрізання.
                  SizedBox(
                    height: fs * 1.5,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        EigaLogoAnimation(master: _master, fontSize: fs),
                        HelloText(
                          master: _master,
                          text: t('hello'),
                          fontSize: fs,
                        ),
                      ],
                    ),
                  ),
                  // Відступ задається в WelcomeConfig.taglineGap
                  // Transform (а не SizedBox), щоб відступ міг бути від'ємним.
                  Transform.translate(
                    offset: Offset(0, fs * WelcomeConfig.taglineGap),
                    child: TaglineText(master: _master, text: t('tagline')),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 56),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeBackButton(
                      master: _master,
                      onPressed: widget.onBack,
                      text: t('back_button'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: NextButton(
                      master: _master,
                      onPressed: widget.onNext,
                      text: t('next_button'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}