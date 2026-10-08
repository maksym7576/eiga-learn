import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_navigator.dart';
import '../../features/main/presentation/main_screen.dart';
import '../../features/upload/presentation/upload_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/player/presentation/video_screen.dart';
import '../../features/vocabulary/presentation/full_vocabulary_screen.dart';
import '../../features/startup/presentation/startup_screen.dart';
import '../../features/main/presentation/sub_screens/library_sub_screen.dart';
import '../../features/main/presentation/sub_screens/vocabulary_cards_sub_screen.dart';

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
    // Top-level routes / subscreens
    GoRoute(
      path: '/library',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const LibrarySubScreen(),
    ),
    GoRoute(
      path: '/vocabulary-cards',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const VocabularyCardsSubScreen(),
    ),
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
  ],
);
