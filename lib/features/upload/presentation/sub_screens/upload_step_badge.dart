import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';

class UploadStepBadge extends StatelessWidget {
  final int currentStep; // 0..3
  final int maxReachedStep; // furthest step reached
  final ValueChanged<int> onStepTap;

  const UploadStepBadge({
    Key? key,
    required this.currentStep,
    required this.maxReachedStep,
    required this.onStepTap,
  }) : super(key: key);

  static const List<String> steps = ['Source', 'Match', 'Subtitles', 'Finish'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.borderDefault, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(steps.length * 2 - 1, (index) {
          if (index.isEven) {
            final stepIndex = index ~/ 2;
            final isDone = stepIndex < maxReachedStep;
            final isOn = stepIndex == currentStep;
            final isView = stepIndex == currentStep;
            final isLock = stepIndex > maxReachedStep;

            return GestureDetector(
              onTap: isLock ? null : () => onStepTap(stepIndex),
              child: Opacity(
                opacity: isLock ? 0.7 : 1.0,
                child: SizedBox(
                  width: 72,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: isOn
                                  ? const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Color(0xFF7C3AED), Color(0xFF6366F1), Color(0xFF0EA5E9)],
                                    )
                                  : null,
                              color: isOn ? null : (isDone ? const Color.fromRGBO(103, 232, 249, 0.14) : Colors.transparent),
                              border: Border.all(
                                color: isView ? AppColors.cyan300 : AppColors.borderDefault,
                                width: isView ? 2 : 1.5,
                              ),
                              boxShadow: isOn
                                  ? const [
                                      BoxShadow(
                                        color: Color.fromRGBO(99, 102, 241, 0.8),
                                        blurRadius: 16,
                                        offset: Offset(0, 4),
                                      ),
                                    ]
                                  : (isView
                                      ? [
                                          BoxShadow(
                                            color: AppColors.cyan300.withOpacity(0.3),
                                            blurRadius: 12,
                                          ),
                                        ]
                                      : null),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${stepIndex + 1}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: (isOn || isDone) ? Colors.white : Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ),
                          if (isDone)
                            Positioned(
                              top: -4,
                              right: -4,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFF34D399),
                                  border: Border.all(color: const Color(0xFF0A0518), width: 2),
                                ),
                                child: const Center(
                                  child: Icon(Icons.check, size: 10, color: Color(0xFF04121A)),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        steps[stepIndex],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: (isOn || isDone) ? FontWeight.w800 : FontWeight.w600,
                          color: (isOn || isDone) ? Colors.white : Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            final lineIndex = index ~/ 2;
            final isDoneLine = lineIndex < maxReachedStep;

            return Expanded(
              child: Container(
                height: 3,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white.withOpacity(0.08),
                ),
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: isDoneLine ? 1.0 : 0.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF67E8F9), Color(0xFFA78BFA)],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
