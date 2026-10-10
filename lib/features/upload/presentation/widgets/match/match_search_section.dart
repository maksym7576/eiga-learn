import 'package:flutter/material.dart';
import 'package:eiga/features/upload/domain/models/match_models.dart';
import 'package:eiga/shared/widgets/cards/horizontal_video_list.dart';
import 'match_banner.dart';
import 'match_result_card.dart';

class MatchSearchSection extends StatefulWidget {
  final String searchQuery;
  final List<MatchMediaItem> searchResults;
  final MatchMediaItem? selectedMedia;
  final bool isLoading;
  final String? errorMessage;
  final Set<String> selectedProviderIds;
  final ValueChanged<String> onQueryChanged;
  final VoidCallback onSearchSubmitted;
  final ValueChanged<MatchMediaItem> onMediaSelected;

  const MatchSearchSection({
    super.key,
    required this.searchQuery,
    required this.searchResults,
    required this.selectedMedia,
    required this.isLoading,
    required this.errorMessage,
    required this.selectedProviderIds,
    required this.onQueryChanged,
    required this.onSearchSubmitted,
    required this.onMediaSelected,
  });

  @override
  State<MatchSearchSection> createState() => _MatchSearchSectionState();
}

class _MatchSearchSectionState extends State<MatchSearchSection> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.searchQuery);
  }

  @override
  void didUpdateWidget(covariant MatchSearchSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchQuery != widget.searchQuery &&
        _controller.text != widget.searchQuery) {
      _controller.text = widget.searchQuery;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSearchInputField(),
        if (widget.errorMessage != null) ...[
          const SizedBox(height: 12),
          MatchBanner(
            text: widget.errorMessage!,
            type: MatchBannerType.error,
          ),
        ],
        if (widget.isLoading) ...[
          const SizedBox(height: 20),
          _buildResultsHeader('Searching…', context),
          const SizedBox(height: 12),
          _buildSkeletonScroller(),
        ] else if (widget.searchResults.isNotEmpty) ...[
          const SizedBox(height: 20),
          _buildResultsHeader('Results (${widget.searchResults.length} found)', context),
          const SizedBox(height: 12),
          _buildResultsScroller(),
        ],
      ],
    );
  }

  Widget _buildSearchInputField() {
    final showClear = _controller.text.isNotEmpty;

    return Container(
      height: 52,
      padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
      decoration: BoxDecoration(
        color: const Color(0xFF1B143B).withOpacity(0.70),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white.withOpacity(0.20),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            size: 18,
            color: Colors.white.withOpacity(0.50),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: (val) {
                widget.onQueryChanged(val);
                setState(() {});
              },
              onSubmitted: (_) => widget.onSearchSubmitted(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Search for metadata...',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.40),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (showClear)
            IconButton(
              onPressed: () {
                _controller.clear();
                widget.onQueryChanged('');
                setState(() {});
              },
              icon: Icon(
                Icons.close_rounded,
                size: 18,
                color: Colors.white.withOpacity(0.60),
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
            ),
          if (widget.isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF67E8F9)),
                ),
              ),
            )
          else
            GestureDetector(
              onTap: widget.onSearchSubmitted,
              child: Container(
                height: 34,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(103, 232, 249, 0.08),
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(
                    color: const Color.fromRGBO(103, 232, 249, 0.45),
                    width: 1.2,
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF67E8F9),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildResultsHeader(String titleText, BuildContext context) {
    final count = widget.selectedProviderIds.length;
    final providerSummary = count == 1 ? '1 provider' : '$count providers';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              titleText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '· $providerSummary',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.50),
              ),
            ),
          ],
        ),
        if (widget.searchResults.isNotEmpty)
          _SeeAllButton(onTap: () => _showAllResultsDialog(context)),
      ],
    );
  }

  Future<void> _showAllResultsDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: const Color(0xFF0E0A22),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: Color(0x33FFFFFF), width: 1.5),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 720, maxHeight: 600),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with Title and Top Close Button (Symmetrical 24px padding)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Results (${widget.searchResults.length})',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(ctx),
                    icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.10),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.20),
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.close_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Proportional Grid with Auto-fit Columns
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 155,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.54,
                  ),
                  itemCount: widget.searchResults.length,
                  itemBuilder: (context, index) {
                    final item = widget.searchResults[index];
                    final isSel = widget.selectedMedia?.id == item.id;
                    return MatchResultCard(
                      item: item,
                      isSelected: isSel,
                      width: double.infinity,
                      onTap: () {
                        widget.onMediaSelected(item);
                        Navigator.pop(ctx);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultsScroller() {
    final children = widget.searchResults.map((item) {
      final isSel = widget.selectedMedia?.id == item.id;
      return MatchResultCard(
        item: item,
        isSelected: isSel,
        onTap: () => widget.onMediaSelected(item),
      );
    }).toList();

    return HorizontalVideoList(
      height: 340,
      spacing: 14,
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: children,
    );
  }

  Widget _buildSkeletonScroller() {
    final skeletons = List.generate(4, (_) {
      return SizedBox(
        width: 175,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 14,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.07),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.07),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ],
        ),
      );
    });

    return HorizontalVideoList(
      height: 340,
      spacing: 14,
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: skeletons,
    );
  }
}

class _SeeAllButton extends StatefulWidget {
  final VoidCallback onTap;
  const _SeeAllButton({required this.onTap});

  @override
  State<_SeeAllButton> createState() => _SeeAllButtonState();
}

class _SeeAllButtonState extends State<_SeeAllButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: _hover ? const Color(0x2638BDF8) : Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(99),
            border: Border.all(
              color: _hover ? const Color(0xFF67E8F9) : Colors.white.withOpacity(0.24),
              width: 1.2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'See all',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.chevron_right_rounded,
                size: 16,
                color: Color(0xFF67E8F9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
