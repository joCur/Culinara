import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../features/auth/presentation/controllers/auth_controller.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/auth/presentation/screens/profile_screen.dart';
import '../features/auth/presentation/screens/change_password_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: HomeScreen.path,
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isAuthRoute = state.matchedLocation == LoginScreen.path ||
          state.matchedLocation == RegisterScreen.path;

      if (isLoggedIn && isAuthRoute) {
        return HomeScreen.path;
      } else if (!isLoggedIn && !isAuthRoute) {
        return LoginScreen.path;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: HomeScreen.path,
        name: HomeScreen.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: ProfileScreen.path,
        name: ProfileScreen.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ProfileScreen(),
        ),
        routes: [
          GoRoute(
            path: ChangePasswordScreen.path,
            name: ChangePasswordScreen.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const ChangePasswordScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: RegisterScreen.path,
        name: RegisterScreen.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const RegisterScreen(),
        ),
      ),
    ],
  );
}
