import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class _MouseScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };
}

/// A horizontal scrollable / swipeable list of cards that can be dragged with the mouse or touch,
/// featuring a visible scrollbar indicator at the bottom.
class HorizontalVideoList extends StatefulWidget {
  final List<Widget> children;
  final double height;
  final EdgeInsetsGeometry padding;
  final double spacing;

  const HorizontalVideoList({
    super.key,
    required this.children,
    this.height = 340,
    this.padding = const EdgeInsets.symmetric(horizontal: 4),
    this.spacing = 14.0,
  });

  @override
  State<HorizontalVideoList> createState() => _HorizontalVideoListState();
}

class _HorizontalVideoListState extends State<HorizontalVideoList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.children.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: widget.height,
      child: ScrollConfiguration(
        behavior: _MouseScrollBehavior(),
        child: ScrollbarTheme(
          data: ScrollbarThemeData(
            thumbColor: WidgetStateProperty.all(Colors.white.withOpacity(0.35)),
            thickness: WidgetStateProperty.all(6.0),
            radius: const Radius.circular(8),
            crossAxisMargin: 2.0,
            mainAxisMargin: 4.0,
          ),
          child: Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            child: ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                widget.padding.horizontal / 2,
                widget.padding.vertical / 2,
                widget.padding.horizontal / 2,
                (widget.padding.vertical / 2) + 16,
              ),
              itemCount: widget.children.length,
              separatorBuilder: (_, __) => SizedBox(width: widget.spacing),
              itemBuilder: (context, index) => widget.children[index],
            ),
          ),
        ),
      ),
    );
  }
}
