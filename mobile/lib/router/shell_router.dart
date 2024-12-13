import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../generated/locale_keys.g.dart';

final List<NavigationDestination> navigationDestinations = [
  NavigationDestination(
    icon: const Icon(Icons.home_outlined),
    selectedIcon: const Icon(Icons.home),
    label: LocaleKeys.navigation_home.tr(),
  ),
  NavigationDestination(
    icon: const Icon(Icons.history_outlined),
    selectedIcon: const Icon(Icons.history),
    label: LocaleKeys.navigation_history.tr(),
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
