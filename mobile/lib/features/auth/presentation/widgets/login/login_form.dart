import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../controllers/auth_controller.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../shared/auth_text_field.dart';
import '../shared/auth_button.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surface.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.login.tr(),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            VGap.lg,
            AuthTextField(
              controller: emailController,
              labelText: LocaleKeys.email.tr(),
              icon: Icons.email_outlined,
            ),
            VGap.sm,
            AuthTextField(
              controller: passwordController,
              labelText: LocaleKeys.password.tr(),
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            VGap.lg,
            if (authState.isLoading)
              Center(
                  child: CircularProgressIndicator(color: colorScheme.primary))
            else
              AuthButton(
                onPressed: () {
                  ref.read(authControllerProvider.notifier).signIn(
                        emailController.text,
                        passwordController.text,
                      );
                },
                text: LocaleKeys.login.tr(),
              ),
          ],
        ),
      ),
    );
  }
}
