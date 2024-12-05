import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/challenge.dart';
import '../../../domain/models/challenge_attempt.dart';

class ChallengeDetailsHeader extends StatelessWidget {
  final ChallengeAttempt attempt;
  final Challenge challenge;

  const ChallengeDetailsHeader({
    super.key,
    required this.attempt,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMd().format(attempt.startedAt),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            VGap.sm,
            Text(
              LocaleKeys.challenge_details_status.tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              attempt.status.name.tr(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: _getStatusColor(context, attempt.status),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(BuildContext context, ChallengeStatus status) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (status) {
      case ChallengeStatus.started:
        return colorScheme.primary;
      case ChallengeStatus.completed:
        return Colors.green;
      case ChallengeStatus.failed:
        return colorScheme.error;
    }
  }
}
