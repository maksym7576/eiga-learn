import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import 'core/navigators/app_router.dart';
import 'core/utils/fps_monitor.dart';
import 'data/repositories/language_profile_repository.dart';
import 'data/repositories/video_repository.dart';
import 'data/repositories/job_repository.dart';
import 'data/repositories/phrase_repository.dart';
import 'data/repositories/ai_model_repository.dart';
import 'database/seeds/video_seed.dart';
import 'database/seeds/pipeline_seed.dart';
import 'database/seeds/ai_model_seed.dart';
import 'services/database/isar_service.dart';
import 'shared/widgets/ai_error_overlay.dart';
import 'shared/widgets/global_hint_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  fpsMonitor.enable();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1280, 800),
      center: true,
      backgroundColor: Color(0xFF09031A),
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.maximize();
      await windowManager.show();
      await windowManager.focus();
    });
  }

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  
  final metaIsar = await DatabaseService.openIsar(name: 'meta');
  
  // Seed standard AI models in metaIsar
  final aiModelRepo = AiModelRepository(metaIsar);
  await AiModelSeed.seedIfEmpty(aiModelRepo);

  final repo = LanguageProfileRepository(metaIsar);
  final allProfiles = await repo.getAll();
  final activeProfile = allProfiles.where((p) => p.isActive).firstOrNull;
  final dbName = activeProfile?.dbName ?? 'default';
  final isar = await DatabaseService.openIsar(name: dbName);

  final videoRepo = VideoRepository(isar);
  await VideoSeed.seedIfEmpty(videoRepo);
  final videos = await videoRepo.getAll();
  if (videos.isNotEmpty) {
    final jobRepo = JobRepository(isar);
    final phraseRepo = PhraseRepository(isar);
    await PipelineSeed.seedIfEmpty(jobRepo, phraseRepo, videos.first.id);
  }

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        metaIsarProvider.overrideWithValue(metaIsar),
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(videoApiServerProvider);
    ref.watch(syncDevicesProvider);

    return MaterialApp.router(
      title: 'Eiga',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
      builder: (context, child) {
        return GlobalHintOverlay(
          child: AiErrorOverlay(child: child ?? const SizedBox.shrink()),
        );
      },
    );
  }
}
