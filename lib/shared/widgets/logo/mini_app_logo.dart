import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class MiniAppLogo extends StatelessWidget {
  const MiniAppLogo({super.key, this.size = 40});
  final double size;

  @override
  Widget build(BuildContext context) {
    final base = AppTypography.logo.copyWith(fontSize: size, height: 1);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          'eig',
          style: base.copyWith(
            shadows: [Shadow(color: AppColors.sky400.withOpacity(0.5), blurRadius: 30)],
          ),
        ),
        Transform.translate(
          offset: Offset(0, size * 0.09),
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (r) => AppColors.gradTextCyan.createShader(r),
            child: Text(
              'あ',
              style: base.copyWith(fontFamily: AppTypography.fontJp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
