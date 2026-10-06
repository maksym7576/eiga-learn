import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:eiga/services/database/isar_service.dart';
import 'package:eiga/shared/providers/profile_providers.dart';
import 'package:eiga/shared/widgets/logo/mini_app_logo.dart';
import 'package:eiga/shared/widgets/primary_gradient_button.dart';
import 'package:eiga/shared/widgets/buttons/back_button.dart' as app_widgets;
import 'package:eiga/shared/widgets/cards/gemini_card.dart';
import 'package:eiga/shared/widgets/cards/jimaku_card.dart';
import 'package:eiga/features/settings/presentation/sub_screens/gemini_key_screen.dart';
import 'package:eiga/features/settings/presentation/sub_screens/jimaku_key_screen.dart';

class ProcessingCardsSubScreen extends ConsumerStatefulWidget {
  const ProcessingCardsSubScreen({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  ConsumerState<ProcessingCardsSubScreen> createState() =>
      _ProcessingCardsSubScreenState();
}

class _ProcessingCardsSubScreenState
    extends ConsumerState<ProcessingCardsSubScreen> {
  String? _selectedCardId;

  @override
  Widget build(BuildContext context) {
    final appConfig = ref.watch(appConfigProvider);
    final currentLang = appConfig.getAppLanguage;
    final langRepo = ref.watch(languageRepositoryProvider);
    String t(String key) => langRepo.translate(currentLang, key);

    final draft = ref.watch(profileDraftProvider);
    final service = ref.watch(languageProcessingServiceProvider);
    final activeCards = service.getProcessingCardsForOriginalLanguage(draft.originalCode);

    if (_selectedCardId == null || !activeCards.any((c) => c.id == _selectedCardId)) {
      if (activeCards.isNotEmpty) {
        _selectedCardId = activeCards.first.id;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            ref.read(profileDraftProvider.notifier).selectEngine(_selectedCardId!);
          }
        });
      }
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
                      t('processing_models_title'),
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
                      t('processing_models_subtitle'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.65),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: ListView.separated(
                        itemCount: activeCards.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final card = activeCards[index];
                          final isSelected = _selectedCardId == card.id;

                          void handleTap() {
                            setState(() => _selectedCardId = card.id);
                            ref.read(profileDraftProvider.notifier).selectEngine(card.id);

                            if (card.designVariant == 'gemini') {
                              Navigator.push(context, GeminiKeyScreen.route());
                            } else {
                              Navigator.push(context, JimakuKeyScreen.route());
                            }
                          }

                          if (card.designVariant == 'gemini') {
                            return GeminiCard(
                              title: t(card.titleKey),
                              subtitle: t(card.descriptionKey),
                              tag: t(card.tagKey),
                              isSelected: isSelected,
                              onTap: handleTap,
                            );
                          } else {
                            return JimakuCard(
                              title: t(card.titleKey),
                              subtitle: t(card.descriptionKey),
                              tag: t(card.tagKey),
                              isSelected: isSelected,
                              onTap: handleTap,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Row(
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
                      text: t('finish_button'),
                      onPressed: draft.processingEngineId.isNotEmpty ? widget.onNext : null,
                      icon: Icons.check_rounded,
                      isIconLeading: false,
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
