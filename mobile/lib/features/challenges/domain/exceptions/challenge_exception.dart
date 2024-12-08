import '../../../../core/services/sentry_service.dart';

enum ChallengeErrorType {
  authentication,
  invalidArguments,
  serverError,
  timeout,
  unknown,
  maxChallengesReached,
  updateFailed,
  imageUploadFailed,
  reflectionFailed,
}

class ChallengeException implements Exception {
  final String message;
  final ChallengeErrorType type;
  final dynamic originalError;

  const ChallengeException({
    required this.message,
    required this.type,
    this.originalError,
  });

  @override
  String toString() => message;

  Future<void> reportToSentry() async {
    await SentryService.reportError(
      this,
      null,
      hint: 'ChallengeException',
      extras: {
        'type': type.toString(),
        'message': message,
        'originalError': originalError?.toString(),
      },
    );
  }
}
