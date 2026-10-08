import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';

class AudioCard extends StatefulWidget {
  const AudioCard({
    super.key,
    required this.fileName,
    required this.status,
    required this.progress,
    required this.durationFormatted,
    required this.detectedCount,
    required this.totalCount,
    required this.stages,
    required this.chunks,
    required this.logs,
    this.onRetry,
    this.onCancel,
  });

  final String fileName;
  final String status;
  final double progress;
  final String durationFormatted;
  final int detectedCount;
  final int totalCount;
  final List<AudioStageInfo> stages;
  final List<AudioChunkInfo> chunks;
  final List<AudioLogItem> logs;
  final VoidCallback? onRetry;
  final VoidCallback? onCancel;

  @override
  State<AudioCard> createState() => _AudioCardState();
}

class AudioStageInfo {
  AudioStageInfo({
    required this.id,
    required this.name,
    required this.modelName,
    required this.status,
    this.processed = 0,
    this.total = 100,
    this.errorMessage,
  });

  final String id;
  final String name;
  final String modelName;
  final String status;
  final int processed;
  final int total;
  final String? errorMessage;
}

class AudioChunkInfo {
  AudioChunkInfo({
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  final double startTime;
  final double endTime;
  final String status;
}

class AudioLogItem {
  AudioLogItem({
    required this.timestamp,
    required this.level,
    required this.message,
  });

  final String timestamp;
  final String level;
  final String message;
}

class _AudioCardState extends State<AudioCard> {
  bool _isExpanded = false;

  Color _getStatusColor() {
    switch (widget.status) {
      case 'completed':
      case 'success':
        return AppColors.emerald300;
      case 'failed':
      case 'error':
        return AppColors.rose500;
      case 'processing':
      case 'running':
        return AppColors.cyanLight;
      default:
        return AppColors.slate300;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor();
    final percentage = (widget.progress * 100).clamp(0, 100).toInt();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.22), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(statusColor, percentage),
          _buildExpandedDetails(),
        ],
      ),
    );
  }

  Widget _buildHeader(Color statusColor, int percentage) {
    return InkWell(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      borderRadius: BorderRadius.circular(22),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: statusColor.withOpacity(0.2),
                  ),
                  child: Icon(
                    widget.status == 'completed' || widget.status == 'success'
                        ? Icons.check
                        : widget.status == 'failed' || widget.status == 'error'
                            ? Icons.priority_high
                            : Icons.mic,
                    size: 14,
                    color: statusColor,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.fileName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.03,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFa78bfa).withOpacity(0.16),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFa78bfa).withOpacity(0.5)),
                  ),
                  child: const Text(
                    'AUDIO',
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFc4b5fd),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  widget.status == 'queued' ? '—' : '$percentage%',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: statusColor,
                  ),
                ),
                if (widget.status == 'failed' || widget.status == 'error') ...[
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.refresh, size: 16, color: AppColors.rose500),
                    onPressed: widget.onRetry,
                    tooltip: 'Retry',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
                const SizedBox(width: 8),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 250),
                  child: const Icon(Icons.expand_more, color: AppColors.white60, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildSegmentedProgressBar(),
            const SizedBox(height: 8),
            _buildSummaryLine(),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentedProgressBar() {
    return Row(
      children: widget.stages.map((stage) {
        Color barColor;
        if (stage.status == 'done') {
          barColor = AppColors.emerald300;
        } else if (stage.status == 'running') {
          barColor = AppColors.cyanLight;
        } else if (stage.status == 'error') {
          barColor = AppColors.rose500;
        } else {
          barColor = Colors.white10;
        }
        return Expanded(
          child: Container(
            height: 5,
            margin: const EdgeInsets.symmetric(horizontal: 1.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.white10,
            ),
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: stage.status == 'done'
                  ? 1.0
                  : stage.status == 'running'
                      ? (stage.processed / stage.total)
                      : 0.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: barColor,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSummaryLine() {
    return Row(
      children: [
        const Icon(Icons.mic, size: 13, color: AppColors.cyanLight),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            widget.status == 'completed'
                ? 'All stages completed'
                : widget.status == 'queued'
                    ? 'In queue'
                    : '${widget.stages.firstWhere((s) => s.status == 'running', orElse: () => widget.stages.first).name} · ${widget.stages.firstWhere((s) => s.status == 'running', orElse: () => widget.stages.first).modelName} (${widget.detectedCount}/${widget.totalCount} detected)',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.white60,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedDetails() {
    return AnimatedCrossFade(
      firstChild: const SizedBox.shrink(),
      secondChild: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(color: Colors.white12),
            const SizedBox(height: 12),
            _buildTimelineSection(),
            const SizedBox(height: 16),
            _buildStagesList(),
            const SizedBox(height: 12),
            _buildLogsSection(),
          ],
        ),
      ),
      crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 250),
    );
  }

  Widget _buildTimelineSection() {
    final isFull = widget.detectedCount == widget.totalCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sync Timeline Map', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.white)),
            Text(
              '${widget.detectedCount} / ${widget.totalCount} detected',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: isFull ? AppColors.emerald300 : const Color(0xFFfcd34d)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildTimelineTrackBar(),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('00:00', style: TextStyle(fontSize: 10, color: AppColors.white60, fontFamily: 'monospace')),
            Text(widget.durationFormatted, style: const TextStyle(fontSize: 10, color: AppColors.white60, fontFamily: 'monospace')),
          ],
        ),
        const SizedBox(height: 6),
        _buildLegend(),
      ],
    );
  }

  Widget _buildTimelineTrackBar() {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        color: const Color(0xFF38bdf8).withOpacity(0.14),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF38bdf8).withOpacity(0.28)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: widget.chunks.map((chunk) {
              Color chunkColor;
              switch (chunk.status) {
                case 'aligned':
                  chunkColor = AppColors.emerald300;
                  break;
                case 'detected':
                  chunkColor = AppColors.cyanLight;
                  break;
                case 'warning':
                  chunkColor = const Color(0xFFfcd34d);
                  break;
                case 'error':
                  chunkColor = AppColors.rose500;
                  break;
                default:
                  chunkColor = Colors.white12;
              }
              final leftPx = (chunk.startTime / 100) * constraints.maxWidth;
              final widthPx = ((chunk.endTime - chunk.startTime) / 100) * constraints.maxWidth;
              return Positioned(
                left: leftPx,
                width: widthPx.clamp(3.0, constraints.maxWidth),
                top: 3,
                bottom: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: chunkColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _buildLegend() {
    return Wrap(
      spacing: 10,
      children: [
        _buildLegendItem('aligned', AppColors.emerald300),
        _buildLegendItem('detected', AppColors.cyanLight),
        _buildLegendItem('warning', const Color(0xFFfcd34d)),
        _buildLegendItem('error', AppColors.rose500),
        _buildLegendItem('pending', Colors.white38),
      ],
    );
  }

  Widget _buildStagesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widget.stages.asMap().entries.map((entry) {
        final index = entry.key;
        final stage = entry.value;
        final isLast = index == widget.stages.length - 1;

        Color nodeColor;
        IconData? nodeIcon;
        if (stage.status == 'done') {
          nodeColor = AppColors.emerald300;
          nodeIcon = Icons.check;
        } else if (stage.status == 'error') {
          nodeColor = AppColors.rose500;
          nodeIcon = Icons.priority_high;
        } else if (stage.status == 'running') {
          nodeColor = AppColors.cyanLight;
          nodeIcon = Icons.mic;
        } else {
          nodeColor = AppColors.white60;
          nodeIcon = Icons.mic;
        }

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: stage.status == 'done'
                          ? AppColors.emerald300.withOpacity(0.2)
                          : stage.status == 'running'
                              ? AppColors.cyanLight.withOpacity(0.14)
                              : stage.status == 'error'
                                  ? AppColors.rose500.withOpacity(0.17)
                                  : Colors.white.withOpacity(0.05),
                      border: Border.all(
                        color: stage.status == 'running'
                            ? AppColors.cyanLight
                            : stage.status == 'error'
                                ? AppColors.rose500
                                : Colors.white12,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Icon(nodeIcon, size: 14, color: nodeColor),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: stage.status == 'done' ? AppColors.emerald300 : Colors.white12,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            stage.name,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: stage.status == 'pending' ? AppColors.white60 : Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            stage.status == 'done'
                                ? 'Готово'
                                : stage.status == 'running'
                                    ? '${(stage.processed / stage.total * 100).toInt()}%'
                                    : stage.status == 'error'
                                        ? 'Помилка'
                                        : 'Очікує',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: stage.status == 'done'
                                  ? AppColors.emerald300
                                  : stage.status == 'running'
                                      ? AppColors.cyanLight
                                      : stage.status == 'error'
                                          ? AppColors.rose500
                                          : AppColors.white60,
                            ),
                          ),
                        ],
                      ),
                      if (stage.status != 'pending') ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            stage.modelName,
                            style: const TextStyle(fontFamily: 'monospace', fontSize: 10.5, color: Colors.white70),
                          ),
                        ),
                      ],
                      if (stage.errorMessage != null) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.rose500.withOpacity(0.16),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.rose500.withOpacity(0.3)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stage.errorMessage!,
                                style: const TextStyle(fontSize: 11.5, color: Color(0xFFfecdd3)),
                              ),
                              if (widget.onRetry != null) ...[
                                const SizedBox(height: 8),
                                ElevatedButton.icon(
                                  onPressed: widget.onRetry,
                                  icon: const Icon(Icons.refresh, size: 12),
                                  label: const Text('Повторити етап', style: TextStyle(fontSize: 11)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white10,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLogsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Local AI Quality Judge', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.white)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: widget.status == 'completed' ? AppColors.emerald300.withOpacity(0.2) : AppColors.cyanLight.withOpacity(0.14),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.status == 'completed' ? 'Completed (20/20)' : 'Processing (14/20)',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: widget.status == 'completed' ? AppColors.emerald300 : AppColors.cyanLight,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          constraints: const BoxConstraints(maxHeight: 132),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.28),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          child: ListView(
            shrinkWrap: true,
            children: widget.logs.map((log) {
              Color dotColor;
              switch (log.level) {
                case 'ok':
                  dotColor = AppColors.emerald300;
                  break;
                case 'info':
                  dotColor = AppColors.cyanLight;
                  break;
                case 'warn':
                  dotColor = const Color(0xFFfcd34d);
                  break;
                case 'err':
                  dotColor = AppColors.rose500;
                  break;
                default:
                  dotColor = AppColors.white60;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('[${log.timestamp}]', style: const TextStyle(fontSize: 11, color: AppColors.white60, fontFamily: 'monospace')),
                    const SizedBox(width: 8),
                    Container(width: 6, height: 6, decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        log.message,
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'monospace',
                          color: log.level == 'err'
                              ? const Color(0xFFfecdd3)
                              : log.level == 'warn'
                                  ? const Color(0xFFfde68a)
                                  : Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: color)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: AppColors.white60)),
      ],
    );
  }
}
