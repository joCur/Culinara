import 'package:flutter/material.dart';
import '../../domain/models/ingredient.dart';
import '../../../common/presentation/constants/ui_constants.dart';

class IngredientDetailsSection extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientDetailsSection({
    super.key,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ingredient.diet.isNotEmpty) ...[
            Text(
              'Diät: ${ingredient.diet.join(", ")}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            VGap.xxs,
          ],
          Text(
            'Verfügbarkeit: ${ingredient.availability}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          VGap.xxs,
          if (ingredient.season.isNotEmpty)
            Text(
              'Saison: ${ingredient.season.join(", ")}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          if (ingredient.notes != null) ...[
            VGap.sm,
            Text(
              ingredient.notes!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}
