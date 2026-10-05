import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/database/isar_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appConfig = ref.watch(appConfigProvider);
    final currentLang = appConfig.getAppLanguage;
    final langRepo = ref.watch(languageRepositoryProvider);
    final numberOfCards = appConfig.getNumberOfPhrases;

    String t(String key) => langRepo.translate(currentLang, key);

    return Scaffold(
      appBar: AppBar(title: Text(t('settings'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Language selection tile
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
          // Card count / display control (Show more / fewer cards)
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
          const Divider(),
          const ListTile(
            leading: Icon(Icons.storage),
            title: Text('Database Cache'),
            subtitle: Text('Isar Storage Management'),
          ),
        ],
      ),
    );
  }
}
