import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../constants/ui_constants.dart';
import 'animated_loading_text.dart';

class CookingLoadingAnimation extends StatelessWidget {
  final String? message;
  final double size;

  const CookingLoadingAnimation({
    super.key,
    this.message,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          'assets/animations/cooking.json',
          width: size,
          height: size,
        ),
        if (message != null) ...[
          VGap.md,
          AnimatedLoadingText(
            text: message!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ],
    );
  }
}
