import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../common/presentation/widgets/drawer/app_drawer.dart';
import '../../../common/presentation/widgets/profile/circular_profile_image.dart';
import '../../../common/presentation/widgets/gradient_background.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import '../../../challenges/presentation/widgets/home/active_challenges_list.dart';

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProfileImage(
                imageUrl: user?.photoURL,
                size: 36,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: GradientBackground(
        child: authState.when(
          data: (user) => _buildHomeContent(context, user),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Text('${LocaleKeys.error.tr()}: $error'),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeContent(BuildContext context, user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Willkommenssektion
          Card(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.md),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${LocaleKeys.welcome.tr()}, ${user?.displayName ?? LocaleKeys.guest.tr()}!',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  VGap.sm,
                  Text(
                    LocaleKeys.todayMotivation.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          VGap.lg,

          // Statistik-Karten
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  Icons.emoji_events_outlined,
                  '0',
                  LocaleKeys.completedChallenges.tr(),
                ),
              ),
              HGap.md,
              Expanded(
                child: _buildStatCard(
                  context,
                  Icons.trending_up_outlined,
                  '0',
                  LocaleKeys.activeStreak.tr(),
                ),
              ),
            ],
          ),
          VGap.lg,

          // Aktuelle Challenges Sektion
          Text(
            LocaleKeys.currentChallenges.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          VGap.md,
          const ActiveChallengesList(),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 32),
              VGap.sm,
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
