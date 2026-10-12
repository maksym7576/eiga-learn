import 'package:flutter/material.dart';
import 'package:eiga/shared/phrase/list/phrase_list_view.dart';

class PlayerPhraseList extends StatelessWidget {
  final VoidCallback? onOpenSettings;

  const PlayerPhraseList({
    super.key,
    this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context) {
    return PhraseListView(
      onOpenSettings: onOpenSettings,
    );
  }
}
