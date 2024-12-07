import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/locale_keys.g.dart';
import '../constants/ui_constants.dart';

class ErrorScreen extends StatelessWidget {
  final String? title;
  final String? message;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const ErrorScreen({
    super.key,
    this.title,
    this.message,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/error.json',
                width: 200,
                height: 200,
                repeat: true,
              ),
              VGap.lg,
              Text(
                title ?? LocaleKeys.errors_notFound_title.tr(),
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
              VGap.md,
              Text(
                message ?? LocaleKeys.errors_notFound_message.tr(),
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              VGap.xl,
              FilledButton.icon(
                onPressed: onButtonPressed ?? () => context.go('/'),
                icon: const Icon(Icons.home),
                label: Text(
                  buttonText ?? LocaleKeys.errors_notFound_button.tr(),
                ),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.lg,
                    vertical: Spacing.md,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
