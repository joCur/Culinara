import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/sentry_service.dart';

part 'flash_controller.g.dart';

@riverpod
class FlashController extends _$FlashController {
  @override
  void build() {}

  void showError(
    BuildContext context,
    String message, {
    Duration? duration,
    FlashAction? action,
    bool reportToSentry = true,
  }) {
    if (reportToSentry) {
      SentryService.reportError(
        message,
        null,
        hint: 'User-Facing Error',
        extras: {
          'screen': ModalRoute.of(context)?.settings.name,
        },
      );
    }
    showFlash(
      context: context,
      duration: duration ?? const Duration(seconds: 4),
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          content: Text(
            message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
          ),
          primaryAction: action,
          icon: Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          position: FlashPosition.bottom,
          margin: const EdgeInsets.all(16),
        );
      },
    );
  }

  void showSuccess(
    BuildContext context,
    String message, {
    Duration? duration,
    FlashAction? action,
  }) {
    showFlash(
      context: context,
      duration: duration ?? const Duration(seconds: 4),
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          content: Text(
            message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          primaryAction: action,
          icon: Icon(
            Icons.check_circle_outline,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          position: FlashPosition.bottom,
          margin: const EdgeInsets.all(16),
        );
      },
    );
  }
}

class FlashAction extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const FlashAction({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onErrorContainer,
        ),
      ),
    );
  }
}
