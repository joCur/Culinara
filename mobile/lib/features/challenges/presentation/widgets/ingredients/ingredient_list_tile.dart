import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../domain/models/ingredient.dart';

class IngredientListTile extends StatefulWidget {
  final Ingredient ingredient;

  const IngredientListTile({
    super.key,
    required this.ingredient,
  });

  @override
  State<IngredientListTile> createState() => _IngredientListTileState();
}

class _IngredientListTileState extends State<IngredientListTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Icon(
                Icons.restaurant,
                color: theme.colorScheme.primary,
              ),
            ),
            title: Text(widget.ingredient.name),
            subtitle: Text(
              widget.ingredient.category,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
            trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  _buildDetailRow(
                    context,
                    Icons.store,
                    LocaleKeys.challenge_ingredient_details_availability.tr(),
                    widget.ingredient.availability,
                  ),
                  if (widget.ingredient.season.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      context,
                      Icons.calendar_today,
                      LocaleKeys.challenge_ingredient_details_season.tr(),
                      widget.ingredient.season,
                    ),
                  ],
                  if (widget.ingredient.diet.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      context,
                      Icons.restaurant_menu,
                      LocaleKeys.challenge_ingredient_details_diet.tr(),
                      widget.ingredient.diet,
                    ),
                  ],
                  if (widget.ingredient.notes != null) ...[
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      context,
                      Icons.notes,
                      LocaleKeys.challenge_ingredient_details_notes.tr(),
                      widget.ingredient.notes!,
                    ),
                  ],
                ],
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String label,
    dynamic value,
  ) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        if (value is List) ...[
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: value
                .map((item) => Chip(
                      label: Text(
                        item,
                        style: theme.textTheme.bodySmall,
                      ),
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    ))
                .toList(),
          ),
        ] else
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              value.toString(),
              style: theme.textTheme.bodyMedium,
            ),
          ),
      ],
    );
  }
}
