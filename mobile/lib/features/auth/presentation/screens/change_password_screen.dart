import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import '../controllers/auth_controller.dart';

class ChangePasswordScreen extends ConsumerWidget {
  static const String name = 'change-password';
  static const String path = 'change-password';

  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.changePassword.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.changePasswordDescription.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              VGap.xl,
              TextField(
                controller: currentPasswordController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.currentPassword.tr(),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                obscureText: true,
              ),
              VGap.md,
              TextField(
                controller: newPasswordController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.newPassword.tr(),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              VGap.xl,
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 16),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    ref.read(authControllerProvider.notifier).updatePassword(
                          currentPasswordController.text,
                          newPasswordController.text,
                        );
                    context.pop();
                  },
                  child: Text(
                    LocaleKeys.updatePassword.tr(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
