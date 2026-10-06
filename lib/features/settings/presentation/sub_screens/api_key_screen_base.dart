import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../database/embedded/guide_step.dart';
import '../../../../database/dtos/api_token_dto.dart';
import '../../../../database/seeds/api_token_seed.dart';
import '../../../../services/database/isar_service.dart';
import '../../../../shared/providers/services_providers.dart';
import '../../../../shared/widgets/aurora_background.dart';
import '../../../../shared/widgets/app_top_bar.dart';
import '../../../../shared/widgets/buttons/cancel_button.dart';
import '../../../../shared/widgets/buttons/save_button.dart';
import '../../../../shared/widgets/dialogs/confirm_dialog.dart';
import '../../../../shared/widgets/inputs/api_key_input_card.dart';
import '../../../../shared/widgets/guide_panel.dart';
import '../../../../shared/widgets/icons/gemini_icon.dart';
import '../../../../shared/widgets/icons/jimaku_icon.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Універсальна базова основа екрана налаштування API-ключа за ID токена (tokenId).
class ApiKeyScreenBase extends ConsumerStatefulWidget {
  const ApiKeyScreenBase({
    super.key,
    required this.tokenId,
  });

  final String tokenId;

  @override
  ConsumerState<ApiKeyScreenBase> createState() => _ApiKeyScreenBaseState();
}

class _ApiKeyScreenBaseState extends ConsumerState<ApiKeyScreenBase> {
  final _controller = TextEditingController();
  bool _obscure = true;
  bool _initialized = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _paste() async {
    final data = await Clipboard.getData('text/plain');
    if (data?.text != null) {
      setState(() => _controller.text = data!.text!.trim());
    }
  }

  Future<void> _save(ApiTokenDto tokenDto) async {
    final key = _controller.text.trim();
    if (key.isEmpty) return;
    await ref.read(apiTokenServiceProvider).setToken(tokenDto, key);
    ref.invalidate(hasTokenProvider(tokenDto.id));
    if (mounted) Navigator.pop(context);
  }

  Future<void> _delete(ApiTokenDto tokenDto) async {
    final confirmed = await ConfirmDialog.show(
      context: context,
      title: 'Remove API Key?',
      message: 'This will disable AI translation features until a new key is added.',
      confirmLabel: 'Remove',
      isDanger: true,
    );

    if (confirmed == true) {
      await ref.read(apiTokenServiceProvider).deleteToken(tokenDto);
      ref.invalidate(hasTokenProvider(tokenDto.id));
      if (mounted) setState(() => _controller.clear());
    }
  }

  @override
  Widget build(BuildContext context) {
    final appConfig = ref.watch(appConfigProvider);
    final currentLang = appConfig.getAppLanguage;
    final langRepo = ref.watch(languageRepositoryProvider);
    String t(String key) => langRepo.translate(currentLang, key);

    final tokenDto = ApiTokenSeed.tokens.firstWhere(
      (t) => t.id.toLowerCase() == widget.tokenId.toLowerCase(),
      orElse: () => ApiTokenSeed.tokens.first,
    );

    final isGemini = tokenDto.id == 'gemini';
    final title = t(isGemini ? 'gemini_api_key_title' : 'jimaku_key_title');
    final description = t(isGemini ? 'gemini_api_key_desc' : 'jimaku_key_desc');
    final badge = t(isGemini ? 'required_tag' : 'recommended_tag');
    final hint = isGemini ? 'AIzaSy...' : 'jmk_live_...';
    final freeNote = t(isGemini ? 'gemini_free_note' : 'jimaku_free_note');
    final accent = isGemini ? AppColors.indigo400 : AppColors.cyan300;
    final icon = isGemini
        ? const GeminiIcon(size: 30, color: Colors.white)
        : const JimakuIcon(size: 30, color: AppColors.cyan300);

    final steps = isGemini
        ? [
            GuideStep(
              title: t('gemini_step_1_title'),
              link: 'https://ai.google.dev/aistudio',
              linkLabel: t('gemini_step_1_link'),
            ),
            GuideStep(
              title: t('gemini_step_2_title'),
              subtitle: t('gemini_step_2_sub'),
            ),
            GuideStep(
              title: t('gemini_step_3_title'),
            ),
            GuideStep(
              title: t('gemini_step_4_title'),
              subtitle: t('gemini_step_4_sub'),
            ),
          ]
        : [
            GuideStep(
              title: t('jimaku_step_1_title'),
              link: 'https://jimaku.cc/login',
              linkLabel: t('jimaku_step_1_link'),
            ),
            GuideStep(
              title: t('jimaku_step_2_title'),
              subtitle: t('jimaku_step_2_sub'),
            ),
            GuideStep(
              title: t('jimaku_step_3_title'),
              subtitle: t('jimaku_step_3_sub'),
            ),
            GuideStep(
              title: t('jimaku_step_4_title'),
              subtitle: t('jimaku_step_4_sub'),
            ),
          ];

    final tokenService = ref.watch(apiTokenServiceProvider);

    return Scaffold(
      backgroundColor: AppColors.bgApp,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AuroraBackground(),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 440),
                child: FutureBuilder<String>(
                  future: tokenService.getToken(tokenDto),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: AppColors.cyan300),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}', style: AppTypography.body),
                      );
                    }
                    final token = snapshot.data ?? '';
                    if (!_initialized) {
                      _initialized = true;
                      _controller.text = token;
                    }
                    return _buildContent(
                      tokenDto: tokenDto,
                      title: title,
                      description: description,
                      badge: badge,
                      hint: hint,
                      freeNote: freeNote,
                      accent: accent,
                      icon: icon,
                      steps: steps,
                      hasSavedToken: token.isNotEmpty,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent({
    required ApiTokenDto tokenDto,
    required String title,
    required String description,
    required String badge,
    required String hint,
    required String freeNote,
    required Color accent,
    required Widget icon,
    required List<GuideStep> steps,
    required bool hasSavedToken,
  }) {
    return Column(
      children: [
        const AppTopBar(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: Column(
              children: [
                _buildHeader(title: title, description: description, badge: badge, icon: icon, isMain: tokenDto.id == 'gemini'),
                const SizedBox(height: 28),
                ApiKeyInputCard(
                  controller: _controller,
                  hint: hint,
                  accent: accent,
                  obscureText: _obscure,
                  onToggleObscure: () => setState(() => _obscure = !_obscure),
                  onPaste: _paste,
                  onRemove: hasSavedToken ? () => _delete(tokenDto) : null,
                  hasSavedToken: hasSavedToken,
                ),
                const SizedBox(height: 16),
                GuidePanel(
                  steps: steps,
                  freeNote: freeNote,
                  accent: accent,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: ValueListenableBuilder<TextEditingValue>(
            valueListenable: _controller,
            builder: (context, value, _) {
              final canSave = value.text.trim().isNotEmpty;
              return Row(
                children: [
                  Expanded(
                    child: CancelButton(
                      onPressed: () => Navigator.pop(context),
                      text: 'Cancel',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: SaveButton(
                      text: 'Save',
                      onPressed: canSave ? () => _save(tokenDto) : null,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeader({
    required String title,
    required String description,
    required String badge,
    required Widget icon,
    required bool isMain,
  }) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: isMain
                ? const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [AppColors.violet700, AppColors.sky400],
                  )
                : null,
            color: isMain ? null : Colors.white.withOpacity(0.10),
            border: isMain
                ? null
                : Border.all(color: Colors.white.withOpacity(0.15)),
            boxShadow: [
              BoxShadow(
                color: (isMain ? AppColors.indigo500 : AppColors.sky400)
                    .withOpacity(0.40),
                blurRadius: 30,
                offset: const Offset(0, 10),
                spreadRadius: -6,
              ),
            ],
          ),
          child: icon,
        ),
        const SizedBox(height: 18),
        Text(title, style: AppTypography.h1, textAlign: TextAlign.center),
        const SizedBox(height: 6),
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppTypography.bodySm.copyWith(
            fontSize: 14,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: isMain
                ? Colors.white.withOpacity(0.15)
                : AppColors.cyan300.withOpacity(0.10),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: isMain
                  ? Colors.white.withOpacity(0.20)
                  : AppColors.borderAccentSoft,
            ),
          ),
          child: Text(
            badge,
            style: AppTypography.caption.copyWith(
              color: isMain ? Colors.white : AppColors.textAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
