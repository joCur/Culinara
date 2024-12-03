import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/presentation/widgets/gradient_background.dart';
import '../widgets/register/register_form.dart';
import '../widgets/shared/auth_header.dart';
import '../widgets/register/register_footer.dart';

class RegisterScreen extends ConsumerWidget {
  static const String name = 'register';
  static const String path = '/register';

  const RegisterScreen({super.key});

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
                AuthHeader(icon: Icons.person_add_outlined),
                RegisterForm(),
                RegisterFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}