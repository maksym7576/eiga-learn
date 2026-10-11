import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/features/upload/domain/models/jimaku_metadata_models.dart';
import '../providers/subtitles_upload_provider.dart';

class ManualSubView extends ConsumerWidget {
  const ManualSubView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(subtitlesUploadProvider);
    final notifier = ref.read(subtitlesUploadProvider.notifier);

    if (state.isLoadingFiles) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.errorMessage != null) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.red.withOpacity(0.1),
          border: Border.all(color: Colors.red.withOpacity(0.3)),
        ),
        child: Text(
          state.errorMessage!,
          style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.7)),
          textAlign: TextAlign.center,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.cloud_outlined, size: 16, color: Color(0xFF67E8F9)),
            const SizedBox(width: 8),
            const Text(
              'Select from Community & Folders',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => notifier.fetchJimakuFiles(),
              icon: const Icon(Icons.refresh_rounded, size: 16, color: Color(0xFF67E8F9)),
              tooltip: 'Refresh files',
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (state.files.isEmpty)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.black.withOpacity(0.2),
              border: Border.all(color: Colors.white.withOpacity(0.16), width: 1.5),
            ),
            child: Text(
              'No files found on Jimaku for this entry',
              style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.5)),
              textAlign: TextAlign.center,
            ),
          )
        else
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 450),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: state.files.length,
              separatorBuilder: (_, __) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                final item = state.files[index];
                if (item.isGroup) {
                  return _CloudGroupTile(
                    group: item.group!,
                    onTap: () => notifier.toggleGroup(item.group!.name),
                  );
                } else {
                  final file = item.file!;
                  final isActive = state.selectedFile == file.name;
                  final bool isSubItem = state.expandedGroups.any((g) => file.name.contains(g));

                  return _CloudFileTile(
                    file: file,
                    isActive: isActive,
                    onTap: () => notifier.selectFile(file.name),
                    isSubItem: isSubItem,
                  );
                }
              },
            ),
          ),
      ],
    );
  }
}

class _CloudGroupTile extends StatelessWidget {
  final JimakuGroup group;
  final VoidCallback onTap;

  const _CloudGroupTile({required this.group, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isExpanded = group.isExpanded;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: isExpanded
                ? const Color(0xFF67E8F9).withOpacity(0.08)
                : Colors.white.withOpacity(0.04),
            borderRadius: isExpanded
                ? const BorderRadius.vertical(top: Radius.circular(12))
                : BorderRadius.circular(12),
            border: Border.all(
              color: isExpanded ? const Color(0xFF67E8F9).withOpacity(0.3) : Colors.white.withOpacity(0.16),
              width: 0.8,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                isExpanded ? Icons.folder_open_rounded : Icons.folder_rounded,
                color: const Color(0xFF67E8F9),
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    group.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.35,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Icon(
                  isExpanded ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                  color: isExpanded ? const Color(0xFF67E8F9) : Colors.white54,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CloudFileTile extends StatelessWidget {
  final FileJimakuDTO file;
  final bool isActive;
  final VoidCallback onTap;
  final bool isSubItem;

  const _CloudFileTile({
    required this.file,
    required this.isActive,
    required this.onTap,
    this.isSubItem = false,
  });

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) return '${(difference.inDays / 365).floor()}y ago';
    if (difference.inDays > 30) return '${(difference.inDays / 30).floor()}mo ago';
    if (difference.inDays > 0) return '${difference.inDays}d ago';
    if (difference.inHours > 0) return '${difference.inHours}h ago';
    return 'Just now';
  }

  @override
  Widget build(BuildContext context) {
    final ext = file.name.split('.').last.toUpperCase();

    return Padding(
      padding: EdgeInsets.only(
        left: isSubItem ? 16 : 0,
        right: 0,
        top: 0,
        bottom: isSubItem ? 2 : 0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: isSubItem
                ? Border(left: BorderSide(color: const Color(0xFF67E8F9).withOpacity(0.3), width: 2))
                : null,
          ),
          padding: EdgeInsets.only(left: isSubItem ? 12 : 0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF67E8F9).withOpacity(0.08)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isActive ? const Color(0xFF67E8F9) : Colors.white.withOpacity(0.16),
                width: 0.5,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Icon(
                    Icons.description_rounded,
                    size: isSubItem ? 18 : 20,
                    color: isActive ? const Color(0xFF67E8F9) : Colors.white.withOpacity(0.6),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.name,
                        style: TextStyle(
                          fontSize: isSubItem ? 13 : 14,
                          fontWeight: FontWeight.w500,
                          color: isActive ? const Color(0xFF67E8F9) : Colors.white,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${_formatSize(file.size)} · ${_formatDate(file.lastModified)}',
                        style: TextStyle(
                          fontSize: isSubItem ? 11 : 12,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF67E8F9).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    ext,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF67E8F9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
