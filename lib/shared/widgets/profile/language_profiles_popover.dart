import 'package:flutter/material.dart';
import 'package:eiga/database/models/language_profile.dart';
import '../../../core/theme/app_colors.dart';
import '../buttons/add_profile_button.dart';
import 'language_profiles_list.dart';

/// Випадаючий блок під кнопкою: список карток + кнопка «Add profile» знизу.
class LanguageProfilesPopover extends StatelessWidget {
  const LanguageProfilesPopover({
    super.key,
    required this.stream,
    required this.t,
    required this.onSelect,
    required this.onDelete,
    required this.onAdd,
  });

  final Stream<List<LanguageProfile>> stream;
  final String Function(String key) t;
  final ValueChanged<LanguageProfile> onSelect;
  final ValueChanged<LanguageProfile> onDelete;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutBack,
      builder: (_, v, child) => Opacity(
        opacity: v.clamp(0.0, 1.0),
        child: Transform.scale(
          scale: .92 + .08 * v,
          alignment: Alignment.topRight,
          child: child,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.surfacePopover,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.borderStrong, width: 1.5),
            boxShadow: const [
              BoxShadow(
                color: Color(0xD9000000),
                blurRadius: 60,
                spreadRadius: -10,
                offset: Offset(0, 24),
              ),
            ],
          ),
          child: StreamBuilder<List<LanguageProfile>>(
            stream: stream,
            builder: (_, snap) {
              final profiles = snap.data ?? const [];

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: LanguageProfilesList(
                      profiles: profiles,
                      onSelect: onSelect,
                      onDelete: onDelete,
                    ),
                  ),
                  Divider(
                      height: 1, thickness: 1, color: Colors.white.withOpacity(0.14)),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: AddProfileButton(
                      label: t('add_profile'),
                      onPressed: onAdd,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
