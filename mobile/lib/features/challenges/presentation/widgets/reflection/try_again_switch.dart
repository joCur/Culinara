import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';

class TryAgainSwitch extends StatelessWidget {
  final void Function(bool) onChanged;

  const TryAgainSwitch({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            LocaleKeys.challenge_details_reflection_would_try_again_label.tr(),
          ),
        ),
        Switch.adaptive(
          value: true,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
