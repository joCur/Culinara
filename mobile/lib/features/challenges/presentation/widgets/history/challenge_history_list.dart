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
      return Center(
        child: Text(LocaleKeys.challenge_history_empty.tr()),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: attempts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) => ChallengeHistoryTile(
        attempt: attempts[index],
        onTap: () => onAttemptTapped(attempts[index]),
      ),
    );
  }
}
