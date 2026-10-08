import 'package:flutter/material.dart';
import 'package:eiga/core/theme/app_colors.dart';

class PipelineJobCard extends StatefulWidget {
  const PipelineJobCard({
    super.key,
    required this.jobId,
    required this.phase,
    required this.status,
    required this.progress,
    required this.phraseRange,
    required this.attempt,
    required this.stages,
    this.errorMessage,
    this.onCancel,
    this.onRetry,
  });

  final int jobId;
  final String phase;
  final String status;
  final double progress;
  final String phraseRange;
  final int attempt;
  final List<PipelineStageInfo> stages;
  final String? errorMessage;
  final VoidCallback? onCancel;
  final VoidCallback? onRetry;

  @override
  State<PipelineJobCard> createState() => _PipelineJobCardState();
}

class PipelineStageInfo {
  PipelineStageInfo({
    required this.id,
    required this.name,
    required this.status,
    this.modelName,
    this.mode = 'full',
    this.processed = 0,
    this.total = 40,
    this.errorMessage,
  });

  final String id;
  final String name;
  final String status;
  final String? modelName;
  final String mode;
  final int processed;
  final int total;
  final String? errorMessage;
}

class _PipelineJobCardState extends State<PipelineJobCard> {
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
                            : Icons.circle,
                    size: 14,
                    color: statusColor,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.phraseRange,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.cyanLight.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.cyanLight.withOpacity(0.45)),
                  ),
                  child: Text(
                    widget.phase.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cyanLight,
                    ),
                  ),
                ),
                if (widget.attempt > 1) ...[
                  const SizedBox(width: 6),
                  Text(
                    '×${widget.attempt}',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white60,
                    ),
                  ),
                ],
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
    return Text(
      widget.status == 'completed'
          ? 'All stages completed'
          : widget.status == 'queued'
              ? 'In queue · waiting to start'
              : '${widget.phase} · ${widget.stages.where((s) => s.status == 'running').map((s) => s.modelName).whereType<String>().join(', ')}',
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.white60,
      ),
      overflow: TextOverflow.ellipsis,
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
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.stages.firstOrNull?.total ?? 3} phrases · attempt #${widget.attempt}',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.white60),
                ),
                if (widget.status == 'processing' || widget.status == 'running')
                  TextButton.icon(
                    onPressed: widget.onCancel,
                    icon: const Icon(Icons.close, size: 12, color: Colors.white),
                    label: const Text('Cancel', style: TextStyle(fontSize: 11, color: Colors.white)),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white10,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            _buildStagesList(),
          ],
        ),
      ),
      crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 250),
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
          nodeIcon = Icons.circle;
        } else {
          nodeColor = AppColors.white60;
          nodeIcon = null;
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
                    child: nodeIcon != null
                        ? Icon(nodeIcon, size: 14, color: nodeColor)
                        : Text(
                            '${index + 1}',
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.white60),
                          ),
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
                                ? 'Done'
                                : stage.status == 'running'
                                    ? '${stage.processed}/${stage.total}'
                                    : stage.status == 'error'
                                        ? 'Error'
                                        : 'Pending',
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
                      if (stage.status != 'pending' && stage.modelName != null) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            stage.modelName!,
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
                                  label: const Text('Retry with another model', style: TextStyle(fontSize: 11)),
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
}
