import 'package:flutter/material.dart';

enum MatchBannerType { info, error }

class MatchBanner extends StatelessWidget {
  final String text;
  final MatchBannerType type;

  const MatchBanner({
    super.key,
    required this.text,
    this.type = MatchBannerType.info,
  });

  @override
  Widget build(BuildContext context) {
    final isError = type == MatchBannerType.error;
    final bgColor = isError
        ? const Color.fromRGBO(239, 68, 68, 0.12)
        : const Color.fromRGBO(56, 189, 248, 0.10);
    final borderColor = isError
        ? const Color.fromRGBO(248, 113, 113, 0.40)
        : const Color.fromRGBO(103, 232, 249, 0.35);
    final textColor = isError ? const Color(0xFFFECACA) : const Color(0xFFBAE6FD);
    final iconData = isError ? Icons.error_outline_rounded : Icons.info_outline_rounded;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(iconData, size: 18, color: textColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: textColor,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
