import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../controllers/auth_controller.dart';

class ProfileImage extends ConsumerWidget {
  final String? imageUrl;
  final double size;

  const ProfileImage({
    super.key,
    this.imageUrl,
    this.size = 100,
  });

  Future<void> _showImageOptions(BuildContext context, WidgetRef ref) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Profilbild'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Kamera'),
              onTap: () => Navigator.pop(context, 'camera'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galerie'),
              onTap: () => Navigator.pop(context, 'gallery'),
            ),
            if (imageUrl != null)
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Bild löschen'),
                onTap: () => Navigator.pop(context, 'delete'),
              ),
          ],
        ),
      ),
    );

    if (result == null) return;

    if (result == 'delete') {
      imageCache.clear();
      imageCache.clearLiveImages();
      await ref.read(userProfileProvider.notifier).deleteProfileImage();
      return;
    }

    final source =
        result == 'camera' ? ImageSource.camera : ImageSource.gallery;
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      await ref
          .read(userProfileProvider.notifier)
          .updateProfileImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final authState = ref.watch(userProfileProvider);

    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap:
            authState.isLoading ? null : () => _showImageOptions(context, ref),
        child: CircleAvatar(
          radius: size / 2,
          backgroundColor: colorScheme.primaryContainer,
          backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
              ? NetworkImage(imageUrl!)
              : null,
          child: authState.isLoading
              ? const CircularProgressIndicator()
              : (imageUrl == null || imageUrl!.isEmpty)
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: size * 0.6,
                          color: colorScheme.onPrimaryContainer,
                        ),
                        Positioned(
                          right: size * 0.1,
                          bottom: size * 0.1,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              size: size * 0.2,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    )
                  : null,
        ),
      ),
    );
  }
}
