import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/loading/cooking_loading_animation.dart';

class LoadingScreen extends StatelessWidget {
  final String message;
  final double size;

  const LoadingScreen({
    super.key,
    required this.message,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CookingLoadingAnimation(
          message: message,
          size: size,
        ),
      ),
    );
  }
}
