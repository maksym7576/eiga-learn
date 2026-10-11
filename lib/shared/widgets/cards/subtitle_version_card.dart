import 'package:flutter/material.dart';
import 'package:eiga/database/dtos/subtitle_version_result_dto.dart';

/// Стандартна картка версії субтитрів для використання в етапах синхронізації та модальних вікнах.
class SubtitleVersionCard extends StatelessWidget {
  final SubtitleVersionResult version;
  final bool isSelected;
  final VoidCallback onTap;

  const SubtitleVersionCard({
    super.key,
    required this.version,
    required this.isSelected,
    required this.onTap,
  });

  static String formatOffsetInSeconds(int offsetMs) {
    if (offsetMs == 0) return '0s';
    final sec = offsetMs / 1000.0;
    final sign = offsetMs > 0 ? '+' : '-';
    final valStr = sec.abs().toStringAsFixed(1);
    return '$sign${valStr}s';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? const Color(0xFF67E8F9).withOpacity(0.12)
              : Colors.white.withOpacity(0.04),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF67E8F9).withOpacity(0.5)
                : Colors.white.withOpacity(0.12),
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF67E8F9).withOpacity(0.15),
                    blurRadius: 10,
                  )
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFF67E8F9)
                    : const Color(0xFF150C2E),
                border: Border.all(
                  color: const Color(0xFF67E8F9).withOpacity(0.4),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '${version.confidence}%',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: isSelected ? Colors.black : const Color(0xFF67E8F9),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    version.name,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${version.source} · ${formatOffsetInSeconds(version.offsetMs)}',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.55),
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF67E8F9),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}

/// Єдиний список версій субтитрів з індикатором-повзунком скролу.
class SubtitleVersionList extends StatelessWidget {
  final List<SubtitleVersionResult> versions;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final double maxHeight;
  final ScrollController? controller;

  const SubtitleVersionList({
    super.key,
    required this.versions,
    required this.selectedIndex,
    required this.onSelect,
    this.maxHeight = 280,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (versions.isEmpty) return const SizedBox.shrink();

    final scrollController = controller ?? ScrollController();

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: RawScrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        controller: scrollController,
        thumbColor: const Color(0xFF67E8F9).withOpacity(0.5),
        trackColor: Colors.white.withOpacity(0.05),
        radius: const Radius.circular(8),
        thickness: 6,
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ListView.separated(
            controller: scrollController,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: versions.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final v = versions[index];
              final isSelected = index == selectedIndex;
              return SubtitleVersionCard(
                version: v,
                isSelected: isSelected,
                onTap: () => onSelect(index),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Повний ідентичний блок із заголовком та списком версій субтитрів.
class SubtitleVersionSection extends StatelessWidget {
  final List<SubtitleVersionResult> versions;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final double maxHeight;

  const SubtitleVersionSection({
    super.key,
    required this.versions,
    required this.selectedIndex,
    required this.onSelect,
    this.maxHeight = 280,
  });

  @override
  Widget build(BuildContext context) {
    if (versions.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.04),
        border: Border.all(color: const Color(0xFF67E8F9).withOpacity(0.3), width: 1),
      ),
      child: SubtitleVersionList(
        versions: versions,
        selectedIndex: selectedIndex,
        onSelect: onSelect,
        maxHeight: maxHeight,
      ),
    );
  }
}
