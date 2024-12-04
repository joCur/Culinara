import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_service.g.dart';

class StorageService {
  final FirebaseStorage _storage;

  StorageService(this._storage);

  Future<String?> uploadProfileImage(String userId, File file) async {
    try {
      final ref = _storage.ref().child('profile_images/$userId/profile.jpg');

      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  Future<String?> getProfileImageUrl(String userId) async {
    try {
      final ref = _storage.ref().child('profile_images/$userId/profile.jpg');
      return await ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  Future<bool> deleteProfileImage(String userId) async {
    try {
      final ref = _storage.ref().child('profile_images/$userId/profile.jpg');
      await ref.delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}

@riverpod
StorageService storageService(Ref ref) {
  return StorageService(FirebaseStorage.instance);
}
