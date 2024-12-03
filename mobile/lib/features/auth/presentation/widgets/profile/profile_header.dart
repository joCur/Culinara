import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import './profile_image.dart';

class ProfileHeader extends ConsumerWidget {
  final String email;
  final String? photoUrl;

  const ProfileHeader({
    super.key,
    required this.email,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          ProfileImage(imageUrl: photoUrl),
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
