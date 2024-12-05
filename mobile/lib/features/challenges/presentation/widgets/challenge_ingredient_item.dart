import 'package:flutter/material.dart';
import '../../domain/models/ingredient.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import 'ingredient_details_section.dart';

class ChallengeIngredientItem extends StatelessWidget {
  final Ingredient ingredient;
  final int index;

  const ChallengeIngredientItem({
    super.key,
    required this.ingredient,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
          IngredientDetailsSection(ingredient: ingredient),
        ],
      ),
    );
  }
}
