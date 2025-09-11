import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppNavigator extends HookConsumerWidget {
  final Widget child;

  const AppNavigator({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).matchedLocation;

    // Визначаємо поточний індекс на основі location
    int selectedIndex = 0;
    if (location == '/main') {
      selectedIndex = 0;
    } else if (location == '/vocabulary') {
      selectedIndex = 1;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/main');
              break;
            case 1:
              context.go('/vocabulary');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Player",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: "Clips",
          ),
        ],
      ),
    );
  }
}