import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/player_video_providers.dart';
import '../../../../shared/widgets/sheets/player_menu_sheet.dart';

class PlayerBottomDock extends HookConsumerWidget {
  final VoidCallback? onOpenSettings;

  const PlayerBottomDock({
    super.key,
    this.onOpenSettings,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phrasesAsync = ref.watch(phrasesStreamProvider);
    final isAutoScrollEnabled = ref.watch(isAutoScrollEnabledProvider);

    return phrasesAsync.when(
      data: (phrases) {
        if (phrases.isEmpty) return const SizedBox.shrink();

        final total = phrases.length;
        final translated = phrases.where((p) => p.translatedPhrase != null && p.translatedPhrase!.isNotEmpty).length;
        final progress = total > 0 ? translated / total : 0.0;
        final hasActiveJobs = phrases.any((p) => p.hasProcessingStage == true || p.activeJobId != null);

        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Інтегрована плаваюча капсула (Pill Container)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF15151F).withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: const Color(0xFF24242F), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Кільце прогресу
                    _ProgressRing(
                      progress: progress,
                      isAnimating: hasActiveJobs,
                    ),
                    const SizedBox(width: 8),

                    // Кнопка Tracking / Follow
                    GestureDetector(
                      onTap: () {
                        ref.read(isAutoScrollEnabledProvider.notifier).toggle();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 44,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isAutoScrollEnabled ? const Color(0xFF4D5BF9) : const Color(0xFF2A2A38),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: isAutoScrollEnabled ? Colors.white : const Color(0xFF4D5BF9),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isAutoScrollEnabled ? 'Tracking' : 'Follow',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Кнопка налаштувань (відкриває PlayerMenuSheet)
                    GestureDetector(
                      onTap: () {
                        if (onOpenSettings != null) {
                          onOpenSettings!();
                        } else {
                          PlayerMenuSheet.show(context, isFullScreen: false);
                        }
                      },
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2A2A38),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.tune,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (err, stack) => const SizedBox.shrink(),
    );
  }
}

class _ProgressRing extends StatefulWidget {
  final double progress;
  final bool isAnimating;

  const _ProgressRing({
    required this.progress,
    this.isAnimating = false,
  });

  @override
  State<_ProgressRing> createState() => _ProgressRingState();
}

class _ProgressRingState extends State<_ProgressRing> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    if (widget.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(_ProgressRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating != oldWidget.isAnimating) {
      if (widget.isAnimating) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: 1.0,
            strokeWidth: 3.5,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withValues(alpha: 0.1)),
          ),
          RotationTransition(
            turns: _controller,
            child: CircularProgressIndicator(
              value: widget.isAnimating ? null : widget.progress,
              strokeWidth: 3.5,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4D5BF9)),
            ),
          ),
          Text(
            '${(widget.progress * 100).toInt()}%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
