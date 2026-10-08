import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:eiga/database/models/language_profile.dart';
import 'package:eiga/database/models/video.dart';
import 'package:eiga/services/database/language_profile_service.dart';
import 'package:eiga/services/database/isar_service.dart';
import 'package:eiga/shared/providers/profile_providers.dart';
import '../cards/mini_video_card.dart';
import '../dialogs/delete_profile_confirm_dialog.dart';
import '../sheets/app_bottom_sheet_mobile.dart';
import '../sheets/create_profile_sheet.dart';
import 'ghost_button.dart';
import '../profile/language_profile_ui.dart';
import '../profile/language_profiles_popover.dart';

/// Кнопка активного профілю («Japanese → Ukrainian ⌄»).
/// По кліку під нею з'являється поповер зі списком профілів (без модального вікна).
class LanguageProfileButton extends StatefulWidget {
  const LanguageProfileButton({
    super.key,
    required this.service,
    required this.t,
    this.onProfileChanged,
  });

  final LanguageProfileService service;
  final String Function(String key) t;
  final ValueChanged<LanguageProfile>? onProfileChanged;

  @override
  State<LanguageProfileButton> createState() => _LanguageProfileButtonState();
}

class _LanguageProfileButtonState extends State<LanguageProfileButton> {
  final _portal = OverlayPortalController();
  final _link = LayerLink();

  void _close() {
    if (_portal.isShowing) _portal.hide();
  }

  Future<void> _activate(LanguageProfile p) async {
    await DatabaseService.openIsar(name: p.dbName ?? 'default');
    final all = await widget.service.getAll();
    for (final o in all) {
      final shouldBeActive = o.id == p.id;
      if (o.isActive != shouldBeActive) {
        o.isActive = shouldBeActive;
        if (shouldBeActive) o.lastOpenedAt = DateTime.now();
        await widget.service.update(o);
      }
    }
    widget.onProfileChanged?.call(p);
    _close();
  }

  Future<void> _delete(LanguageProfile p) async {
    _close();
    // 1. Відкрити базу даних цього профілю та отримати всі відео
    final profileIsar = await DatabaseService.openIsar(name: p.dbName ?? 'default');
    final dbVideos = await profileIsar.videos.where().findAll();

    final miniVideos = dbVideos.map((v) => MiniVideoData(
      title: v.metadata.name ?? 'Untitled Video',
      tag: v.isCached ? (v.metadata.size != null ? '≈ ${v.metadata.size} GB' : 'Cached') : null,
      cover: v.coverImagePath != null && v.coverImagePath!.isNotEmpty ? FileImage(File(v.coverImagePath!)) : null,
    )).toList();

    if (!mounted) return;

    // 2. Показати діалог видалення з реальними відео
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: DeleteProfileConfirmDialog(
          sourceLang: p.sourceLang,
          targetLang: p.targetLang,
          videos: miniVideos,
          onConfirm: () => Navigator.pop(ctx, true),
          onCancel: () => Navigator.pop(ctx, false),
          title: widget.t('delete_profile'),
          confirmLabel: widget.t('delete'),
          cancelLabel: widget.t('cancel'),
        ),
      ),
    );
    if (ok == true) {
      await widget.service.delete(p.id);
    }
  }

  Future<void> _add() async {
    _close();
    final parentContext = context;
    if (!mounted) return;

    // Скидаємо чернетку перед відкриттям вікна створення профілю
    final container = ProviderScope.containerOf(parentContext);
    container.read(profileDraftProvider.notifier).reset();

    final isDesktop = MediaQuery.sizeOf(parentContext).width >= 640;

    if (isDesktop) {
      await showDialog<void>(
        context: parentContext,
        builder: (ctx) => Dialog(
          backgroundColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620, maxHeight: 620),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(33, 16, 78, 0.98),
                    Color.fromRGBO(20, 10, 48, 0.98),
                    Color.fromRGBO(22, 16, 76, 0.98),
                  ],
                ),
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: Colors.white.withOpacity(0.22), width: 1.5),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.85),
                    blurRadius: 90,
                    spreadRadius: -20,
                    offset: Offset(0, 40),
                  ),
                ],
              ),
              child: UncontrolledProviderScope(
                container: container,
                child: CreateProfileSheet(
                  t: widget.t,
                  onCreate: (source, target) async {
                    final profile = await widget.service.createProfile(
                      sourceLang: source,
                      targetLang: target,
                    );
                    widget.onProfileChanged?.call(profile);
                    if (ctx.mounted) Navigator.of(ctx).pop();
                  },
                  onCancel: () => Navigator.of(ctx).pop(),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      await AppBottomSheetMobile.show(
        context: parentContext,
        heightFactor: 0.92,
        child: UncontrolledProviderScope(
          container: container,
          child: CreateProfileSheet(
            t: widget.t,
            onCreate: (source, target) async {
              final profile = await widget.service.createProfile(
                sourceLang: source,
                targetLang: target,
              );
              widget.onProfileChanged?.call(profile);
              if (parentContext.mounted) Navigator.of(parentContext).pop();
            },
            onCancel: () => Navigator.of(parentContext).pop(),
          ),
        ),
      );
    }
  }

  Widget _overlay(BuildContext context) {
    final width = math.min(300.0, MediaQuery.sizeOf(context).width - 32);

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _close,
          ),
        ),
        CompositedTransformFollower(
          link: _link,
          targetAnchor: Alignment.bottomRight,
          followerAnchor: Alignment.topRight,
          offset: const Offset(0, 8),
          child: Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: width,
              child: LanguageProfilesPopover(
                stream: widget.service.watchAll(),
                t: widget.t,
                onSelect: _activate,
                onDelete: _delete,
                onAdd: _add,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 640;

    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _portal,
        overlayChildBuilder: _overlay,
        child: StreamBuilder<List<LanguageProfile>>(
          stream: widget.service.watchAll(),
          builder: (context, snap) {
            LanguageProfile? active;
            for (final p in snap.data ?? const <LanguageProfile>[]) {
              if (p.isActive) active = p;
            }

            final label = active == null
                ? widget.t('add_profile')
                : wide
                    ? ProfileLabels.pair(active)
                    : ProfileLabels.codes(active);

            return GhostButton(
              onPressed: _portal.toggle,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              builder: (_, __) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
