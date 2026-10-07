import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:eiga/database/models/language_profile.dart';
import 'package:eiga/services/database/language_profile_service.dart';
import 'logo/eiga_logo.dart';
import 'buttons/language_profile_button.dart';
import 'buttons/sync_button.dart';
import 'buttons/settings_button.dart';

/// Мінімальний app bar без фону: логотип зліва, профіль · sync · settings справа.
class AppBarMinimal extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMinimal({
    super.key,
    required this.profileService,
    required this.t,
    this.needsSync = false,
    this.onSync,
    this.onSettings,
    this.onProfileChanged,
  });

  final LanguageProfileService profileService;
  final String Function(String key) t;
  final bool needsSync;
  final Future<void> Function()? onSync;
  final VoidCallback? onSettings;
  final ValueChanged<LanguageProfile>? onProfileChanged;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 64,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const EigaLogo(size: 28),
              const Spacer(),
              LanguageProfileButton(
                service: profileService,
                t: t,
                onProfileChanged: onProfileChanged,
              ),
              const SizedBox(width: 6),
              SyncButton(
                needsSync: needsSync,
                onSync: onSync ?? () async {
                  // Поки синхронізація не працює – заглушка
                  await Future.delayed(const Duration(seconds: 1));
                },
                tooltip: needsSync ? t('sync_needed') : t('up_to_date'),
              ),
              const SizedBox(width: 6),
              SettingsButton(
                onPressed: onSettings ?? () => context.go('/settings'),
                tooltip: t('settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
