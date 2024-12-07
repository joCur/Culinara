import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';
import 'difficulty_selector.dart';
import 'reflection_text_field.dart';
import 'try_again_switch.dart';

class ReflectionForm extends StatelessWidget {
  final TextEditingController dishNameController;
  final TextEditingController learningsController;
  final void Function(int) onDifficultyChanged;
  final void Function(bool) onTryAgainChanged;

  const ReflectionForm({
    super.key,
    required this.dishNameController,
    required this.learningsController,
    required this.onDifficultyChanged,
    required this.onTryAgainChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReflectionTextField(
          controller: dishNameController,
          label: LocaleKeys.challenge_details_reflection_dish_name.tr(),
          hint: LocaleKeys.challenge_details_reflection_dish_name_hint.tr(),
        ),
        const SizedBox(height: 16),
        ReflectionTextField(
          controller: learningsController,
          label: LocaleKeys.challenge_details_reflection_learnings_label.tr(),
          hint: LocaleKeys.challenge_details_reflection_learnings_hint.tr(),
          maxLines: 4,
        ),
        const SizedBox(height: 16),
        DifficultySelector(onChanged: onDifficultyChanged),
        const SizedBox(height: 16),
        TryAgainSwitch(onChanged: onTryAgainChanged),
      ],
    );
  }
}
