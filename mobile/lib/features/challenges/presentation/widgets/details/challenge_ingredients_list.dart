import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/ingredient.dart';

class ChallengeIngredientsList extends StatelessWidget {
  final List<Ingredient> ingredients;

  const ChallengeIngredientsList({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.challenge_ingredients.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        VGap.sm,
        ...ingredients.map(
          (ingredient) => Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.restaurant),
              ),
              title: Text(ingredient.name),
              subtitle:
                  ingredient.notes != null ? Text(ingredient.notes!) : null,
            ),
          ),
        ),
      ],
    );
  }
}
