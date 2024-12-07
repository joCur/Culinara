import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';

class AddImageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddImageButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_photo_alternate_outlined),
            const SizedBox(height: 4),
            Text(
              LocaleKeys.challenge_details_reflection_add_images_title.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
