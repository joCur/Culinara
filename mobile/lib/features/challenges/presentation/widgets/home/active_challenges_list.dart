import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../../common/presentation/widgets/loading/shimmer_container.dart';
import '../../../domain/constants/challenge_constants.dart';
import '../../controllers/active_challenges_controller.dart';
import '../../screens/generate_challenge_screen.dart';
import '../challenge/challenge_list_item.dart';
import 'new_challenge_button.dart';
import 'empty_challenge_view.dart';

class ActiveChallengesList extends ConsumerWidget {
  const ActiveChallengesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesStream = ref.watch(activeChallengesProvider);

    return challengesStream.when(
      data: (attempts) {
        if (attempts.isEmpty) {
          return EmptyChallengeView(
            onTap: () => context.pushNamed(GenerateChallengeScreen.name),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...attempts.map((attempt) => Padding(
                  padding: const EdgeInsets.only(bottom: Spacing.xs),
                  child: ChallengeListItem(attempt: attempt),
                )),
            if (attempts.length < maxActiveChallenges)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
                child: NewChallengeButton(
                  onTap: () => context.pushNamed(GenerateChallengeScreen.name),
                ),
              ),
          ],
        );
      },
      loading: () => Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          maxActiveChallenges,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: Spacing.xs),
            child: Card(
              child: ListTile(
                leading: ShimmerContainer(
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                  ),
                ),
                title: const ShimmerContainer(
                  width: 200,
                  height: 16,
                  borderRadius: 4,
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: Spacing.xs),
                  child: ShimmerContainer(
                    width: 100,
                    height: 14,
                    borderRadius: 4,
                  ),
                ),
                trailing: ShimmerContainer(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      error: (error, stack) => Center(
        child: Text('${LocaleKeys.error.tr()}: $error'),
      ),
    );
  }
}
