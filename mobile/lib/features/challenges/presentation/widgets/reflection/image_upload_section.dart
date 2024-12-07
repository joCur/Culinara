import 'dart:io';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';
import 'image_preview_list.dart';

class ImageUploadSection extends StatelessWidget {
  final List<File> selectedImages;
  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;
  final void Function(int) onImageRemoved;

  const ImageUploadSection({
    super.key,
    required this.selectedImages,
    required this.onCameraPressed,
    required this.onGalleryPressed,
    required this.onImageRemoved,
  });

  Future<void> _showImageSourceDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title:
            Text(LocaleKeys.challenge_details_reflection_add_images_title.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title:
                  Text(LocaleKeys.challenge_details_reflection_take_photo.tr()),
              onTap: () {
                Navigator.pop(context);
                onCameraPressed();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(
                  LocaleKeys.challenge_details_reflection_choose_photo.tr()),
              onTap: () {
                Navigator.pop(context);
                onGalleryPressed();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.challenge_details_reflection_add_images.tr()),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ImagePreviewList(
            images: selectedImages,
            onImageRemoved: onImageRemoved,
            onAddImage: () => _showImageSourceDialog(context),
          ),
        ),
      ],
    );
  }
}
