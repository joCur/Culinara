import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import '../../../common/presentation/widgets/gradient_background.dart';
import '../controllers/auth_controller.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/display_name_card.dart';
import '../widgets/profile/password_change_card.dart';

class ProfileScreen extends ConsumerWidget {
  static const String name = 'profile';
  static const String path = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final user = authState.value;
    final displayNameController =
        TextEditingController(text: user?.displayName);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.profile.tr()),
      ),
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(email: user?.email ?? ''),
                VGap.xl,
                Text(
                  LocaleKeys.profileSettings.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                VGap.lg,
                DisplayNameCard(controller: displayNameController),
                VGap.lg,
                const PasswordChangeCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
