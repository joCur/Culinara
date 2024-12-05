import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/ingredient.dart';
import '../controllers/challenge_controller.dart';
import '../../../../generated/locale_keys.g.dart';

class ChallengeActionButtons extends ConsumerWidget {
  final AsyncValue<List<Ingredient>?> challengeState;

  const ChallengeActionButtons({
    super.key,
    required this.challengeState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilledButton.icon(
          onPressed: () => ref
              .read(challengeControllerProvider.notifier)
              .generateNewChallenge(context),
          icon: const Icon(Icons.refresh),
          label: Text(LocaleKeys.challenge_actions_new.tr()),
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        if (challengeState.value != null)
          FilledButton.icon(
            onPressed: () {
              final ingredients = challengeState.value;
              if (ingredients != null) {
                ref
                    .read(challengeControllerProvider.notifier)
                    .acceptChallenge(context, ingredients)
                    .then((_) {
                  if (context.mounted) context.pop();
                });
              }
            },
            icon: const Icon(Icons.check),
            label: Text(LocaleKeys.challenge_actions_accept.tr()),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
      ],
    );
  }
}
