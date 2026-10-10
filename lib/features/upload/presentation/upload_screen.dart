import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:eiga/shared/widgets/backgrounds/aurora_background.dart';
import 'package:eiga/shared/widgets/app_top_bar.dart';
import 'package:eiga/shared/widgets/primary_gradient_button.dart';
import 'package:eiga/shared/player/active_player_provider.dart';
import 'upload_step_provider.dart';
import 'sub_screens/upload_step_badge.dart';
import 'sub_screens/source_upload_sub_screen.dart';
import 'sub_screens/match_upload_sub_screen.dart';
import 'sub_screens/subtitles_upload_sub_screen.dart';
import 'sub_screens/finish_upload_sub_screen.dart';

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  ConsumerState<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  String? _sizeText;
  String? _details;
  List<Map<String, String>> _audioTracks = [];
  List<Map<String, String>> _subtitleTracks = [];
  int? _selectedAudio;
  int? _selectedSubtitle;

  @override
  void dispose() {
    ref.read(activePlayerProvider.notifier).clear();
    super.dispose();
  }

  Future<void> _pickVideo() async {
    final files = await FilePicker.pickFiles(type: FileType.video);

    if (files.isEmpty || files.first.path == null) return;

    final path = files.first.path!;
    final file = File(path);
    int bytes = 0;
    if (await file.exists()) {
      bytes = await file.length();
    }

    ref.read(activePlayerProvider.notifier).clear();
    await ref.read(activePlayerProvider.notifier).openVideo(path);

    setState(() {
      _sizeText = _fmtSize(bytes);
      _details = _sizeText;
      _audioTracks = [];
      _subtitleTracks = [];
      _selectedAudio = null;
      _selectedSubtitle = null;
    });
  }

  String _fmtSize(int b) {
    const u = ['B', 'KB', 'MB', 'GB'];
    var v = b.toDouble(), i = 0;
    while (v >= 1024 && i < u.length - 1) {
      v /= 1024;
      i++;
    }
    return '${v.toStringAsFixed(i == 0 ? 0 : 1)} ${u[i]}';
  }

  String _fmtDur(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    final s = d.inSeconds % 60;
    final mm = m.toString().padLeft(2, '0');
    final ss = s.toString().padLeft(2, '0');
    return h > 0 ? '$h:$mm:$ss' : '$mm:$ss';
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(activePlayerProvider);
    final videoPath = playerState.videoPath;
    final stepState = ref.watch(uploadStepProvider);
    final currentStep = stepState.currentStep;
    final maxReachedStep = stepState.maxReachedStep;

    final bool canProceed = currentStep > 0 || videoPath != null;

    return Scaffold(
      backgroundColor: const Color(0xFF09031A),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AuroraBackground(),
          SafeArea(
            child: Column(
              children: [
                const AppTopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            UploadStepBadge(
                              currentStep: currentStep,
                              maxReachedStep: maxReachedStep,
                              onStepTap: (step) {
                                if (step <= maxReachedStep) {
                                  ref.read(uploadStepProvider.notifier).setStep(step);
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            if (currentStep == 0)
                              SourceUploadSubScreen(
                                videoPath: videoPath,
                                onPickVideo: _pickVideo,
                                details: _details,
                                audioTracks: _audioTracks,
                                subtitleTracks: _subtitleTracks,
                                selectedAudio: _selectedAudio,
                                selectedSubtitle: _selectedSubtitle,
                                onAudioSelected: (i) {
                                  setState(() => _selectedAudio = i);
                                  ref.read(activePlayerProvider.notifier).setAudioTrack(i);
                                },
                                onSubtitleSelected: (i) {
                                  setState(() => _selectedSubtitle = i);
                                  ref.read(activePlayerProvider.notifier).setSubtitleTrack(i);
                                },
                                onTracksLoaded: (a, s) => setState(() {
                                  _audioTracks = a;
                                  _subtitleTracks = s;
                                }),
                                onMetaLoaded: (dur, w, h) => setState(() {
                                  final parts = <String>[
                                    if (w != null && h != null && w > 0 && h > 0) '$w×$h',
                                    _fmtDur(dur),
                                    ?_sizeText,
                                  ];
                                  _details = parts.join(' · ');
                                }),
                              )
                            else if (currentStep == 1)
                              const MatchUploadSubScreen()
                            else if (currentStep == 2)
                              const SubtitlesUploadSubScreen()
                            else
                              const FinishUploadSubScreen(),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: PrimaryGradientButton(
                                    text: 'Back',
                                    icon: Icons.arrow_back_rounded,
                                    isIconLeading: true,
                                    onPressed: currentStep > 0
                                        ? () => ref.read(uploadStepProvider.notifier).prevStep()
                                        : () {
                                            ref.read(activePlayerProvider.notifier).clear();
                                            ref.read(uploadStepProvider.notifier).reset();
                                            if (context.canPop()) {
                                              context.pop();
                                            } else {
                                              context.go('/main');
                                            }
                                          },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Opacity(
                                    opacity: canProceed ? 1.0 : 0.45,
                                    child: PrimaryGradientButton(
                                      text: currentStep == 3 ? 'Finish' : 'Next Step',
                                      icon: Icons.arrow_forward_rounded,
                                      isIconLeading: false,
                                      onPressed: !canProceed
                                          ? null
                                          : () {
                                              if (currentStep < 3) {
                                                ref.read(uploadStepProvider.notifier).nextStep();
                                              } else {
                                                ref.read(activePlayerProvider.notifier).clear();
                                                ref.read(uploadStepProvider.notifier).reset();
                                                context.go('/main');
                                              }
                                            },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
