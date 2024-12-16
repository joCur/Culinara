import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/challenge.dart';
import '../ingredients/challenge_ingredients_list.dart';

class ChallengeIngredientsSection extends StatelessWidget {
  final Challenge challenge;

  const ChallengeIngredientsSection({
    super.key,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.restaurant_menu,
              size: IconSizes.md,
              color: colorScheme.primary,
            ),
            HGap.sm,
            Text(
              LocaleKeys.challenge_ingredients.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        VGap.md,
        ChallengeIngredientsList(challenge: challenge),
      ],
    );
  }
}
