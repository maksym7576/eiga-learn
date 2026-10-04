import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppNavigator({Key? key, required this.navigationShell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Main'),
          NavigationDestination(icon: Icon(Icons.cloud_upload), label: 'Upload'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
