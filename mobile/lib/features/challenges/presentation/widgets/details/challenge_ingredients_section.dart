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
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.restaurant_menu,
              size: 24,
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
        ...ingredients
            .map((ingredient) => _IngredientCard(ingredient: ingredient)),
      ],
    );
  }
}

class _IngredientCard extends StatelessWidget {
  final Ingredient ingredient;

  const _IngredientCard({required this.ingredient});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sm),
      child: Card(
        elevation: 0,
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: colorScheme.outlineVariant,
            width: 1,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Spacing.md,
            vertical: Spacing.sm,
          ),
          title: Text(
            ingredient.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: ingredient.notes != null
              ? Padding(
                  padding: const EdgeInsets.only(top: Spacing.xs),
                  child: Text(ingredient.notes!),
                )
              : null,
        ),
      ),
    );
  }
}
