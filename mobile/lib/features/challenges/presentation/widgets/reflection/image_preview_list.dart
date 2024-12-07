import 'dart:io';
import 'package:flutter/material.dart';

class ImagePreviewList extends StatelessWidget {
  final List<File> images;
  final void Function(int) onImageRemoved;
  final VoidCallback onAddImage;

  const ImagePreviewList({
    super.key,
    required this.images,
    required this.onImageRemoved,
    required this.onAddImage,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: images.length + 1,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (context, index) {
        if (index == images.length) {
          return _AddImageButton(onTap: onAddImage);
        }
        return _ImagePreview(
          image: images[index],
          onRemove: () => onImageRemoved(index),
        );
      },
    );
  }
}

class _ImagePreview extends StatelessWidget {
  final File image;
  final VoidCallback onRemove;

  const _ImagePreview({
    required this.image,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Image.file(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 4,
            top: 4,
            child: Material(
              color: theme.colorScheme.surface.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
              child: IconButton(
                iconSize: 18,
                icon: Icon(
                  Icons.close,
                  color: theme.colorScheme.error,
                ),
                onPressed: onRemove,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddImageButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddImageButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Icon(
          Icons.add_photo_alternate,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
