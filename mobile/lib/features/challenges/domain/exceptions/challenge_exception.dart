enum ChallengeErrorType {
  authentication,
  invalidArguments,
  serverError,
  timeout,
  unknown,
  maxChallengesReached,
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
}
