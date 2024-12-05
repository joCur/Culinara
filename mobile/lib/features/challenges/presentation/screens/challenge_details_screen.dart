import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import '../../domain/models/challenge_attempt.dart';
import '../controllers/challenge_attempt_controller.dart';
import '../controllers/challenge_details_controller.dart';
import '../widgets/details/challenge_feedback_section.dart';
import '../widgets/details/challenge_status_chip.dart';
import '../widgets/details/challenge_action_buttons.dart';

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
                  pinned: true,
                  backgroundColor: colorScheme.surface,
                  elevation: 0,
                  leading: BackButton(color: colorScheme.onSurface),
                  title: Text(
                    LocaleKeys.challenge_details_title.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(Spacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(Spacing.md),
                          decoration: BoxDecoration(
                            color:
                                colorScheme.primaryContainer.withOpacity(0.1),
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
                                    DateFormat.yMMMMd()
                                        .format(attempt.startedAt),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                  ),
                                ],
                              ),
                              if (attempt.status ==
                                  ChallengeStatus.started) ...[
                                VGap.md,
                                Text(
                                  LocaleKeys.challenge_details_inProgress.tr(),
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ],
                          ),
                        ),
                        VGap.lg,
                        Row(
                          children: [
                            Icon(
                              Icons.restaurant_menu,
                              size: 24,
                              color: colorScheme.primary,
                            ),
                            HGap.sm,
                            Text(
                              LocaleKeys.challenge_ingredients.tr(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        VGap.md,
                        ...challenge.ingredients.map((ingredient) => Padding(
                              padding:
                                  const EdgeInsets.only(bottom: Spacing.sm),
                              child: Card(
                                elevation: 0,
                                color: colorScheme.surface,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                    color: colorScheme.outlineVariant,
                                    width: 1,
                                  ),
                                ),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: Spacing.md,
                                    vertical: Spacing.sm,
                                  ),
                                  title: Text(
                                    ingredient.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  subtitle: ingredient.notes != null
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: Spacing.xs),
                                          child: Text(ingredient.notes!),
                                        )
                                      : null,
                                ),
                              ),
                            )),
                        VGap.xl,
                        if (attempt.status == ChallengeStatus.started)
                          ChallengeActionButtons(attemptId: attemptId),
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
}
