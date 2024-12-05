import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../generated/locale_keys.g.dart';

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
            LocaleKeys.challenge_loading.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
