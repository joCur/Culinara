import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../controllers/auth_controller.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../shared/auth_text_field.dart';
import '../shared/auth_button.dart';

class ForgotPasswordForm extends ConsumerWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final authState = ref.watch(authControllerProvider);
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
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.forgotPassword.tr(),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            VGap.md,
            Text(
              LocaleKeys.forgotPasswordDescription.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            VGap.lg,
            AuthTextField(
              controller: emailController,
              labelText: LocaleKeys.email.tr(),
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            VGap.lg,
            if (authState.isLoading)
              Center(
                  child: CircularProgressIndicator(color: colorScheme.primary))
            else
              AuthButton(
                onPressed: () {
                  ref
                      .read(authControllerProvider.notifier)
                      .resetPassword(emailController.text);
                },
                text: LocaleKeys.sendResetLink.tr(),
              ),
          ],
        ),
      ),
    );
  }
}
