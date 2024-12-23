import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/sentry_service.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../domain/exceptions/challenge_exception.dart';

part 'storage_repository.g.dart';

@riverpod
StorageRepository storageRepository(Ref ref) {
  return StorageRepository(FirebaseStorage.instance);
}

class StorageRepository {
  final FirebaseStorage _storage;

  StorageRepository(this._storage);

  Future<String> uploadChallengeImage(
    String challengeId,
    String attemptId,
    File image,
  ) async {
    try {
      final storageRef = _storage
          .ref()
          .child('challenges')
          .child(challengeId)
          .child('attempts')
          .child(attemptId)
          .child('${DateTime.now().toIso8601String()}.jpg');

      final uploadTask = await storageRef.putFile(image);

      if (uploadTask.state == TaskState.success) {
        return await storageRef.getDownloadURL();
      } else {
        throw Exception('Upload failed: ${uploadTask.state}');
      }
    } catch (e, stackTrace) {
      await SentryService.reportError(
        e,
        stackTrace,
        hint: 'Image Upload Error',
        extras: {
          'challengeId': challengeId,
          'attemptId': attemptId,
          'fileSize': await image.length(),
        },
      );
      throw ChallengeException(
        message: LocaleKeys.challenge_errors_imageUploadFailed.tr(),
        type: ChallengeErrorType.imageUploadFailed,
        originalError: e,
      );
    }
  }
}
