import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../domain/models/ingredient.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import 'challenge_ingredient_item.dart';

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
            itemBuilder: (context, index) => ChallengeIngredientItem(
              ingredient: ingredients[index],
              index: index,
            ),
          ),
        ),
      ],
    );
  }
}
