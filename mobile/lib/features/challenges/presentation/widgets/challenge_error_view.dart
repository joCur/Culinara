import 'package:flutter/material.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import '../../domain/exceptions/challenge_exception.dart';

class ChallengeErrorView extends StatelessWidget {
  final ChallengeException error;
  final VoidCallback? onRetry;

  const ChallengeErrorView({
    super.key,
    required this.error,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            VGap.md,
            Text(
              error.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
