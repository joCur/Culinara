import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import '../../domain/models/challenge_attempt.dart';
import '../controllers/challenge_attempt_controller.dart';
import '../widgets/details/challenge_feedback_section.dart';
import '../widgets/details/challenge_action_buttons.dart';
import '../widgets/details/challenge_header_section.dart';
import '../widgets/details/challenge_ingredients_section.dart';
import '../../../common/presentation/screens/loading_screen.dart';

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

    return attemptAsync.when(
      data: (attempt) {
        final challengeAsync =
            AsyncLoading(); // TODO: implement after finishing loading screen
        // ref.watch(challengeDetailsProvider(attempt.challengeRef));

        return challengeAsync.when(
          data: (challenge) => Scaffold(
            body: CustomScrollView(
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
                SliverPadding(
                  padding: const EdgeInsets.all(Spacing.md),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      ChallengeHeaderSection(attempt: attempt),
                      VGap.lg,
                      ChallengeIngredientsSection(
                          ingredients: challenge.ingredients),
                      VGap.xl,
                      if (attempt.status == ChallengeStatus.started)
                        ChallengeActionButtons(attemptId: attemptId),
                      if (attempt.status == ChallengeStatus.completed)
                        ChallengeFeedbackSection(
                          attempt: attempt,
                          onFeedbackSubmitted: (feedback, rating) {
                            ref
                                .read(
                                    challengeAttemptControllerProvider.notifier)
                                .submitFeedback(attemptId, feedback, rating);
                          },
                        ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          loading: () => LoadingScreen(
            message: LocaleKeys.challenge_details_loading.tr(),
          ),
          error: (error, _) => Scaffold(
            body: Center(
              child: Text('${LocaleKeys.error.tr()}: $error'),
            ),
          ),
        );
      },
      loading: () => LoadingScreen(
        message: LocaleKeys.challenge_details_loading.tr(),
      ),
      error: (error, _) => Scaffold(
        body: Center(
          child: Text('${LocaleKeys.error.tr()}: $error'),
        ),
      ),
    );
  }
}
