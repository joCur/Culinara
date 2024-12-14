import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../challenges/domain/models/challenge_attempt.dart';

class StatusChip extends StatelessWidget {
  final ChallengeStatus status;

  const StatusChip({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color backgroundColor;
    IconData icon;

    switch (status) {
      case ChallengeStatus.started:
        backgroundColor = theme.colorScheme.primaryContainer;
        icon = Icons.timer_outlined;
        break;
      case ChallengeStatus.completed:
        backgroundColor = theme.colorScheme.secondaryContainer;
        icon = Icons.check_circle_outline;
        break;
      case ChallengeStatus.failed:
        backgroundColor = theme.colorScheme.errorContainer;
        icon = Icons.cancel_outlined;
        break;
    }

    return Tooltip(
      message: _getStatusText(status),
      child: Icon(
        icon,
        size: 18,
        color: backgroundColor,
      ),
    );
  }

  String _getStatusText(ChallengeStatus status) {
    switch (status) {
      case ChallengeStatus.started:
        return LocaleKeys.challenge_history_filters_status_started.tr();
      case ChallengeStatus.completed:
        return LocaleKeys.challenge_history_filters_status_completed.tr();
      case ChallengeStatus.failed:
        return LocaleKeys.challenge_history_filters_status_failed.tr();
    }
  }
}
