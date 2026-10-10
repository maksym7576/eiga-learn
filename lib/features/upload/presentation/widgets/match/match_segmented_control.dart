import 'package:flutter/material.dart';
import 'package:eiga/features/upload/domain/models/match_models.dart';

class MatchSegmentedControl extends StatelessWidget {
  final MatchMode mode;
  final ValueChanged<MatchMode> onModeChanged;

  const MatchSegmentedControl({
    super.key,
    required this.mode,
    required this.onModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF1B143B).withOpacity(0.70),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.18), width: 1.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: _SegmentButton(
              title: 'Search online',
              icon: Icons.search_rounded,
              isSelected: mode == MatchMode.search,
              onTap: () => onModeChanged(MatchMode.search),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: _SegmentButton(
              title: 'Enter manually',
              icon: Icons.edit_outlined,
              isSelected: mode == MatchMode.manual,
              onTap: () => onModeChanged(MatchMode.manual),
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SegmentButton({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_SegmentButton> createState() => _SegmentButtonState();
}

class _SegmentButtonState extends State<_SegmentButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: widget.isSelected
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF7C3AED),
                      Color(0xFF6366F1),
                      Color(0xFF0EA5E9),
                    ],
                  )
                : null,
            color: widget.isSelected
                ? null
                : (_hover ? Colors.white.withOpacity(0.10) : Colors.transparent),
            border: widget.isSelected
                ? Border.all(color: Colors.white.withOpacity(0.35), width: 1)
                : null,
            boxShadow: widget.isSelected
                ? const [
                    BoxShadow(
                      color: Color.fromRGBO(99, 102, 241, 0.6),
                      blurRadius: 18,
                      offset: Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 18,
                color: widget.isSelected
                    ? Colors.white
                    : Colors.white.withOpacity(0.72),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: widget.isSelected
                        ? Colors.white
                        : Colors.white.withOpacity(0.72),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
