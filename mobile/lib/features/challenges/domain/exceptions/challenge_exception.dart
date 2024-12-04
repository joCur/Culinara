enum ChallengeErrorType {
  network,
  authentication,
  invalidArguments,
  serverError,
  timeout,
  unknown,
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
