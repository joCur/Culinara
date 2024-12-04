import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../domain/models/ingredient.dart';
import 'ingredient_detail_row.dart';
import '../../../common/presentation/constants/ui_constants.dart';

class ChallengeIngredientsList extends StatelessWidget {
  final List<Ingredient> ingredients;

  const ChallengeIngredientsList({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.challenge_ingredients.tr(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
              ),
        ),
        VGap.sm,
        Expanded(
          child: ListView.builder(
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(
                  vertical: Spacing.xxs / 2,
                  horizontal: 0,
                ),
                child: ExpansionTile(
                  leading: CircleAvatar(
                    backgroundColor: colorScheme.primaryContainer,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: colorScheme.onPrimaryContainer),
                    ),
                  ),
                  title: Text(
                    ingredient.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    ingredient.category,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.secondary,
                        ),
                  ),
                  trailing: Icon(
                    Icons.expand_more,
                    color: colorScheme.primary,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Spacing.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (ingredient.diet.isNotEmpty) ...[
                            IngredientDetailRow(
                              label: LocaleKeys.challenge_diet.tr(),
                              value: ingredient.diet.join(', '),
                              icon: Icons.restaurant,
                            ),
                            VGap.xxs,
                          ],
                          IngredientDetailRow(
                            label: LocaleKeys.challenge_availability.tr(),
                            value: ingredient.availability,
                            icon: Icons.event_available,
                          ),
                          VGap.xxs,
                          if (ingredient.season.isNotEmpty)
                            IngredientDetailRow(
                              label: LocaleKeys.challenge_season.tr(),
                              value: ingredient.season.join(', '),
                              icon: Icons.calendar_today,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
