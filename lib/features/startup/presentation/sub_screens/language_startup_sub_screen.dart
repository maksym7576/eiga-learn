import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_gradients.dart';
import '../../../../database/dtos/language_dto.dart';
import '../../../../services/database/isar_service.dart';
import '../../../../shared/widgets/logo/mini_app_logo.dart';
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

            // Footer / Next Button (appears when language selected)
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: AnimatedOpacity(
                  opacity: _selectedLanguage != null ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedSlide(
                    offset: _selectedLanguage != null ? Offset.zero : const Offset(0, 0.4),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutExpo,
                    child: IgnorePointer(
                      ignoring: _selectedLanguage == null,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: AppGradients.button,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.25),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.indigo500.withOpacity(0.45),
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if (_selectedLanguage != null) {
                                widget.onNext(_selectedLanguage!);
                              }
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    t('next_button'),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 18,
                                    color: Colors.cyanAccent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
