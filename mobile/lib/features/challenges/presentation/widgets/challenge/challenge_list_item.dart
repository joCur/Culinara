import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../domain/models/challenge_attempt.dart';
import '../../controllers/challenge_details_controller.dart';
import '../../screens/challenge_details_screen.dart';

class ChallengeListItem extends ConsumerWidget {
  final ChallengeAttempt attempt;

  const ChallengeListItem({super.key, required this.attempt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengeAsync =
        ref.watch(challengeDetailsProvider(attempt.challengeRef));

    return challengeAsync.when(
      data: (challenge) => Card(
        child: ListTile(
          leading: const Icon(Icons.restaurant_outlined),
          title: Text(
            challenge.ingredients.map((i) => i.name).join(', '),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(attempt.startedAt),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => context.pushNamed(
            ChallengeDetailsScreen.name,
            pathParameters: {'id': attempt.id},
          ),
        ),
      ),
      loading: () => Card(
        child: ListTile(
          leading: const CircularProgressIndicator(),
          title: Text(LocaleKeys.challenge_states_loading.tr()),
        ),
      ),
      error: (error, stack) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.error_outline),
            title: Text(
                LocaleKeys.challenge_states_error.tr(args: [error.toString()])),
          ),
        );
      },
    );
  }
}
