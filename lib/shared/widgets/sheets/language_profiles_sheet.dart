import 'package:flutter/material.dart';
import '../../../../database/models/language_profile.dart';
import '../../../../services/database/language_profile_service.dart';
import '../../../../database/seeds/language_seed.dart';
import '../../../../database/dtos/language_dto.dart';
import '../../../../services/database/isar_service.dart';

class LanguageProfilesSheet extends StatelessWidget {
  const LanguageProfilesSheet({
    super.key,
    required this.service,
    required this.t,
    this.onProfileChanged,
  });

  final LanguageProfileService service;
  final String Function(String key) t;
  final ValueChanged<LanguageProfile>? onProfileChanged;

  List<LanguageDto> get _langs => LanguageSeed.languages;

  LanguageDto? _find(String code) {
    for (final l in _langs) {
      if (l.code.toLowerCase() == code.toLowerCase()) return l;
    }
    return null;
  }

  String _name(String code) => _find(code)?.name ?? code.toUpperCase();

  String _pair(LanguageProfile p) =>
      '${_name(p.sourceLang)}  →  ${_name(p.targetLang)}';

  String _codes(LanguageProfile p) =>
      '${p.sourceLang.toUpperCase()}  →  ${p.targetLang.toUpperCase()}';

  Future<void> _activate(BuildContext context, LanguageProfile p) async {
    await DatabaseService.openIsar(name: p.dbName ?? 'default');
    final all = await service.getAll();
    for (final o in all) {
      final shouldBeActive = o.id == p.id;
      if (o.isActive != shouldBeActive) {
        o.isActive = shouldBeActive;
        if (shouldBeActive) o.lastOpenedAt = DateTime.now();
        await service.update(o);
      }
    }
    onProfileChanged?.call(p);
    if (context.mounted) Navigator.pop(context);
  }

  Future<void> _confirmDelete(BuildContext context, LanguageProfile p) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t('delete_profile')),
        content: Text(_pair(p)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(t('cancel'))),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(t('delete'))),
        ],
      ),
    );
    if (ok == true) await service.delete(p.id);
  }

  Future<void> _addDialog(
      BuildContext context, List<LanguageProfile> existing) async {
    String source = _langs[0].code;
    String target = _langs[1].code;

    final created = await showDialog<bool>(
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
                  for (final l in _langs)
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
                  onPressed: () => Navigator.pop(ctx, false),
                  child: Text(t('cancel'))),
              TextButton(
                onPressed:
                    (same || duplicate) ? null : () => Navigator.pop(ctx, true),
                child: Text(t('create')),
              ),
            ],
          );
        },
      ),
    );

    if (created == true) {
      final profile = await service.createProfile(
          sourceLang: source, targetLang: target);
      onProfileChanged?.call(profile);
      if (context.mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * .7,
        ),
        child: StreamBuilder<List<LanguageProfile>>(
          stream: service.watchAll(),
          builder: (_, snap) {
            final list = [...(snap.data ?? const <LanguageProfile>[])]
              ..sort((a, b) => (b.lastOpenedAt ?? DateTime(0))
                  .compareTo(a.lastOpenedAt ?? DateTime(0)));

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(t('profiles'),
                        style: tt.titleLarge
                            ?.copyWith(fontWeight: FontWeight.w800)),
                  ),
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (final p in list)
                        ListTile(
                          leading: Icon(
                            p.isActive
                                ? Icons.radio_button_checked_rounded
                                : Icons.radio_button_off_rounded,
                            color: p.isActive
                                ? cs.primary
                                : cs.onSurfaceVariant,
                          ),
                          title: Text(_pair(p),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700)),
                          subtitle: Text(_codes(p)),
                          trailing: p.isActive
                              ? null
                              : IconButton(
                                  icon: const Icon(
                                      Icons.delete_outline_rounded),
                                  onPressed: () =>
                                      _confirmDelete(context, p),
                                ),
                          onTap: () => _activate(context, p),
                        ),
                      ListTile(
                        leading: Icon(Icons.add_circle_outline_rounded,
                            color: cs.primary),
                        title: Text(t('add_profile'),
                            style: TextStyle(
                                color: cs.primary,
                                fontWeight: FontWeight.w700)),
                        enabled: _langs.length >= 2,
                        onTap: () => _addDialog(context, list),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        ),
      ),
    );
  }
}
