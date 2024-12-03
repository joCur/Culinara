import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/presentation/widgets/gradient_background.dart';
import '../widgets/login/login_form.dart';
import '../widgets/login/login_footer.dart';
import '../widgets/shared/auth_header.dart';

class LoginScreen extends ConsumerWidget {
  static const String name = 'login';
  static const String path = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthHeader(icon: Icons.lock_outline),
                LoginForm(),
                LoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
