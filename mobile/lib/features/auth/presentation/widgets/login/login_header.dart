import 'package:flutter/material.dart';
import '../../../../common/presentation/constants/ui_constants.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        VGap.xl,
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.lock_outline,
            size: 80,
            color: colorScheme.onPrimaryContainer,
          ),
        ),
        VGap.lg,
      ],
    );
  }
}
