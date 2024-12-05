import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/challenge_attempt.dart';

class ChallengeStatusChip extends StatelessWidget {
  final ChallengeStatus status;

  const ChallengeStatusChip({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.md,
        vertical: Spacing.sm,
      ),
      decoration: BoxDecoration(
        color: _getStatusColor(context, status).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getStatusIcon(status),
            color: _getStatusColor(context, status),
            size: 20,
          ),
          HGap.sm,
          Text(
            status.name.tr(),
            style: TextStyle(
              color: _getStatusColor(context, status),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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

  IconData _getStatusIcon(ChallengeStatus status) {
    switch (status) {
      case ChallengeStatus.started:
        return Icons.timer_outlined;
      case ChallengeStatus.completed:
        return Icons.check_circle_outline;
      case ChallengeStatus.failed:
        return Icons.cancel_outlined;
    }
  }
}
