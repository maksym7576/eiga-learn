import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_navigator.dart';
import '../../features/main/presentation/main_screen.dart';
import '../../features/upload/presentation/upload_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/player/presentation/video_screen.dart';
import '../../features/vocabulary/presentation/full_vocabulary_screen.dart';
import '../../features/library/presentation/library_screen.dart';
import '../../features/startup/presentation/startup_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartupScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppNavigator(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/main',
              builder: (context, state) => const MainScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/upload',
              builder: (context, state) => const UploadScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),
    // Player is top-level to hide navigation shell completely
    GoRoute(
      path: '/player',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const VideoScreen(),
    ),
    GoRoute(
      path: '/vocabulary',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const FullVocabularyScreen(),
    ),
    GoRoute(
      path: '/library',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const LibraryScreen(),
    ),
  ],
);
