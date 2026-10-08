import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:eiga/core/theme/app_colors.dart';
import 'package:eiga/shared/widgets/cards/video_card.dart';
import 'package:eiga/shared/widgets/cards/video_item.dart';
import 'package:eiga/shared/providers/video_providers.dart';
import 'package:eiga/services/database/isar_service.dart';
import 'package:eiga/shared/widgets/backgrounds/aurora_background.dart';
import 'package:eiga/shared/widgets/buttons/add_video_button.dart';
import 'package:eiga/shared/widgets/app_top_bar.dart';
import 'package:eiga/shared/utils/video_action_handler.dart';

enum _Filter { all, ready, processing }

/// Екран бібліотеки відео, оформлений як субскрін з AppTopBar.
class LibrarySubScreen extends ConsumerWidget {
  const LibrarySubScreen({super.key});

  String _formatTimeAgo(DateTime? dt) {
    if (dt == null) return '';
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videosAsync = ref.watch(videosStreamProvider);
    final appConfig = ref.watch(appConfigProvider);
    final currentLang = appConfig.getAppLanguage;
    final langRepo = ref.watch(languageRepositoryProvider);
    String t(String key) => langRepo.translate(currentLang, key);

    final videoItems = videosAsync.asData?.value.map((v) => VideoItem(
          id: v.id.toString(),
          title: v.metadata.name ?? 'Untitled',
          coverUrl: v.coverImagePath,
          episode: v.metadata.episode?.toString(),
          date: _formatTimeAgo(v.metadata.createdAt),
          cached: v.isCached,
          sourceLang: v.originalLanguage,
          targetLang: v.translatedLanguage,
        )).toList() ?? [];

    return _LibrarySubScreenView(
      videos: videoItems,
      t: t,
      onOpen: (v) {},
      onMenuAction: (v, action) => handleVideoMenuAction(context, ref, v, action),
      onAdd: () => context.go('/upload'),
    );
  }
}

class _LibrarySubScreenView extends StatefulWidget {
  const _LibrarySubScreenView({
    required this.videos,
    required this.t,
    this.onOpen,
    this.onMenuAction,
    this.onAdd,
  });

  final List<VideoItem> videos;
  final String Function(String key) t;
  final ValueChanged<VideoItem>? onOpen;
  final void Function(VideoItem video, VideoMenuAction action)? onMenuAction;
  final VoidCallback? onAdd;

  @override
  State<_LibrarySubScreenView> createState() => _LibrarySubScreenViewState();
}

class _LibrarySubScreenViewState extends State<_LibrarySubScreenView> {
  static const _cyan = Color(0xFF67E8F9);

  final _searchCtrl = TextEditingController();
  _Filter _filter = _Filter.all;
  String _query = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  List<VideoItem> get _filtered {
    final q = _query.trim().toLowerCase();
    return widget.videos.where((v) {
      if (q.isNotEmpty && !v.title.toLowerCase().contains(q)) return false;
      switch (_filter) {
        case _Filter.all:
          return true;
        case _Filter.ready:
          return v.stage == null;
        case _Filter.processing:
          return v.stage != null;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.t;
    final items = _filtered;
    final processing = items.where((v) => v.stage != null).toList();
    final ready = items.where((v) => v.stage == null).toList();
    final saved = ready.where((v) => v.cached).toList();
    final recent = ready.where((v) => !v.cached).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF09031A),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AuroraBackground(),
          SafeArea(
            child: Column(
              children: [
                AppTopBar(
                  onBack: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/main');
                    }
                  },
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: _buildHeader(t)),
                      if (items.isEmpty)
                        SliverFillRemaining(hasScrollBody: false, child: _buildEmpty(t))
                      else ...[
                        if (processing.isNotEmpty) ..._section(t('section_processing'), processing),
                        if (recent.isNotEmpty) ..._section(t('section_recent'), recent),
                        if (saved.isNotEmpty) ..._section(t('section_saved'), saved),
                      ],
                      const SliverToBoxAdapter(child: SizedBox(height: 96)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String Function(String key) t) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t('library_title'),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            t('videos_count').replaceAll('{count}', '${widget.videos.length}'),
            style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(.6)),
          ),
          const SizedBox(height: 16),
          _buildSearch(t),
          const SizedBox(height: 12),
          Row(
            children: [
              _FilterChip(
                label: t('filter_all'),
                selected: _filter == _Filter.all,
                onTap: () => setState(() => _filter = _Filter.all),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: t('filter_ready'),
                selected: _filter == _Filter.ready,
                onTap: () => setState(() => _filter = _Filter.ready),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: t('filter_processing'),
                selected: _filter == _Filter.processing,
                onTap: () => setState(() => _filter = _Filter.processing),
              ),
            ],
          ),
          if (widget.onAdd != null) ...[
            const SizedBox(height: 16),
            AddVideoButton(
              title: t('add_video_btn') != 'add_video_btn' ? t('add_video_btn') : 'Add Video',
              subtitle: t('add_video_sub') != 'add_video_sub' ? t('add_video_sub') : 'Import media or subtitles',
              onPressed: widget.onAdd!,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSearch(String Function(String key) t) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: AppColors.white15,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.white20, width: 1.5),
      ),
      child: TextField(
        controller: _searchCtrl,
        onChanged: (text) => setState(() => _query = text),
        style: const TextStyle(fontSize: 14, color: Colors.white),
        cursorColor: _cyan,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: t('search_hint'),
          hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
          prefixIcon: Icon(Icons.search_rounded, size: 20, color: Colors.white.withOpacity(.7)),
          suffixIcon: _query.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.close_rounded, size: 18, color: Colors.white),
                  onPressed: () => setState(() {
                    _searchCtrl.clear();
                    _query = '';
                  }),
                ),
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
        ),
      ),
    );
  }

  List<Widget> _section(String title, List<VideoItem> list) {
    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${list.length}',
                style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(.5)),
              ),
            ],
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 190,
            mainAxisSpacing: 24,
            crossAxisSpacing: 16,
            childAspectRatio: .56,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              final v = list[i];
              return VideoCard(
                video: v,
                width: double.infinity,
                onTap: () => widget.onOpen?.call(v),
                onMenuAction: (a) => widget.onMenuAction?.call(v, a),
              );
            },
            childCount: list.length,
          ),
        ),
      ),
    ];
  }

  Widget _buildEmpty(String Function(String key) t) {
    final searching = _query.isNotEmpty;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              searching ? Icons.search_off_rounded : Icons.movie_outlined,
              size: 48,
              color: Colors.white.withOpacity(.4),
            ),
            const SizedBox(height: 12),
            Text(
              searching ? t('no_results_title') : t('empty_title'),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              searching ? t('no_results_subtitle') : t('empty_subtitle'),
              style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(.6)),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected ? const Color(0x2938BDF8) : AppColors.white15,
          border: Border.all(
            color: selected ? const Color(0xFF67E8F9) : AppColors.white20,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: .3,
            color: selected ? const Color(0xFF67E8F9) : Colors.white,
          ),
        ),
      ),
    );
  }
}
