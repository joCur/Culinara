import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../domain/models/challenge_attempt.dart';
import 'challenge_history_tile.dart';

class ChallengeHistoryList extends StatelessWidget {
  final List<ChallengeAttempt> attempts;
  final void Function(ChallengeAttempt) onAttemptTapped;

  const ChallengeHistoryList({
    super.key,
    required this.attempts,
    required this.onAttemptTapped,
  });

  @override
  Widget build(BuildContext context) {
    if (attempts.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Text(LocaleKeys.challenge_history_empty.tr()),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index * 2 >= attempts.length * 2) return null;
            if (index * 2 + 1 == attempts.length * 2) {
              return ChallengeHistoryTile(
                attempt: attempts[index],
                onTap: () => onAttemptTapped(attempts[index]),
              );
            }
            return Column(
              children: [
                ChallengeHistoryTile(
                  attempt: attempts[index],
                  onTap: () => onAttemptTapped(attempts[index]),
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        ),
      ),
    );
  }
}
