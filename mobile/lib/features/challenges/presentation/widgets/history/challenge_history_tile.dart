import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../domain/models/challenge_attempt.dart';
import '../../controllers/challenge_details_controller.dart';

class ChallengeHistoryTile extends ConsumerWidget {
  final ChallengeAttempt attempt;
  final VoidCallback onTap;

  const ChallengeHistoryTile({
    super.key,
    required this.attempt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final challengeAsync =
        ref.watch(challengeDetailsProvider(attempt.challengeRef));

    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              challengeAsync.when(
                data: (challenge) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                attempt.reflection?.dishName ??
                                    challenge.ingredients
                                        .map((i) => i.name)
                                        .join(', '),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                attempt.reflection?.dishName != null
                                    ? challenge.ingredients
                                        .map((i) => i.name)
                                        .join(', ')
                                    : LocaleKeys.challenge_history_in_progress
                                        .tr(),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        _buildStatusChip(context, attempt.status),
                      ],
                    ),
                    if (attempt.reflection != null) ...[
                      const SizedBox(height: 16),
                      if (attempt.reflection!.imageUrls?.isNotEmpty ?? false)
                        SizedBox(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (var i = 0;
                                  i < attempt.reflection!.imageUrls!.length;
                                  i++) ...[
                                if (i > 0) const SizedBox(width: 8),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    attempt.reflection!.imageUrls![i],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            attempt.reflection!.difficultyRating.toString(),
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(width: 16),
                          if (attempt.reflection!.wouldTryAgain)
                            Icon(
                              Icons.thumb_up,
                              size: 16,
                              color: theme.colorScheme.primary,
                            ),
                        ],
                      ),
                    ],
                  ],
                ),
                loading: () => const LinearProgressIndicator(),
                error: (_, __) => Text(
                  LocaleKeys.challenge_errors_default.tr(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, ChallengeStatus status) {
    final theme = Theme.of(context);

    Color backgroundColor;
    Color textColor;

    switch (status) {
      case ChallengeStatus.started:
        backgroundColor = theme.colorScheme.primaryContainer;
        textColor = theme.colorScheme.onPrimaryContainer;
        break;
      case ChallengeStatus.completed:
        backgroundColor = theme.colorScheme.secondaryContainer;
        textColor = theme.colorScheme.onSecondaryContainer;
        break;
      case ChallengeStatus.failed:
        backgroundColor = theme.colorScheme.errorContainer;
        textColor = theme.colorScheme.onErrorContainer;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        _getStatusText(status).toUpperCase(),
        style: theme.textTheme.labelSmall?.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
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
