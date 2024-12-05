import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/challenge_attempt.dart';
import 'challenge_status_chip.dart';

class ChallengeHeaderSection extends StatelessWidget {
  final ChallengeAttempt attempt;

  const ChallengeHeaderSection({
    super.key,
    required this.attempt,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.primaryContainer,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ChallengeStatusChip(status: attempt.status),
              const Spacer(),
              Text(
                DateFormat.yMMMMd().format(attempt.startedAt),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
          if (attempt.status == ChallengeStatus.started) ...[
            VGap.md,
            Text(
              LocaleKeys.challenge_details_inProgress.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ],
      ),
    );
  }
}
