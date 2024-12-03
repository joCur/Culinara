import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/auth_repository.dart';
import 'dart:io';

import '../../data/services/storage_service.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Stream<User?> build() {
    return ref.watch(authRepositoryProvider).authStateChanges();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref
        .read(authRepositoryProvider)
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user));
  }

  Future<void> signUp(String email, String password, String displayName) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref
        .read(authRepositoryProvider)
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
          displayName: displayName,
        )
        .then((value) => value.user));
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }

  Future<void> updatePassword(
      String currentPassword, String newPassword) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = ref.read(authRepositoryProvider).currentUser;
      final credential = EmailAuthProvider.credential(
        email: user?.email ?? '',
        password: currentPassword,
      );
      await user?.reauthenticateWithCredential(credential);
      await user?.updatePassword(newPassword);
      return user;
    });
  }
}

@riverpod
class UserProfile extends _$UserProfile {
  @override
  AsyncValue<User?> build() {
    final authState = ref.watch(authControllerProvider);
    return authState.whenData((user) => user);
  }

  Future<void> updateProfileImage(File image) async {
    final user = state.value;
    if (user == null) return;

    state = const AsyncLoading();
    try {
      final storageService = ref.read(storageServiceProvider);
      final imageUrl = await storageService.uploadProfileImage(user.uid, image);

      if (imageUrl != null) {
        await user.updatePhotoURL(imageUrl);
        state = AsyncValue.data(ref.read(authRepositoryProvider).currentUser);
      } else {
        state = AsyncValue.data(user);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> deleteProfileImage() async {
    final user = state.value;
    if (user == null) return;

    state = const AsyncLoading();

    try {
      await user.updatePhotoURL('');

      final storageService = ref.read(storageServiceProvider);
      await storageService.deleteProfileImage(user.uid);

      await user.reload();
      final updatedUser = ref.read(authRepositoryProvider).currentUser;
      state = AsyncValue.data(updatedUser);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> updateDisplayName(String newDisplayName) async {
    final user = state.value;
    if (user == null) return;

    state = const AsyncLoading();
    try {
      await user.updateDisplayName(newDisplayName);
      state = AsyncValue.data(ref.read(authRepositoryProvider).currentUser);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
