import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import '../../domain/models/challenge_attempt.dart';
import '../controllers/challenge_attempt_controller.dart';
import '../controllers/challenge_details_controller.dart';
import '../widgets/details/challenge_details_header.dart';
import '../widgets/details/challenge_ingredients_section.dart';
import '../widgets/details/challenge_status_section.dart';
import '../widgets/details/challenge_feedback_section.dart';

class ChallengeDetailsScreen extends ConsumerWidget {
  static const String name = 'challenge-details';
  static const String path = '/challenge/:id';

  final String attemptId;

  const ChallengeDetailsScreen({
    super.key,
    required this.attemptId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attemptAsync = ref.watch(challengeAttemptProvider(attemptId));
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: attemptAsync.when(
        data: (attempt) {
          final challengeAsync =
              ref.watch(challengeDetailsProvider(attempt.challengeRef));

          return challengeAsync.when(
            data: (challenge) => CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      DateFormat.yMMMMd().format(attempt.startedAt),
                      style: TextStyle(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    background: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            colorScheme.primaryContainer,
                            colorScheme.surface,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.restaurant_menu,
                          size: 64,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(Spacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status Card
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(Spacing.md),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: Spacing.md,
                                    vertical: Spacing.sm,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        _getStatusColor(context, attempt.status)
                                            .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        _getStatusIcon(attempt.status),
                                        color: _getStatusColor(
                                            context, attempt.status),
                                        size: 20,
                                      ),
                                      HGap.sm,
                                      Text(
                                        attempt.status.name.tr(),
                                        style: TextStyle(
                                          color: _getStatusColor(
                                              context, attempt.status),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VGap.md,

                        // Ingredients Section
                        Text(
                          LocaleKeys.challenge_ingredients.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        VGap.sm,
                        ...challenge.ingredients.map(
                          (ingredient) => Card(
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.restaurant),
                              ),
                              title: Text(ingredient.name),
                              subtitle: ingredient.notes != null
                                  ? Text(ingredient.notes!)
                                  : null,
                            ),
                          ),
                        ),
                        VGap.lg,

                        // Actions Section
                        if (attempt.status == ChallengeStatus.started)
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(Spacing.md),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    LocaleKeys.challenge_details_updateStatus
                                        .tr(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  VGap.md,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: FilledButton.icon(
                                          onPressed: () => ref
                                              .read(
                                                  challengeAttemptControllerProvider
                                                      .notifier)
                                              .updateStatus(attemptId,
                                                  ChallengeStatus.completed),
                                          icon: const Icon(
                                              Icons.check_circle_outline),
                                          label: Text(ChallengeStatus
                                              .completed.name
                                              .tr()),
                                          style: FilledButton.styleFrom(
                                            backgroundColor: Colors.green,
                                          ),
                                        ),
                                      ),
                                      HGap.md,
                                      Expanded(
                                        child: OutlinedButton.icon(
                                          onPressed: () => ref
                                              .read(
                                                  challengeAttemptControllerProvider
                                                      .notifier)
                                              .updateStatus(attemptId,
                                                  ChallengeStatus.failed),
                                          icon:
                                              const Icon(Icons.cancel_outlined),
                                          label: Text(
                                              ChallengeStatus.failed.name.tr()),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                        // Feedback Section
                        if (attempt.status == ChallengeStatus.completed)
                          ChallengeFeedbackSection(
                            attempt: attempt,
                            onFeedbackSubmitted: (feedback, rating) {
                              ref
                                  .read(challengeAttemptControllerProvider
                                      .notifier)
                                  .submitFeedback(attemptId, feedback, rating);
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(
              child: Text('${LocaleKeys.error.tr()}: $error'),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('${LocaleKeys.error.tr()}: $error'),
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
