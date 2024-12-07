import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';

class DifficultySelector extends StatelessWidget {
  final void Function(int) onChanged;
  final int selectedDifficulty;

  const DifficultySelector({
    super.key,
    required this.onChanged,
    this.selectedDifficulty = 3,
  });

  final List<(String, IconData)> _difficultyLevels = const [
    (
      LocaleKeys.challenge_details_reflection_difficulty_very_easy,
      Icons.local_fire_department_outlined
    ),
    (
      LocaleKeys.challenge_details_reflection_difficulty_easy,
      Icons.local_fire_department_outlined
    ),
    (
      LocaleKeys.challenge_details_reflection_difficulty_moderate,
      Icons.local_fire_department
    ),
    (
      LocaleKeys.challenge_details_reflection_difficulty_hard,
      Icons.local_fire_department
    ),
    (
      LocaleKeys.challenge_details_reflection_difficulty_very_hard,
      Icons.whatshot
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<int>(
      segments: _difficultyLevels.asMap().entries.map((entry) {
        return ButtonSegment<int>(
          value: entry.key + 1,
          label: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(entry.value.$2, size: 20),
              const SizedBox(height: 4),
              Text(
                entry.value.$1.tr().split(' ').last,
                style: const TextStyle(fontSize: 11),
              ),
            ],
          ),
        );
      }).toList(),
      selected: {selectedDifficulty},
      onSelectionChanged: (Set<int> newSelection) {
        onChanged(newSelection.first);
      },
      showSelectedIcon: false,
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }
}
