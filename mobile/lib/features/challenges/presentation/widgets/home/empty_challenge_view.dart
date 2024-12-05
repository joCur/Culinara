import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';

class EmptyChallengeView extends StatelessWidget {
  final VoidCallback onTap;

  const EmptyChallengeView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.flag_outlined),
        title: Text(LocaleKeys.noChallengesYet.tr()),
        subtitle: Text(LocaleKeys.startNewChallenge.tr()),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
