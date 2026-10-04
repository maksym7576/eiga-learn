import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import 'core/navigators/app_router.dart';
import 'core/utils/fps_monitor.dart';
import 'services/database/isar_service.dart';
import 'shared/widgets/ai_error_overlay.dart';
import 'shared/widgets/global_hint_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

  // Enable Performance & FPS Monitor (logs FPS and jank stats to terminal every second)
  fpsMonitor.enable();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1280, 800),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.maximize(); // Maximized on startup
      await windowManager.show();
      await windowManager.focus();
    });
  }

  // Set system UI to visible by default
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // Default for light theme
  ));
  
  // Initialize Isar and Seeding
  final isar = await DatabaseService.openIsar();

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
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
