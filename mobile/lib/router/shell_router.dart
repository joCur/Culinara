import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<NavigationDestination> navigationDestinations = [
  const NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home),
    label: 'Home',
  ),
  const NavigationDestination(
    icon: Icon(Icons.history_outlined),
    selectedIcon: Icon(Icons.history),
    label: 'History',
  ),
];

class ShellRouter extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ShellRouter({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: navigationDestinations,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
