import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final Widget? child;

  const ShimmerContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceVariant,
      highlightColor: colorScheme.surface,
      child: child ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
    );
  }
}
