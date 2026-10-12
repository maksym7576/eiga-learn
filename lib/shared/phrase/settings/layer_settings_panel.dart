import 'package:flutter/material.dart';

import 'package:eiga/core/theme/app_colors.dart';
import 'package:eiga/shared/phrase/core/layers/layer_config.dart';
import 'package:eiga/shared/phrase/core/layers/phrase_layout.dart';

class LayerSettingsPanel extends StatefulWidget {
  final PhraseLayout layout;
  final ValueChanged<PhraseLayout> onLayoutChanged;

  const LayerSettingsPanel({
    super.key,
    required this.layout,
    required this.onLayoutChanged,
  });

  @override
  State<LayerSettingsPanel> createState() => _LayerSettingsPanelState();
}

class _LayerSettingsPanelState extends State<LayerSettingsPanel> {
  late List<LayerConfig> _layers;

  @override
  void initState() {
    super.initState();
    _layers = List.from(widget.layout.layers);
  }

  void _toggleVisibility(int index) {
    setState(() {
      _layers[index] = _layers[index].copyWith(visible: !_layers[index].visible);
    });
    widget.onLayoutChanged(PhraseLayout(layers: _layers));
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final item = _layers.removeAt(oldIndex);
      _layers.insert(newIndex, item);
    });
    widget.onLayoutChanged(PhraseLayout(layers: _layers));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0A34).withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Налаштування шарів',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.cyan300,
            ),
          ),
          const SizedBox(height: 12),
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _layers.length,
            onReorder: _onReorder,
            itemBuilder: (context, index) {
              final layer = _layers[index];
              return ListTile(
                key: ValueKey(layer.id),
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  layer.id.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: layer.visible ? Colors.white : Colors.white38,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    layer.visible ? Icons.visibility : Icons.visibility_off,
                    color: layer.visible ? AppColors.cyanLight : Colors.white38,
                    size: 20,
                  ),
                  onPressed: () => _toggleVisibility(index),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
