import 'dart:io';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/constants/ui_constants.dart';
import '../../../domain/models/challenge_attempt.dart';
import 'package:image_picker/image_picker.dart';

class ChallengeReflectionSection extends StatefulWidget {
  final ChallengeAttempt attempt;
  final Function({
    required String dishName,
    required String learnings,
    required int difficultyRating,
    required bool wouldTryAgain,
    List<File>? images,
  }) onReflectionSubmitted;

  const ChallengeReflectionSection({
    super.key,
    required this.attempt,
    required this.onReflectionSubmitted,
  });

  @override
  State<ChallengeReflectionSection> createState() =>
      _ChallengeReflectionSectionState();
}

class _ChallengeReflectionSectionState
    extends State<ChallengeReflectionSection> {
  final _dishNameController = TextEditingController();
  final _learningsController = TextEditingController();
  int _difficultyRating = 3;
  bool _wouldTryAgain = true;
  final List<File> _selectedImages = [];

  final List<(String, IconData)> _difficultyLevels = [
    (
      LocaleKeys.challenge_details_reflection_difficulty_very_easy.tr(),
      Icons.local_fire_department_outlined
    ),
    (
      LocaleKeys.challenge_details_reflection_difficulty_easy.tr(),
      Icons.local_fire_department_outlined
    ),
    (
      LocaleKeys.challenge_details_reflection_difficulty_moderate.tr(),
      Icons.local_fire_department
    ),
    (
      LocaleKeys.challenge_details_reflection_difficulty_hard.tr(),
      Icons.local_fire_department
    ),
    (
      LocaleKeys.challenge_details_reflection_difficulty_very_hard.tr(),
      Icons.whatshot
    ),
  ];

  @override
  void dispose() {
    _dishNameController.dispose();
    _learningsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.challenge_details_reflection_subtitle.tr(),
          style: theme.textTheme.titleMedium,
        ),
        VGap.md,
        TextField(
          controller: _dishNameController,
          decoration: InputDecoration(
            labelText: LocaleKeys.challenge_details_reflection_dish_name.tr(),
            hintText:
                LocaleKeys.challenge_details_reflection_dish_name_hint.tr(),
          ),
        ),
        VGap.md,
        TextField(
          controller: _learningsController,
          maxLines: 3,
          decoration: InputDecoration(
            labelText:
                LocaleKeys.challenge_details_reflection_learnings_label.tr(),
            hintText:
                LocaleKeys.challenge_details_reflection_learnings_hint.tr(),
            alignLabelWithHint: true,
          ),
        ),
        VGap.lg,
        Text(
          LocaleKeys.challenge_details_reflection_difficulty_label.tr(),
          style: theme.textTheme.titleSmall,
        ),
        VGap.sm,
        SegmentedButton<int>(
          segments: _difficultyLevels.asMap().entries.map((entry) {
            return ButtonSegment<int>(
              value: entry.key + 1,
              label: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(entry.value.$2, size: 20),
                  const SizedBox(height: 4),
                  Text(
                    entry.value.$1.split(' ').last,
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
              ),
            );
          }).toList(),
          selected: {_difficultyRating},
          onSelectionChanged: (Set<int> newSelection) {
            setState(() => _difficultyRating = newSelection.first);
          },
          showSelectedIcon: false,
          style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
        VGap.md,
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            LocaleKeys.challenge_details_reflection_would_try_again_label.tr(),
            style: theme.textTheme.titleSmall,
          ),
          value: _wouldTryAgain,
          onChanged: (value) => setState(() => _wouldTryAgain = value),
        ),
        if (_selectedImages.isNotEmpty) ...[
          VGap.lg,
          Text(
            LocaleKeys.challenge_details_reflection_add_images.tr(),
            style: theme.textTheme.titleSmall,
          ),
          VGap.sm,
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _selectedImages.length + 1,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: Spacing.sm),
              itemBuilder: (context, index) {
                if (index == _selectedImages.length) {
                  return _AddImageButton(
                    onTap: () => _showImagePickerDialog(context),
                  );
                }
                return _ImagePreview(
                  image: _selectedImages[index],
                  onRemove: () =>
                      setState(() => _selectedImages.removeAt(index)),
                );
              },
            ),
          ),
        ] else ...[
          VGap.lg,
          OutlinedButton.icon(
            onPressed: () => _showImagePickerDialog(context),
            icon: const Icon(Icons.add_photo_alternate),
            label:
                Text(LocaleKeys.challenge_details_reflection_add_images.tr()),
          ),
        ],
        VGap.xl,
        FilledButton.icon(
          onPressed: _submitReflection,
          icon: const Icon(Icons.check),
          label: Text(LocaleKeys.challenge_details_reflection_submit.tr()),
        ),
      ],
    );
  }

  void _submitReflection() {
    widget.onReflectionSubmitted(
      dishName: _dishNameController.text,
      learnings: _learningsController.text,
      difficultyRating: _difficultyRating,
      wouldTryAgain: _wouldTryAgain,
      images: _selectedImages,
    );
  }

  Future<void> _showImagePickerDialog(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Text(LocaleKeys.challenge_details_reflection_add_images_title.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(
                LocaleKeys.challenge_details_reflection_take_photo.tr(),
              ),
              onTap: () async {
                Navigator.pop(context);
                final XFile? photo = await picker.pickImage(
                  source: ImageSource.camera,
                  imageQuality: 80,
                );
                if (photo != null && mounted) {
                  setState(() => _selectedImages.add(File(photo.path)));
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(
                LocaleKeys.challenge_details_reflection_choose_photo.tr(),
              ),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 80,
                );
                if (image != null && mounted) {
                  setState(() => _selectedImages.add(File(image.path)));
                }
              },
            ),
          ],
        ),
      ),
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
