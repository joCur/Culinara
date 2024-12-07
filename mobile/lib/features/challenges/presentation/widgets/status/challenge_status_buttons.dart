import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../domain/models/challenge_attempt.dart';
import 'status_button.dart';

class ChallengeStatusButtons extends StatelessWidget {
  final ChallengeStatus status;
  final VoidCallback onStartPressed;
  final VoidCallback onCompletePressed;

  const ChallengeStatusButtons({
    super.key,
    required this.status,
    required this.onStartPressed,
    required this.onCompletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          StatusButton(
            icon: Icons.play_arrow,
            label: LocaleKeys.challenge_details_started.tr(),
            isEnabled: status == ChallengeStatus.started,
            onPressed: onStartPressed,
          ),
          const VerticalDivider(),
          StatusButton(
            icon: Icons.check,
            label: LocaleKeys.challenge_details_completed.tr(),
            isEnabled: status == ChallengeStatus.completed,
            onPressed: onCompletePressed,
          ),
        ],
      ),
    );
  }
}
