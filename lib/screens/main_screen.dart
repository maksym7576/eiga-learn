import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../models/video_object.dart';
import '../providers/service_provider.dart';
import '../providers/thumbnail_service_provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _videoFile;
  String? _srtFile;

  Future<void> pickVideo() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      setState(() => _videoFile = result.files.single.path!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Select video: ${result.files.single.name}')),
      );
    }
  }

  Future<void> pickSrt() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['srt'],
    );
    if (result != null) {
      setState(() => _srtFile = result.files.single.path!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selected SRT: ${result.files.single.name}')),
      );
    }
  }

  Future<void> _addVideo() async {
    if (_videoFile == null || _srtFile == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please, select SRT file')));
    }

    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (_) => const Center(child: CircularProgressIndicator()),
    // );

    final name = _nameController.text.isEmpty
        ? _videoFile!.split('/').last
        : _nameController.text;

    final thumbnail = await ref
        .read(thumbnail_service_provider)
        .generateThumbnail(_videoFile!);

    if (thumbnail == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('fail to generate thumbnail')),
      );
    }

    final newVideo = video_object(
      name: name,
      videoPath: _videoFile!,
      srtPath: _srtFile!,
      createdAt: DateTime.now(),
      thumbnailPath: thumbnail,
    );

    await ref.read(videoServiceProvider.notifier).addVideo(newVideo);
    context.go(
      '/video',
      extra: {
        'videoPath': _videoFile!,
        'srtPath': _srtFile!,
      },
    );
    setState(() {
      _videoFile = null;
      _srtFile = null;
      _nameController.clear();
    });
  }

  Future<void> _showEditDialog(int index) async {
    final video = ref.read(videoServiceProvider)[index];
    final controller = TextEditingController(text: video.name);

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Name edit'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Select new name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                ref
                    .read(videoServiceProvider.notifier)
                    .updateVideo(index, controller.text);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final videoList = ref.watch(videoServiceProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90, left: 70, right: 70),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: "name (not required)",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: pickVideo,
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Add video"),
                  ),
                  FilledButton(
                    onPressed: pickSrt,
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Add SRT"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (_videoFile != null)
              ListTile(
                leading: const Icon(Icons.video_file, color: Colors.blue),
                title: Text(
                  _videoFile!.split('/').last,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                dense: true,
              ),
            if (_srtFile != null)
              ListTile(
                leading: const Icon(Icons.subtitles, color: Colors.green),
                title: Text(
                  _srtFile!.split('/').last,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                dense: true,
              ),

            FilledButton(
              onPressed: _addVideo,
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Next"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: videoList.isEmpty
                  ? const Center(child: Text("Empty list"))
                  : ListView.builder(
                      itemCount: videoList.length,
                      itemBuilder: (_, index) {
                        final video = videoList[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(video.name ?? 'Without name'),
                            subtitle: video.createdAt != null
                                ? Text(
                                    DateFormat(
                                      'yyyy-MM-dd – HH:mm',
                                    ).format(video.createdAt!),
                                  )
                                : const Text('Date not set'),
                            leading: video.thumbnailPath != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(video.thumbnailPath!),
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(
                                    Icons.video_library,
                                    size: 60,
                                    color: Colors.grey,
                                  ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.play_circle_fill,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                PopupMenuButton<String>(
                                  onSelected: (value) {
                                    if (value == 'edit')
                                      _showEditDialog(index);
                                    else if (value == 'delete') {
                                      ref
                                          .read(videoServiceProvider.notifier)
                                          .deleteVideo(index);
                                    }
                                  },
                                  itemBuilder: (_) => const [
                                    PopupMenuItem(
                                      value: 'edit',
                                      child: Text('Edit'),
                                    ),
                                    PopupMenuItem(
                                      value: 'delete',
                                      child: Text('Delete'),
                                    ),
                                  ],
                                  icon: const Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                            onTap: () {
                              context.go(
                                '/video',
                                extra: {
                                  'videoPath': video.videoPath,
                                  'srtPath': video.srtPath,
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
