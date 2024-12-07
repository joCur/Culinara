import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../features/auth/presentation/controllers/auth_controller.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/challenges/domain/models/challenge_attempt.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/auth/presentation/screens/profile_screen.dart';
import '../features/auth/presentation/screens/change_password_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/challenges/presentation/screens/generate_challenge_screen.dart';
import '../features/challenges/presentation/screens/challenge_details_screen.dart';
import '../features/challenges/presentation/screens/challenge_reflection_screen.dart';
import '../features/common/presentation/screens/error_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authControllerProvider);

  final publicRoutes = [
    LoginScreen.path,
    RegisterScreen.path,
    '${LoginScreen.path}/${ForgotPasswordScreen.path}',
  ];

  return GoRouter(
    initialLocation: HomeScreen.path,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isAuthRoute = publicRoutes.contains(state.matchedLocation);

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
        path: GenerateChallengeScreen.path,
        name: GenerateChallengeScreen.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const GenerateChallengeScreen(),
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
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
        routes: [
          GoRoute(
            path: ForgotPasswordScreen.path,
            name: ForgotPasswordScreen.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ForgotPasswordScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: RegisterScreen.path,
        name: RegisterScreen.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: ChallengeDetailsScreen.path,
        name: ChallengeDetailsScreen.name,
        builder: (context, state) => ChallengeDetailsScreen(
          attemptId: state.pathParameters['id']!,
          initialAttempt: state.extra as ChallengeAttempt?,
        ),
        routes: [
          GoRoute(
            path: 'reflection',
            name: ChallengeReflectionScreen.name,
            builder: (context, state) {
              return ChallengeReflectionScreen(
                attemptId: state.pathParameters['id']!,
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(
      title: state.error?.message,
    ),
  );
}
