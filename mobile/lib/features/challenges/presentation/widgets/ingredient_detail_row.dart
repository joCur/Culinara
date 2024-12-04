import 'package:flutter/material.dart';
import '../../../common/presentation/constants/ui_constants.dart';

class IngredientDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const IngredientDetailRow({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          size: IconSizes.sm,
          color: colorScheme.primary,
        ),
        HGap.xxs,
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
        ),
        HGap.xxs,
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
