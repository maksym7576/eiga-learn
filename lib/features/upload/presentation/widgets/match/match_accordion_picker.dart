import 'package:flutter/material.dart';

class MatchAccordionItemData {
  final String id;
  final String title;
  final String? description;
  final IconData? icon;
  final String? shortCode;
  final Color? color;

  const MatchAccordionItemData({
    required this.id,
    required this.title,
    this.description,
    this.icon,
    this.shortCode,
    this.color,
  });
}

class MatchAccordionPicker extends StatefulWidget {
  final List<MatchAccordionItemData> items;
  final Set<String> selectedIds;
  final bool isSingleSelect;
  final String unitLabel;
  final ValueChanged<Set<String>> onSelectionChanged;

  const MatchAccordionPicker({
    super.key,
    required this.items,
    required this.selectedIds,
    this.isSingleSelect = false,
    this.unitLabel = 'items',
    required this.onSelectionChanged,
  });

  @override
  State<MatchAccordionPicker> createState() => _MatchAccordionPickerState();
}

class _MatchAccordionPickerState extends State<MatchAccordionPicker>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  String _filterQuery = '';
  late AnimationController _animController;
  late Animation<double> _expandAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 280),
      vsync: this,
    );
    _expandAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _toggleOpen() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _animController.forward();
      } else {
        _animController.reverse();
      }
    });
  }

  void _close() {
    if (_isOpen) {
      setState(() {
        _isOpen = false;
        _animController.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedItems = widget.items
        .where((item) => widget.selectedIds.contains(item.id))
        .toList();

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B143B).withOpacity(0.70),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: _isOpen
              ? const Color(0xFF67E8F9)
              : Colors.white.withOpacity(0.20),
          width: 1.5,
        ),
        boxShadow: _isOpen
            ? const [
                BoxShadow(
                  color: Color.fromRGBO(103, 232, 249, 0.14),
                  blurRadius: 16,
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTriggerHeader(selectedItems),
          SizeTransition(
            sizeFactor: _expandAnim,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withOpacity(0.12),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.items.length > 5) ...[
                    const SizedBox(height: 10),
                    _buildFilterField(),
                  ],
                  const SizedBox(height: 8),
                  _buildItemsList(),
                  if (!widget.isSingleSelect) ...[
                    const SizedBox(height: 10),
                    _buildFooter(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTriggerHeader(List<MatchAccordionItemData> selectedItems) {
    return GestureDetector(
      onTap: _toggleOpen,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            if (widget.isSingleSelect) ...[
              if (selectedItems.isNotEmpty) _buildAvatarIcon(selectedItems.first),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedItems.isNotEmpty
                          ? selectedItems.first.title
                          : 'Select option',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (selectedItems.isNotEmpty &&
                        selectedItems.first.description != null)
                      Text(
                        selectedItems.first.description!,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.white.withOpacity(0.65),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(103, 232, 249, 0.10),
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(
                    color: const Color.fromRGBO(103, 232, 249, 0.35),
                  ),
                ),
                child: Text(
                  '${widget.items.length}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF67E8F9),
                  ),
                ),
              ),
            ] else ...[
              _buildStackedAvatars(selectedItems),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedItems.map((i) => i.title).join(', '),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${selectedItems.length} of ${widget.items.length} ${widget.unitLabel} · tap to change',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.65),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(103, 232, 249, 0.10),
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(
                    color: const Color.fromRGBO(103, 232, 249, 0.35),
                  ),
                ),
                child: Text(
                  '${selectedItems.length}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF67E8F9),
                  ),
                ),
              ),
            ],
            const SizedBox(width: 8),
            AnimatedRotation(
              turns: _isOpen ? 0.5 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 22,
                color: Colors.white.withOpacity(0.72),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarIcon(MatchAccordionItemData item) {
    if (item.icon != null) {
      return Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(103, 232, 249, 0.12),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(103, 232, 249, 0.28),
          ),
        ),
        alignment: Alignment.center,
        child: Icon(item.icon, size: 16, color: const Color(0xFF67E8F9)),
      );
    }

    final color = item.color ?? const Color(0xFF67E8F9);
    final letter = item.shortCode ?? item.title.substring(0, 1).toUpperCase();

    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.7)],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: Color(0xFF04121A),
        ),
      ),
    );
  }

  Widget _buildStackedAvatars(List<MatchAccordionItemData> selectedItems) {
    final displayList = selectedItems.take(4).toList();
    final remainingCount = selectedItems.length - 4;

    return SizedBox(
      height: 28,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < displayList.length; i++)
            Transform.translate(
              offset: Offset(-8.0 * i, 0),
              child: _buildAvatarIcon(displayList[i]),
            ),
          if (remainingCount > 0)
            Transform.translate(
              offset: Offset(-8.0 * displayList.length, 0),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.18),
                  border: Border.all(color: const Color(0xFF1A1038), width: 2),
                ),
                alignment: Alignment.center,
                child: Text(
                  '+$remainingCount',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterField() {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1B143B).withOpacity(0.80),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.20),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 16, color: Colors.white.withOpacity(0.50)),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: (val) => setState(() => _filterQuery = val),
              style: const TextStyle(fontSize: 13, color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Filter…',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withOpacity(0.40),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    final filtered = widget.items.where((i) {
      if (_filterQuery.trim().isEmpty) return true;
      final q = _filterQuery.trim().toLowerCase();
      return i.title.toLowerCase().contains(q) ||
          (i.description?.toLowerCase().contains(q) ?? false);
    }).toList();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 280),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: filtered.map((item) {
            final isSelected = widget.selectedIds.contains(item.id);
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: GestureDetector(
                onTap: () {
                  if (widget.isSingleSelect) {
                    widget.onSelectionChanged({item.id});
                    _close();
                  } else {
                    final next = Set<String>.from(widget.selectedIds);
                    if (isSelected) {
                      if (next.length > 1) {
                        next.remove(item.id);
                      }
                    } else {
                      next.add(item.id);
                    }
                    widget.onSelectionChanged(next);
                  }
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color.fromRGBO(103, 232, 249, 0.12)
                        : Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF67E8F9)
                          : Colors.white.withOpacity(0.18),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildAvatarIcon(item),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            if (item.description != null)
                              Text(
                                item.description!,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white.withOpacity(0.60),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (widget.isSingleSelect)
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF67E8F9)
                                  : Colors.white.withOpacity(0.35),
                              width: 2,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: isSelected
                              ? Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF67E8F9),
                                  ),
                                )
                              : null,
                        )
                      else
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: isSelected
                                ? const Color(0xFF67E8F9)
                                : Colors.transparent,
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF67E8F9)
                                  : Colors.white.withOpacity(0.35),
                              width: 2,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: isSelected
                              ? const Icon(
                                  Icons.check_rounded,
                                  size: 14,
                                  color: Color(0xFF04121A),
                                )
                              : null,
                        ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            final allIds = widget.items.map((i) => i.id).toSet();
            widget.onSelectionChanged(allIds);
          },
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(103, 232, 249, 0.07),
              borderRadius: BorderRadius.circular(99),
              border: Border.all(
                color: const Color.fromRGBO(103, 232, 249, 0.40),
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Select all',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0xFF67E8F9),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: _close,
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF7C3AED), Color(0xFF0EA5E9)],
              ),
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Done',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
