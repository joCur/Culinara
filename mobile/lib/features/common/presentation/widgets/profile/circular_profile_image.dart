import 'package:flutter/material.dart';

class CircularProfileImage extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const CircularProfileImage({
    super.key,
    this.imageUrl,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: colorScheme.primaryContainer,
      backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
          ? NetworkImage(imageUrl!)
          : null,
      child: imageUrl == null || imageUrl!.isEmpty
          ? Icon(
              Icons.person,
              size: size * 0.6,
              color: colorScheme.onPrimaryContainer,
            )
          : null,
    );
  }
}
