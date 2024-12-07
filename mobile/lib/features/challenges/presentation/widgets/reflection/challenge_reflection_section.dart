import 'dart:io';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../../common/presentation/controllers/flash_controller.dart';
import '../../../domain/models/challenge_attempt.dart';
import 'reflection_form.dart';
import 'image_upload_section.dart';

class ChallengeReflectionSection extends ConsumerStatefulWidget {
  final ChallengeAttempt attempt;
  final void Function({
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
  ConsumerState<ChallengeReflectionSection> createState() =>
      _ChallengeReflectionSectionState();
}

class _ChallengeReflectionSectionState
    extends ConsumerState<ChallengeReflectionSection> {
  final _dishNameController = TextEditingController();
  final _learningsController = TextEditingController();
  final _imagePicker = ImagePicker();
  int _difficultyRating = 3;
  bool _wouldTryAgain = true;
  final List<File> _selectedImages = [];

  @override
  void dispose() {
    _dishNameController.dispose();
    _learningsController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final image = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImages.add(File(image.path));
        });
      }
    } catch (e) {
      if (mounted) {
        ref.read(flashControllerProvider.notifier).showError(
              context,
              source == ImageSource.camera
                  ? LocaleKeys.challenge_errors_camera_access_denied.tr()
                  : LocaleKeys.challenge_errors_gallery_access_denied.tr(),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.challenge_details_reflection_prompt.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        ReflectionForm(
          dishNameController: _dishNameController,
          learningsController: _learningsController,
          onDifficultyChanged: (value) =>
              setState(() => _difficultyRating = value),
          onTryAgainChanged: (value) => setState(() => _wouldTryAgain = value),
        ),
        const SizedBox(height: 24),
        ImageUploadSection(
          selectedImages: _selectedImages,
          onCameraPressed: () => _pickImage(ImageSource.camera),
          onGalleryPressed: () => _pickImage(ImageSource.gallery),
          onImageRemoved: (index) {
            setState(() {
              _selectedImages.removeAt(index);
            });
          },
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () => widget.onReflectionSubmitted(
            dishName: _dishNameController.text,
            learnings: _learningsController.text,
            difficultyRating: _difficultyRating,
            wouldTryAgain: _wouldTryAgain,
            images: _selectedImages,
          ),
          child: Text(LocaleKeys.challenge_details_reflection_submit.tr()),
        ),
      ],
    );
  }
}
