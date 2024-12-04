import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../domain/models/ingredient.dart';
import '../controllers/challenge_controller.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../common/presentation/constants/ui_constants.dart';

class ChallengeActionButtons extends ConsumerWidget {
  final AsyncValue<List<Ingredient>?> challengeState;

  const ChallengeActionButtons({
    super.key,
    required this.challengeState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: TextButton.icon(
            onPressed: () => ref
                .read(challengeControllerProvider.notifier)
                .generateNewChallenge(context),
            icon: const Icon(Icons.refresh),
            label: Text(LocaleKeys.challenge_actions_new.tr()),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: Spacing.xs,
              ),
            ),
          ),
        ),
        HGap.sm,
        if (challengeState.value != null)
          Expanded(
            child: FilledButton.icon(
              onPressed: () async {
                await ref
                    .read(challengeControllerProvider.notifier)
                    .acceptChallenge();
                if (context.mounted) {
                  context.pop();
                }
              },
              icon: const Icon(Icons.check),
              label: Text(LocaleKeys.challenge_actions_accept.tr()),
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  vertical: Spacing.xs,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
