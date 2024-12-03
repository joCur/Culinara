import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home';
  static const String path = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: LocaleKeys.profile.tr(),
            onPressed: () => context.pushNamed('profile'),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: LocaleKeys.logout.tr(),
            onPressed: () =>
                ref.read(authControllerProvider.notifier).signOut(),
          ),
        ],
      ),
      body: Center(
        child: authState.when(
          data: (user) => Text(user?.email ?? LocaleKeys.notLoggedIn.tr()),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('${LocaleKeys.error.tr()}: $error'),
        ),
      ),
    );
  }
}
