import 'package:flutter/material.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/challenge.dart';
import 'ingredient_list_tile.dart';

class ChallengeIngredientsList extends StatelessWidget {
  final Challenge challenge;

  const ChallengeIngredientsList({
    super.key,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: challenge.ingredients.length,
      separatorBuilder: (_, __) => VGap.xs,
      itemBuilder: (context, index) {
        final ingredient = challenge.ingredients[index];
        return IngredientListTile(ingredient: ingredient);
      },
    );
  }
}
