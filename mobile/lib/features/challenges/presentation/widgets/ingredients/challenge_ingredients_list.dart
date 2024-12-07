import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/ingredient.dart';
import 'ingredient_list_tile.dart';

class ChallengeIngredientsList extends StatelessWidget {
  final List<Ingredient> ingredients;

  const ChallengeIngredientsList({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.challenge_ingredients.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          VGap.sm,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ingredients.length,
            separatorBuilder: (_, __) => VGap.xs,
            itemBuilder: (context, index) =>
                IngredientListTile(ingredient: ingredients[index]),
          ),
        ],
      ),
    );
  }
}
