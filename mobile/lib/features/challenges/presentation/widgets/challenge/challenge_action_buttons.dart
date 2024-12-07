import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/challenge_attempt.dart';
import '../../../domain/models/ingredient.dart';
import '../../controllers/challenge_controller.dart';
import '../../../../../generated/locale_keys.g.dart';

class ChallengeActionButtons extends ConsumerWidget {
  final AsyncValue<List<Ingredient>?> challengeState;
  final Function(BuildContext ctx, ChallengeAttempt attempt)
      onChallengeAccepted;

  const ChallengeActionButtons({
    super.key,
    required this.challengeState,
    required this.onChallengeAccepted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = challengeState.isLoading;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          onPressed: isLoading
              ? null // Button deaktivieren während des Ladens
              : () => ref
                  .read(challengeControllerProvider.notifier)
                  .generateNewChallenge(context),
          icon: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.refresh),
          label: Text(LocaleKeys.challenge_actions_new.tr()),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.md,
              vertical: Spacing.sm,
            ),
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
                    .then((attempt) {
                  if (context.mounted) {
                    onChallengeAccepted(context, attempt);
                  }
                }).onError((error, stackTrace) {});
              }
            },
            icon: const Icon(Icons.check),
            label: Text(LocaleKeys.challenge_actions_accept.tr()),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.md,
                vertical: Spacing.sm,
              ),
              minimumSize: const Size(160, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
      ],
    );
  }
}
