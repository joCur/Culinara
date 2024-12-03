import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../screens/change_password_screen.dart';

class PasswordChangeCard extends StatelessWidget {
  const PasswordChangeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(Spacing.md),
        title: Text(
          LocaleKeys.changePassword.tr(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => context.pushNamed(ChangePasswordScreen.name),
      ),
    );
  }
}
