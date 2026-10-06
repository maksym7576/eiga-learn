import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../database/dtos/language_dto.dart';
import '../../../../services/database/isar_service.dart';
import '../../../../shared/providers/profile_providers.dart';
import '../../../../shared/widgets/logo/mini_app_logo.dart';
import '../../../../shared/widgets/cards/language_localization_card.dart';
import '../../../../shared/widgets/primary_gradient_button.dart';
import '../../../../shared/widgets/buttons/back_button.dart' as app_widgets;

class CreateProfileSubScreen extends ConsumerStatefulWidget {
  const CreateProfileSubScreen({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  ConsumerState<CreateProfileSubScreen> createState() =>
      _CreateProfileSubScreenState();
}

class _CreateProfileSubScreenState
    extends ConsumerState<CreateProfileSubScreen> {
  LangSlot _slot = LangSlot.original;

  @override
  Widget build(BuildContext context) {
    final appConfig = ref.watch(appConfigProvider);
    final currentLang = appConfig.getAppLanguage;
    final langRepo = ref.watch(languageRepositoryProvider);
    String t(String key) => langRepo.translate(currentLang, key);

    final service = ref.watch(languageProcessingServiceProvider);
    final draft = ref.watch(profileDraftProvider);

    // Original = мови з інструкціями обробки, Translation = локалізовані.
    final originalList = [...service.getLanguagesForSubtitleProcessing()]
      ..sort((a, b) => a.name.compareTo(b.name));
    final translationList = [...service.getLocalizedLanguages()]
      ..sort((a, b) => a.name.compareTo(b.name));

    final items = _slot == LangSlot.original ? originalList : translationList;
    final otherSlot = _slot == LangSlot.original ? LangSlot.translation : LangSlot.original;
    final activeCode = _slot == LangSlot.original ? draft.originalCode : draft.translationCode;
    final otherCode = _slot == LangSlot.original ? draft.translationCode : draft.originalCode;

    String titleOf(String code, List<LanguageDto> list) {
      if (code.isEmpty) return t('select');
      for (final l in list) {
        if (l.code.toLowerCase() == code.toLowerCase()) return l.name;
      }
      return code.toUpperCase();
    }

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 24),
          const Center(
            child: MiniAppLogo(size: 44),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Text(
                      t('create_profile'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.8,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _slot == LangSlot.original
                          ? t('choose_original_hint')
                          : t('choose_translation_hint'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.65),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Animated Square/Rounded Segment Switch matching дизайн другого екрану.html
                    Container(
                      height: 56,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0C081E).withOpacity(0.78),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.22),
                          width: 1.5,
                        ),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final tabWidth = (constraints.maxWidth - 8) / 2;
                          return Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 350),
                                curve: Curves.easeInOutCubic,
                                left: _slot == LangSlot.original ? 0 : tabWidth,
                                top: 0,
                                bottom: 0,
                                width: tabWidth,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromRGBO(91, 33, 182, 0.95),
                                        Color.fromRGBO(37, 99, 235, 0.9),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color.fromRGBO(196, 181, 253, 0.6),
                                      width: 1,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(99, 102, 241, 0.8),
                                        blurRadius: 20,
                                        offset: Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () => setState(() => _slot = LangSlot.original),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              t('original'),
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white.withOpacity(0.7),
                                                height: 1.1,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              titleOf(draft.originalCode, originalList),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                height: 1.1,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () => setState(() => _slot = LangSlot.translation),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              t('translation'),
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white.withOpacity(0.7),
                                                height: 1.1,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              titleOf(draft.translationCode, translationList),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                height: 1.1,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Swap button in the center between Original and Translation
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () => ref.read(profileDraftProvider.notifier).swap(),
                                  child: Container(
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1E1440),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.3),
                                        width: 1.5,
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.3),
                                          blurRadius: 8,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.swap_horiz_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Language list
                    Expanded(
                      child: ShaderMask(
                        blendMode: BlendMode.dstIn,
                        shaderCallback: (r) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.03, 0.93, 1.0],
                        ).createShader(r),
                        child: ListView.separated(
                          key: ValueKey(_slot),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: items.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 10),
                          itemBuilder: (context, i) {
                            final item = items[i];
                            final isActive = activeCode.toLowerCase() == item.code.toLowerCase();
                            final occupied = otherCode.toLowerCase() == item.code.toLowerCase();

                            return LanguageLocalizationCard(
                              item: item,
                              isActive: isActive,
                              enabled: !occupied,
                              caption: occupied
                                  ? (otherSlot == LangSlot.original
                                      ? t('used_as_original')
                                      : t('used_as_translation'))
                                  : null,
                              onTap: () => ref
                                  .read(profileDraftProvider.notifier)
                                  .select(_slot, item.code),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Footer with Back and Next buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: draft.isValid
                  ? Row(
                      children: [
                        Expanded(
                          child: app_widgets.BackButton(
                            onPressed: widget.onBack,
                            text: t('back_button'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: PrimaryGradientButton(
                            text: t('next_button'),
                            onPressed: widget.onNext,
                            icon: Icons.arrow_forward_rounded,
                            isIconLeading: false,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: app_widgets.BackButton(
                        onPressed: widget.onBack,
                        text: t('back_button'),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
