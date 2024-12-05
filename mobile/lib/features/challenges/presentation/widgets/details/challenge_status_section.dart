import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/challenge_attempt.dart';

class ChallengeStatusSection extends ConsumerWidget {
  final ChallengeAttempt attempt;
  final ValueChanged<ChallengeStatus> onStatusChanged;

  const ChallengeStatusSection({
    super.key,
    required this.attempt,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.challenge_details_updateStatus.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            VGap.md,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatusButton(
                  status: ChallengeStatus.completed,
                  currentStatus: attempt.status,
                  onPressed: () => onStatusChanged(ChallengeStatus.completed),
                ),
                _StatusButton(
                  status: ChallengeStatus.failed,
                  currentStatus: attempt.status,
                  onPressed: () => onStatusChanged(ChallengeStatus.failed),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusButton extends StatelessWidget {
  final ChallengeStatus status;
  final ChallengeStatus currentStatus;
  final VoidCallback onPressed;

  const _StatusButton({
    required this.status,
    required this.currentStatus,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = status == currentStatus;
    return FilledButton.icon(
      onPressed: isSelected ? null : onPressed,
      icon: Icon(_getStatusIcon(status)),
      label: Text(status.name.tr()),
      style: FilledButton.styleFrom(
        backgroundColor:
            isSelected ? Theme.of(context).colorScheme.primaryContainer : null,
      ),
    );
  }

  IconData _getStatusIcon(ChallengeStatus status) {
    switch (status) {
      case ChallengeStatus.completed:
        return Icons.check_circle_outline;
      case ChallengeStatus.failed:
        return Icons.cancel_outlined;
      default:
        return Icons.hourglass_empty;
    }
  }
}
