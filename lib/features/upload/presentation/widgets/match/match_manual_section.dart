import 'package:flutter/material.dart';
import 'match_banner.dart';

class MatchManualSection extends StatelessWidget {
  final String title;
  final ValueChanged<String> onTitleChanged;

  const MatchManualSection({
    super.key,
    required this.title,
    required this.onTitleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLabel('Title'),
        const SizedBox(height: 8),
        _buildTitleField(),
        const SizedBox(height: 12),
        const MatchBanner(
          text: 'Cover will be extracted automatically from the video file.',
          type: MatchBannerType.info,
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.8,
        color: Colors.white.withOpacity(0.50),
      ),
    );
  }

  Widget _buildTitleField() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
            Icons.edit_outlined,
            size: 18,
            color: Colors.white.withOpacity(0.50),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onChanged: onTitleChanged,
              controller: TextEditingController(text: title)
                ..selection = TextSelection.collapsed(offset: title.length),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Enter Series/Movie Title...',
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
        ],
      ),
    );
  }
}
