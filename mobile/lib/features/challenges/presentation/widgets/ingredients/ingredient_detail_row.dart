import 'package:flutter/material.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/ingredient.dart';

class IngredientDetailRow extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientDetailRow({
    super.key,
    required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.sm,
        horizontal: Spacing.md,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ingredient.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                VGap.sm,
                if (ingredient.notes != null) ...[
                  Text(
                    ingredient.notes!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  VGap.sm,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
