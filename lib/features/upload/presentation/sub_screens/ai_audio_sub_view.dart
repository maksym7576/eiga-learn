import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/subtitles_upload_provider.dart';

class AiAudioSubView extends ConsumerWidget {
  const AiAudioSubView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(subtitlesUploadProvider);
    final notifier = ref.read(subtitlesUploadProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: const Color(0xFF67E8F9).withOpacity(0.08),
            border: Border.all(color: const Color(0xFF67E8F9).withOpacity(0.35), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF67E8F9).withOpacity(0.16),
                      border: Border.all(color: const Color(0xFF67E8F9).withOpacity(0.4)),
                    ),
                    child: const Icon(Icons.auto_awesome_rounded, size: 16, color: Color(0xFF67E8F9)),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'AI Transcription Ready',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Subtitles will be generated automatically from the video’s audio using the Whisper Neural Engine. Please keep the app open as this process may take a while.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withOpacity(0.7),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: state.isScanning
                    ? null
                    : () {
                        notifier.startAiScan();
                        Future.delayed(const Duration(milliseconds: 300), () => notifier.updateScanProgress(0.3));
                        Future.delayed(const Duration(milliseconds: 700), () => notifier.updateScanProgress(0.7));
                        Future.delayed(const Duration(milliseconds: 1100), () => notifier.updateScanProgress(1.0));
                      },
                icon: state.isScanning
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.auto_awesome_rounded, size: 16),
                label: Text(state.isScanning ? 'Generating Subtitles…' : 'Start AI Generation'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF67E8F9),
                  foregroundColor: const Color(0xFF04121A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
                  minimumSize: const Size.fromHeight(46),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
