import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';

/// Вкладки Audio / Subtitles. Кожен трек субтитрів має статус (Original / Translation) або кнопку "+ Set role".
class TracksPanel extends StatefulWidget {
  final List<Map<String, String>> audioTracks;
  final List<Map<String, String>> subtitleTracks;
  final int? selectedAudio;
  final int? selectedSubtitle;
  final ValueChanged<int>? onAudioSelected;
  final ValueChanged<int>? onSubtitleSelected;
  final Map<int, String> subtitleRoles; // index -> 'Original' | 'Translation'
  final Function(int index, String? role)? onSubtitleRoleChanged;
  final bool initialSubtitles;

  const TracksPanel({
    Key? key,
    this.audioTracks = const [],
    this.subtitleTracks = const [],
    this.selectedAudio,
    this.selectedSubtitle,
    this.onAudioSelected,
    this.onSubtitleSelected,
    this.subtitleRoles = const {},
    this.onSubtitleRoleChanged,
    this.initialSubtitles = false,
  }) : super(key: key);

  @override
  State<TracksPanel> createState() => _TracksPanelState();
}

class _TracksPanelState extends State<TracksPanel> {
  late bool _subs = widget.initialSubtitles;
  late final Map<int, String> _roles = Map.from(widget.subtitleRoles);

  void _setRole(int index, String? role) {
    setState(() {
      if (role == null) {
        _roles.remove(index);
      } else {
        _roles[index] = role;
      }
    });
    widget.onSubtitleRoleChanged?.call(index, role);
  }

  Future<void> _showRoleMenu(BuildContext context, Offset position, int index) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        position & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      color: const Color(0xFF0E0A22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.borderDefault, width: 1.5),
      ),
      items: [
        PopupMenuItem<String>(
          value: 'Original',
          child: Text(
            'Original',
            style: TextStyle(
              color: _roles[index] == 'Original' ? AppColors.cyan300 : Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Translation',
          child: Text(
            'Translation',
            style: TextStyle(
              color: _roles[index] == 'Translation' ? AppColors.cyan300 : Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );

    if (result != null) {
      _setRole(index, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tracks = _subs ? widget.subtitleTracks : widget.audioTracks;
    final selected = _subs ? widget.selectedSubtitle : widget.selectedAudio;
    final onSelect = _subs ? widget.onSubtitleSelected : widget.onAudioSelected;

    return _GlassCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppColors.surfaceSubtle,
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: AppColors.borderDefault),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _Tab(
                    label: 'Audio',
                    count: widget.audioTracks.length,
                    on: !_subs,
                    onTap: () => setState(() => _subs = false),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: _Tab(
                    label: 'Subtitles',
                    count: widget.subtitleTracks.length,
                    on: _subs,
                    onTap: () => setState(() => _subs = true),
                  ),
                ),
              ],
            ),
          ),
          if (_subs) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.surfaceSubtle,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderDefault),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => setState(() => _isOriginalSub = true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _isOriginalSub ? AppColors.cyan300.withOpacity(0.2) : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: _isOriginalSub ? Border.all(color: AppColors.cyan300.withOpacity(0.5)) : null,
                        ),
                        child: Text(
                          'Original',
                          style: TextStyle(
                            color: _isOriginalSub ? AppColors.cyan300 : Colors.white.withOpacity(0.7),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => setState(() => _isOriginalSub = false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: !_isOriginalSub ? AppColors.cyan300.withOpacity(0.2) : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: !_isOriginalSub ? Border.all(color: AppColors.cyan300.withOpacity(0.5)) : null,
                        ),
                        child: Text(
                          'Translation',
                          style: TextStyle(
                            color: !_isOriginalSub ? AppColors.cyan300 : Colors.white.withOpacity(0.7),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (tracks.isEmpty)
            _EmptyState(
              icon: _subs ? Icons.subtitles : Icons.volume_down,
              title: _subs ? 'No subtitles' : 'No audio tracks',
              text: _subs
                  ? 'Subtitle tracks will appear here once a video is added.'
                  : 'Audio tracks will appear here once a video is added.',
            )
          else
            for (var i = 0; i < tracks.length; i++)
              Padding(
                padding: EdgeInsets.only(top: i == 0 ? 0 : 6),
                child: _subs
                    ? _SubtitleTrackRow(
                        title: tracks[i]['t'] ?? '',
                        language: tracks[i]['l'] ?? 'und',
                        role: _roles[i],
                        onSetRole: (pos) => _showRoleMenu(context, pos, i),
                        onCancelRole: () => _setRole(i, null),
                        selected: selected == i,
                        onTap: onSelect == null ? null : () => onSelect(i),
                      )
                    : _TrackRow(
                        icon: Icons.volume_down,
                        title: tracks[i]['t'] ?? '',
                        language: tracks[i]['l'] ?? 'und',
                        selected: selected == i,
                        onTap: onSelect == null ? null : () => onSelect(i),
                      ),
              ),
        ],
      ),
    );
  }

  bool _isOriginalSub = true;
}

class _Tab extends StatelessWidget {
  final String label;
  final int count;
  final bool on;
  final VoidCallback onTap;
  const _Tab({required this.label, required this.count, required this.on, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 38,
        decoration: BoxDecoration(
          color: on ? Colors.white.withOpacity(0.14) : Colors.transparent,
          borderRadius: BorderRadius.circular(99),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: on ? Colors.white : Colors.white.withOpacity(0.72),
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 7),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  color: on ? Colors.white : Colors.white.withOpacity(0.72),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubtitleTrackRow extends StatelessWidget {
  final String title;
  final String language;
  final String? role; // 'Original' | 'Translation'
  final Function(Offset globalPosition) onSetRole;
  final VoidCallback onCancelRole;
  final bool selected;
  final VoidCallback? onTap;

  const _SubtitleTrackRow({
    required this.title,
    required this.language,
    required this.role,
    required this.onSetRole,
    required this.onCancelRole,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mut = Colors.white.withOpacity(0.5);
    final hasRole = role != null;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected ? AppColors.cyan300.withOpacity(0.14) : AppColors.surfaceSubtle,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.borderHover : AppColors.borderDefault,
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)),
              child: Icon(Icons.subtitles, size: 16, color: selected ? AppColors.cyan300 : mut),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    language.toUpperCase(),
                    style: TextStyle(color: mut, fontSize: 11, height: 1.25, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            if (hasRole) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF0EA5E9)],
                  ),
                  borderRadius: BorderRadius.circular(99),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0EA5E9).withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTapDown: (details) {
                        onSetRole(details.globalPosition);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            role!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onCancelRole,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        child: const Center(
                          child: Icon(Icons.close_rounded, size: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (details) {
                  onSetRole(details.globalPosition);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(99),
                    border: Border.all(color: AppColors.borderDefault, width: 1.2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.add_rounded, size: 14, color: AppColors.cyan300),
                      SizedBox(width: 4),
                      Text(
                        'Set role',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

class _TrackRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String language;
  final bool selected;
  final VoidCallback? onTap;
  const _TrackRow({
    required this.icon,
    required this.title,
    required this.language,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mut = Colors.white.withOpacity(0.5);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selected ? AppColors.cyan300.withOpacity(0.14) : AppColors.surfaceSubtle,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.borderHover : AppColors.borderDefault,
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)),
              child: Icon(icon, size: 16, color: selected ? AppColors.cyan300 : mut),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    language.toUpperCase(),
                    style: TextStyle(color: mut, fontSize: 11, height: 1.25, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            if (selected) const Icon(Icons.check, size: 18, color: AppColors.cyan300),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  const _EmptyState({required this.icon, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    final mut = Colors.white.withOpacity(0.5);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 30, 12, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: CustomPaint(
              painter: _DashedCirclePainter(Colors.white.withOpacity(0.2)),
              child: Icon(icon, size: 22, color: mut),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: mut, fontSize: 12, height: 1.5, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  final Color color;
  _DashedCirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 1.3, dash = 4.0, gap = 3.0;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    final path = Path()
      ..addOval(Rect.fromLTWH(stroke / 2, stroke / 2, size.width - stroke, size.height - stroke));
    for (final m in path.computeMetrics()) {
      double d = 0;
      while (d < m.length) {
        canvas.drawPath(m.extractPath(d, d + dash), paint);
        d += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedCirclePainter old) => old.color != color;
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderDefault, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}
