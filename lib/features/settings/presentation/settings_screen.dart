import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/database/isar_service.dart';
import '../../../shared/providers/language_profile_providers.dart';
import '../../../shared/widgets/cards/gemini_card.dart';
import '../../../shared/widgets/cards/jimaku_card.dart';
import 'sub_screens/gemini_key_screen.dart';
import 'sub_screens/jimaku_key_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appConfig = ref.watch(appConfigProvider);
    final currentLang = appConfig.getAppLanguage;
    final langRepo = ref.watch(languageRepositoryProvider);
    final numberOfCards = appConfig.getNumberOfPhrases;

    String t(String key) => langRepo.translate(currentLang, key);

    // Спостерігаємо за профілями, щоб перевірити чи є японська мова (sourceLang == 'ja')
    final profilesAsync = ref.watch(languageProfilesStreamProvider);
    final hasJapaneseProfile = profilesAsync.maybeWhen(
      data: (profiles) => profiles.any((p) => p.sourceLang.toLowerCase() == 'ja'),
      orElse: () => true,
    );

    return Scaffold(
      appBar: AppBar(title: Text(t('settings'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── API Keys Section ──
          Text(
            'API keys',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 12),
          GeminiCard(
            title: 'Gemini key',
            subtitle: 'Translates the subtitles',
            tag: 'Required',
            onTap: () {
              Navigator.push(context, GeminiKeyScreen.route());
            },
          ),
          if (hasJapaneseProfile) ...[
            const SizedBox(height: 12),
            JimakuCard(
              title: 'Jimaku key',
              subtitle: 'Quick search for Japanese subtitles',
              tag: 'Recommended',
              onTap: () {
                Navigator.push(context, JimakuKeyScreen.route());
              },
            ),
          ],
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          // ── App Settings ──
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(t('language')),
            subtitle: Text(currentLang.toUpperCase()),
            trailing: DropdownButton<String>(
              value: currentLang,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'uk', child: Text('Українська')),
                DropdownMenuItem(value: 'ja', child: Text('日本語')),
              ],
              onChanged: (newLang) async {
                if (newLang != null) {
                  await appConfig.setAppLanguage(newLang);
                  ref.invalidate(appConfigProvider);
                }
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.style),
            title: Text(t('card_settings')),
            subtitle: Text('${t('cards_count')}: $numberOfCards'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  tooltip: t('show_fewer_cards'),
                  onPressed: numberOfCards > 10
                      ? () async {
                          await appConfig.setNumberOfPhrases(numberOfCards - 10);
                          ref.invalidate(appConfigProvider);
                        }
                      : null,
                ),
                Text('$numberOfCards', style: const TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  tooltip: t('show_more_cards'),
                  onPressed: numberOfCards < 200
                      ? () async {
                          await appConfig.setNumberOfPhrases(numberOfCards + 10);
                          ref.invalidate(appConfigProvider);
                        }
                      : null,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
