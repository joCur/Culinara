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
    final colorScheme = Theme.of(context).colorScheme;

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
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: _StatusButton(
                      onPressed: () =>
                          onStatusChanged(ChallengeStatus.completed),
                      icon: Icons.check_circle_outline,
                      label: ChallengeStatus.completed.name.tr(),
                      backgroundColor: Colors.green.shade700.withOpacity(0.15),
                      foregroundColor: Colors.green.shade700,
                    ),
                  ),
                  HGap.md,
                  Expanded(
                    child: _StatusButton(
                      onPressed: () => onStatusChanged(ChallengeStatus.failed),
                      icon: Icons.cancel_outlined,
                      label: ChallengeStatus.failed.name.tr(),
                      backgroundColor: Colors.red.shade700.withOpacity(0.15),
                      foregroundColor: Colors.red.shade700,
                    ),
                  ),
                ],
              ),
            ),
            VGap.sm,
            Text(
              LocaleKeys.challenge_details_statusWarning.tr(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;

  const _StatusButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.sm,
            vertical: Spacing.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: foregroundColor,
                size: 18,
              ),
              HGap.xs,
              Flexible(
                child: Text(
                  label.toLowerCase(),
                  style: TextStyle(
                    color: foregroundColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
