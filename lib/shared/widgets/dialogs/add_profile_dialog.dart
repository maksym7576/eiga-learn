import 'package:flutter/material.dart';
import 'package:eiga/database/models/language_profile.dart';
import 'package:eiga/database/seeds/language_seed.dart';

/// Діалог створення профілю. Повертає обрану пару мов або null, якщо скасовано.
Future<({String source, String target})?> showAddProfileDialog(
  BuildContext context, {
  required List<LanguageProfile> existing,
  required String Function(String key) t,
}) {
  final langs = LanguageSeed.languages;
  var source = langs[0].code;
  var target = langs[1].code;

  return showDialog<({String source, String target})>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) {
        final cs = Theme.of(ctx).colorScheme;
        final same = source == target;
        final duplicate = existing.any((p) =>
            p.sourceLang.toLowerCase() == source.toLowerCase() &&
            p.targetLang.toLowerCase() == target.toLowerCase());

        Widget dropdown(String value, ValueChanged<String> onChanged) =>
            DropdownButtonFormField<String>(
              initialValue: value,
              isExpanded: true,
              items: [
                for (final l in langs)
                  DropdownMenuItem(
                    value: l.code,
                    child: Text('${l.name} · ${l.subtitle}',
                        overflow: TextOverflow.ellipsis),
                  ),
              ],
              onChanged: (v) => setState(() => onChanged(v!)),
            );

        return AlertDialog(
          title: Text(t('new_profile')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              dropdown(source, (v) => source = v),
              const SizedBox(height: 12),
              Icon(Icons.arrow_downward_rounded, color: cs.primary),
              const SizedBox(height: 12),
              dropdown(target, (v) => target = v),
              if (same || duplicate)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    same ? t('languages_must_differ') : t('profile_exists'),
                    style: TextStyle(color: cs.error),
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(t('cancel')),
            ),
            TextButton(
              onPressed: (same || duplicate)
                  ? null
                  : () => Navigator.pop(ctx, (source: source, target: target)),
              child: Text(t('create')),
            ),
          ],
        );
      },
    ),
  );
}
