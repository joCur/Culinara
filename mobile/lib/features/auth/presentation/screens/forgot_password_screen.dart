import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/presentation/widgets/gradient_background.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import '../widgets/forgot_password/forgot_password_form.dart';
import '../widgets/shared/auth_header.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  static const String name = 'forgot-password';
  static const String path = 'forgot-password';

  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VGap.xxl,
              AuthHeader(icon: Icons.lock_reset_outlined),
              VGap.lg,
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
