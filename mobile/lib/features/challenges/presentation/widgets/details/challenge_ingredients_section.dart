import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/ingredient.dart';

class ChallengeIngredientsSection extends StatelessWidget {
  final List<Ingredient> ingredients;

  const ChallengeIngredientsSection({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.challenge_ingredients.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            VGap.md,
            ...ingredients.map((ingredient) => Padding(
                  padding: const EdgeInsets.only(bottom: Spacing.sm),
                  child: _IngredientItem(ingredient: ingredient),
                )),
          ],
        ),
      ),
    );
  }
}

class _IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const _IngredientItem({required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredient.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        if (ingredient.notes != null) ...[
          VGap.xxs,
          Text(
            ingredient.notes!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ],
    );
  }
}
