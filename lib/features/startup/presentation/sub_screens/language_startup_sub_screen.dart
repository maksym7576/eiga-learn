import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../database/dtos/language_dto.dart';
import '../../../../services/database/isar_service.dart';
import '../../../../shared/widgets/logo/mini_app_logo.dart';
import '../../../../shared/widgets/primary_gradient_button.dart';
import '../../../../shared/widgets/search_view/language_localization_search_view.dart';

class LanguageStartupSubScreen extends ConsumerStatefulWidget {
  const LanguageStartupSubScreen({
    super.key,
    required this.onNext,
  });

  final ValueChanged<LanguageDto> onNext;

  @override
  ConsumerState<LanguageStartupSubScreen> createState() => _LanguageStartupSubScreenState();
}

class _LanguageStartupSubScreenState extends ConsumerState<LanguageStartupSubScreen> {
  LanguageDto? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final appConfig = ref.read(appConfigProvider);
      final langRepo = ref.read(languageRepositoryProvider);
      final currentLangCode = appConfig.getAppLanguage;
      final lang = langRepo.getLanguageByCode(currentLangCode) ?? langRepo.getLanguageByCode('en');
      if (lang != null && _selectedLanguage == null) {
        setState(() {
          _selectedLanguage = lang;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appConfig = ref.watch(appConfigProvider);
    final currentLang = appConfig.getAppLanguage;
    final langRepo = ref.watch(languageRepositoryProvider);

    String t(String key) => langRepo.translate(currentLang, key);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            // Header Logo
            const SizedBox(height: 24),
            const Center(
              child: MiniAppLogo(size: 44),
            ),
            const SizedBox(height: 32),

            // Main Content Container (max width 400)
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  children: [
                    // Title & Subtitle
                    Text(
                      t('app_language'),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.8,
                        height: 1.1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      t('choose_interface_language'),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.65),
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Search View with Languages
                    Expanded(
                      child: LanguageLocalizationSearchView(
                        onLanguageSelected: (lang) async {
                          setState(() {
                            _selectedLanguage = lang;
                          });
                          await appConfig.setAppLanguage(lang.code);
                          ref.invalidate(appConfigProvider);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer / Next Button
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: PrimaryGradientButton(
                  text: t('next_button'),
                  onPressed: _selectedLanguage != null
                      ? () => widget.onNext(_selectedLanguage!)
                      : null,
                  icon: Icons.arrow_forward_rounded,
                  isIconLeading: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
