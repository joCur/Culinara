import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/challenge_attempt.dart';
import '../../controllers/challenge_attempt_controller.dart';

class ChallengeActionButtons extends ConsumerWidget {
  final String attemptId;

  const ChallengeActionButtons({
    super.key,
    required this.attemptId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              LocaleKeys.challenge_details_updateStatus.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            VGap.md,
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => ref
                        .read(challengeAttemptControllerProvider(attemptId)
                            .notifier)
                        .updateStatus(ChallengeStatus.completed),
                    icon: const Icon(Icons.check_circle_outline),
                    label: Text(ChallengeStatus.completed.name.tr()),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
                HGap.md,
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => ref
                        .read(challengeAttemptControllerProvider(attemptId)
                            .notifier)
                        .updateStatus(ChallengeStatus.failed),
                    icon: const Icon(Icons.cancel_outlined),
                    label: Text(ChallengeStatus.failed.name.tr()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
