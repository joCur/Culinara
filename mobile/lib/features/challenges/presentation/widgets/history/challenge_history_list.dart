import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../domain/models/challenge_attempt.dart';
import '../../../domain/models/challenge.dart';
import 'challenge_history_tile.dart';

class ChallengeHistoryList extends StatelessWidget {
  final List<ChallengeAttempt> attempts;
  final void Function(ChallengeAttempt) onAttemptTapped;
  final void Function(Challenge) onRetryChallenge;

  const ChallengeHistoryList({
    super.key,
    required this.attempts,
    required this.onAttemptTapped,
    required this.onRetryChallenge,
  });

  @override
  Widget build(BuildContext context) {
    if (attempts.isEmpty) {
      return Center(
        child: Text(LocaleKeys.challenge_history_empty.tr()),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: attempts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return ChallengeHistoryTile(
          attempt: attempts[index],
          onTap: () => onAttemptTapped(attempts[index]),
          onRetryPressed: onRetryChallenge,
        );
      },
    );
  }
}
