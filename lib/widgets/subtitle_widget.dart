import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/subtitle_time_provider.dart';
import '../providers/video_time_provider.dart';
import '../models/subtitle_object.dart';

class SubtitleWidget extends ConsumerStatefulWidget {
  const SubtitleWidget({super.key});

  @override
  ConsumerState<SubtitleWidget> createState() => _SubtitleWidgetState();
}

class _SubtitleWidgetState extends ConsumerState<SubtitleWidget> {
  final ScrollController _ctrl = ScrollController();
  int? _lastActive;
  final Map<int, GlobalKey> _keyMap = {};

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _scrollTo(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_ctrl.hasClients) return;

      const itemHeight = 80.0;
      const topMargin = 50.0;
      const bottomMargin = 50.0;

      final desiredOffset = index * itemHeight;
      final viewHeight = _ctrl.position.viewportDimension;
      final maxOffset = _ctrl.position.maxScrollExtent;

      double targetOffset = _ctrl.offset;

      // Якщо елемент вище верхньої межі
      if (desiredOffset < _ctrl.offset + topMargin) {
        targetOffset = desiredOffset - topMargin;
      }
      // Якщо елемент нижче нижньої межі
      else if (desiredOffset + itemHeight > _ctrl.offset + viewHeight - bottomMargin) {
        targetOffset = desiredOffset + itemHeight - viewHeight + bottomMargin;
      } else {
        return; // вже видно
      }

      // Обмежуємо скрол у межах
      targetOffset = targetOffset.clamp(0.0, maxOffset);

      _ctrl.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    });
  }






  @override
  Widget build(BuildContext context) {
    final subState = ref.watch(subtitleProvider);
    final subtitles = subState.list;
    final currentPos = ref.watch(videoProvider.select((s) => s.currentPosition));
    final activeIndex = subtitles.indexWhere((s) => s.isActive!);

    if (subState.followVideo && activeIndex >= 0 && activeIndex != _lastActive) {
      _lastActive = activeIndex;
      _scrollTo(activeIndex);
    }

    if (subtitles.isEmpty) {
      return Container(
        color: Colors.grey[900],
        height: 200,
        child: const Center(child: Text('No subtitles', style: TextStyle(color: Colors.white70))),
      );
    }

    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.subtitles, color: Colors.green),
              const SizedBox(width: 8),
              const Text('Subtitles', style: TextStyle(color: Colors.white)),
              const Spacer(),
              Text('${(activeIndex >= 0 ? activeIndex + 1 : 0)}/${subtitles.length}',
                  style: const TextStyle(color: Colors.white70)),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => ref.read(subtitleProvider.notifier).toggleFollow(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: subState.followVideo ? Colors.green : Colors.grey[800]),
                  child: Text(subState.followVideo ? 'Follow' : 'Manual',
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              controller: _ctrl,
              itemCount: subtitles.length,
              itemBuilder: (ctx, i) {
                final s = subtitles[i];
                final isActive = s.isActive!;
                final start = s.startTime ?? Duration.zero;
                final end = s.endTime ?? Duration.zero;
                final isPast = currentPos > end;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: InkWell(
                    onTap: () {
                      if (s.startTime != null) ref.read(videoProvider.notifier).seekTo(s.startTime!);
                      ref.read(subtitleProvider.notifier).setActiveIndex(i);
                      ref.read(subtitleProvider.notifier).toggleFollow();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isActive
                            ? Colors.green.withOpacity(0.25)
                            : (isPast ? Colors.grey[850] : Colors.grey[800]),
                        borderRadius: BorderRadius.circular(8),
                        border: isActive ? Border.all(color: Colors.green, width: 1) : null,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('#${s.index ?? i + 1}', style: TextStyle(color: isActive ? Colors.green : Colors.white70)),
                                Text(_fmt(start), style: TextStyle(color: isActive ? Colors.green[200] : Colors.white60, fontSize: 10)),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Text(s.text ?? '',
                                  style: TextStyle(color: isActive ? Colors.white : Colors.white70),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis)),
                          Icon(isPast
                              ? Icons.check_circle
                              : (isActive ? Icons.play_circle_filled : Icons.schedule),
                              size: 16,
                              color: isActive ? Colors.green : Colors.white54),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}
