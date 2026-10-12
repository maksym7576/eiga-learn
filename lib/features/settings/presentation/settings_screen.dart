import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/services/database/isar_service.dart';
import 'package:eiga/shared/player/subtitle_settings_provider.dart';
import 'package:eiga/shared/providers/language_profile_providers.dart';
import 'package:eiga/shared/widgets/cards/gemini_card.dart';
import 'package:eiga/shared/widgets/cards/jimaku_card.dart';
import 'package:eiga/shared/widgets/backgrounds/aurora_background.dart';
import 'package:eiga/shared/widgets/app_top_bar.dart';
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
    final subtitleSettings = ref.watch(subtitleSettingsProvider);

    String t(String key) => langRepo.translate(currentLang, key);

    final profilesAsync = ref.watch(languageProfilesStreamProvider);
    final hasJapaneseProfile = profilesAsync.maybeWhen(
      data: (profiles) => profiles.any((p) => p.sourceLang.toLowerCase() == 'ja'),
      orElse: () => true,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF09031A),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AuroraBackground(),
          SafeArea(
            child: Column(
              children: [
                const AppTopBar(),
                Expanded(
                  child: ListView(
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

                      // ── Theme Selection ──
                      ListTile(
                        leading: const Icon(Icons.palette_outlined, color: Colors.white70),
                        title: const Text('Тема оформлення та субтитрів', style: TextStyle(color: Colors.white)),
                        subtitle: Text(
                          subtitleSettings.isDarkTheme ? 'Темна (Ніч)' : 'Світла (Бірюза)',
                          style: TextStyle(color: Colors.white.withOpacity(0.7)),
                        ),
                        trailing: SegmentedButton<bool>(
                          segments: const [
                            ButtonSegment<bool>(
                              value: false,
                              label: Text('Світла'),
                              icon: Icon(Icons.light_mode_outlined, size: 16),
                            ),
                            ButtonSegment<bool>(
                              value: true,
                              label: Text('Темна'),
                              icon: Icon(Icons.dark_mode_outlined, size: 16),
                            ),
                          ],
                          selected: {subtitleSettings.isDarkTheme},
                          onSelectionChanged: (Set<bool> selection) {
                            if (selection.isNotEmpty) {
                              ref.read(subtitleSettingsProvider.notifier).setDarkTheme(selection.first);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                              if (states.contains(MaterialState.selected)) {
                                return const Color(0xFF3B66F5);
                              }
                              return const Color(0xFF1E1E2C);
                            }),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                          ),
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 16),

                      // ── App Settings ──
                      ListTile(
                        leading: const Icon(Icons.language, color: Colors.white70),
                        title: Text(t('language'), style: const TextStyle(color: Colors.white)),
                        subtitle: Text(currentLang.toUpperCase(), style: TextStyle(color: Colors.white.withOpacity(0.7))),
                        trailing: PopupMenuButton<String>(
                          initialValue: currentLang,
                          color: const Color(0xFF1E1E2C),
                          onSelected: (newLang) async {
                            await appConfig.setAppLanguage(newLang);
                            ref.invalidate(appConfigProvider);
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(value: 'en', child: Text('English', style: TextStyle(color: Colors.white))),
                            PopupMenuItem(value: 'uk', child: Text('Українська', style: TextStyle(color: Colors.white))),
                            PopupMenuItem(value: 'ja', child: Text('日本語', style: TextStyle(color: Colors.white))),
                          ],
                          child: Chip(
                            backgroundColor: const Color(0xFF1E1E2C),
                            label: Text(
                              currentLang == 'en'
                                  ? 'English'
                                  : currentLang == 'uk'
                                      ? 'Українська'
                                      : '日本語',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.style, color: Colors.white70),
                        title: Text(t('card_settings'), style: const TextStyle(color: Colors.white)),
                        subtitle: Text('${t('cards_count')}: $numberOfCards', style: TextStyle(color: Colors.white.withOpacity(0.7))),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline, color: Colors.white70),
                              tooltip: t('show_fewer_cards'),
                              onPressed: numberOfCards > 10
                                  ? () async {
                                      await appConfig.setNumberOfPhrases(numberOfCards - 10);
                                      ref.invalidate(appConfigProvider);
                                    }
                                  : null,
                            ),
                            Text('$numberOfCards', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline, color: Colors.white70),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
