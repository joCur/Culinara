import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';

class ChallengeInitialView extends StatelessWidget {
  const ChallengeInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.restaurant_menu,
          size: IconSizes.xxl,
          color: colorScheme.primary,
        ),
        VGap.sm,
        Text(
          LocaleKeys.challenge_ready.tr(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
              ),
          textAlign: TextAlign.center,
        ),
        VGap.xxs,
        Text(
          LocaleKeys.challenge_description.tr(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
