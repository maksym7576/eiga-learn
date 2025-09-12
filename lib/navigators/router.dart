// router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nihongona/navigators/app_navigator.dart';
import 'package:nihongona/screens/main_screen.dart';
import 'package:nihongona/screens/vocabulary_screen.dart';
import 'package:nihongona/screens/video_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/main',
  routes: [
    // Shell route для BottomNavigationBar
    ShellRoute(
      builder: (context, state, child) {
        return AppNavigator(child: child);
      },
      routes: [
        GoRoute(
          path: '/main',
          builder: (context, state) => const MainScreen(),
        ),
        GoRoute(
          path: '/vocabulary',
          builder: (context, state) => const vocabulary_screen(),
        ),
      ],
    ),
    // Окремий роут для відео (без bottom bar)
    GoRoute(
      path: '/video',
      builder: (context, state) => const VideoScreen(),
    ),
  ],
);