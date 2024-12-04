import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../common/presentation/widgets/drawer/app_drawer.dart';
import '../../../common/presentation/widgets/profile/circular_profile_image.dart';
import '../../../challenges/presentation/screens/generate_challenge_screen.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home';
  static const String path = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(userProfileProvider);
    final user = authState.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home.tr()),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Center(
              child: CircularProfileImage(
                imageUrl: user?.photoURL,
                size: 36,
              ),
            ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: authState.when(
          data: (user) => Text(user?.email ?? LocaleKeys.notLoggedIn.tr()),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('${LocaleKeys.error.tr()}: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(GenerateChallengeScreen.name),
        child: const Icon(Icons.add),
      ),
    );
  }
}
