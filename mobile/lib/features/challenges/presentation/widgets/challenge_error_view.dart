import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../common/presentation/constants/ui_constants.dart';

class ChallengeErrorView extends StatelessWidget {
  final Object error;

  const ChallengeErrorView({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: IconSizes.xl,
            color: colorScheme.error,
          ),
          VGap.sm,
          Text(
            LocaleKeys.challenge_error.tr(args: [error.toString()]),
            style: TextStyle(color: colorScheme.error),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
