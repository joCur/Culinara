import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CookingLoadingAnimation extends StatelessWidget {
  final double size;

  const CookingLoadingAnimation({
    super.key,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: Lottie.asset(
              'assets/animations/cooking_loading.json',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Generiere neue Challenge...',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
