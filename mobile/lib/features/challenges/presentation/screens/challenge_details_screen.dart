import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import '../../domain/models/challenge_attempt.dart';
import '../controllers/challenge_attempt_controller.dart';
import '../controllers/challenge_details_controller.dart';
import '../widgets/details/challenge_status_section.dart';
import '../widgets/details/challenge_header_section.dart';
import '../widgets/details/challenge_ingredients_section.dart';
import '../../../common/presentation/screens/loading_screen.dart';
import '../../../common/presentation/providers/loading_message_provider.dart';
import 'challenge_reflection_screen.dart';

class ChallengeDetailsScreen extends ConsumerWidget {
  static const String name = 'challenge-details';
  static const String path = '/challenge/:id';

  final String attemptId;
  final ChallengeAttempt? initialAttempt;

  const ChallengeDetailsScreen({
    super.key,
    required this.attemptId,
    this.initialAttempt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attemptAsync = initialAttempt != null
        ? AsyncValue.data(initialAttempt!)
        : ref.watch(challengeAttemptControllerProvider(attemptId));
    final colorScheme = Theme.of(context).colorScheme;

    return attemptAsync.when(
      data: (attempt) {
        final challengeAsync =
            ref.watch(challengeDetailsProvider(attempt.challengeRef));

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
                      ChallengeIngredientsSection(challenge: challenge),
                      VGap.xl,
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              child: child,
                            ),
                          );
                        },
                        child: _buildStatusSection(context, ref, attempt),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          loading: () => LoadingScreen(
            message: ref.watch(loadingMessageNotifierProvider(
                LoadingContext.challengeDetails)),
          ),
          error: (error, _) => Scaffold(
            body: Center(
              child: Text('${LocaleKeys.error.tr()}: $error'),
            ),
          ),
        );
      },
      loading: () => LoadingScreen(
        message: ref.watch(
            loadingMessageNotifierProvider(LoadingContext.challengeDetails)),
      ),
      error: (error, _) => Scaffold(
        body: Center(
          child: Text('${LocaleKeys.error.tr()}: $error'),
        ),
      ),
    );
  }

  Widget _buildStatusSection(
    BuildContext context,
    WidgetRef ref,
    ChallengeAttempt attempt,
  ) {
    if (attempt.status == ChallengeStatus.started) {
      return ChallengeStatusSection(
        key: const ValueKey('status_section'),
        attempt: attempt,
        onStatusChanged: (newStatus) {
          ref
              .read(challengeAttemptControllerProvider(attemptId).notifier)
              .updateStatus(newStatus);
        },
      );
    }

    if (attempt.status == ChallengeStatus.completed &&
        attempt.reflection == null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                LocaleKeys.challenge_details_reflection_prompt.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              VGap.md,
              FilledButton(
                onPressed: () => context.pushNamed(
                  ChallengeReflectionScreen.name,
                  pathParameters: {'id': attempt.id},
                ),
                child: Text(LocaleKeys.challenge_details_reflection_start.tr()),
              ),
            ],
          ),
        ),
      );
    }

    if (attempt.status == ChallengeStatus.completed &&
        attempt.reflection != null) {
      return Card(
        key: const ValueKey('completed_section'),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.challenge_details_reflection_title.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              VGap.md,
              Text(
                attempt.reflection!.dishName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              VGap.sm,
              Text(attempt.reflection!.learnings),
              VGap.sm,
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < attempt.reflection!.difficultyRating
                        ? Icons.star
                        : Icons.star_border,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              if (attempt.reflection!.imageUrls?.isNotEmpty ?? false) ...[
                VGap.md,
              ],
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
