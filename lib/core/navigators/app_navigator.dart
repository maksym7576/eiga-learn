import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppNavigator({Key? key, required this.navigationShell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
    );
  }
}

