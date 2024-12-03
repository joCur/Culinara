import 'package:flutter/material.dart';
import '../../../../common/presentation/constants/ui_constants.dart';

class ProfileHeader extends StatelessWidget {
  final String email;

  const ProfileHeader({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(
              Icons.person,
              size: 50,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          VGap.md,
          Text(
            email,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
