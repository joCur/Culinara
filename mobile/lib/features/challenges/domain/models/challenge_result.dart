import '../exceptions/challenge_exception.dart';

sealed class ChallengeResult<T> {
  const ChallengeResult();

  R when<R>({
    required R Function(T data) success,
    required R Function(ChallengeException error) failure,
  });
}

final class Success<T> extends ChallengeResult<T> {
  final T data;
  const Success(this.data);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(ChallengeException error) failure,
  }) =>
      success(data);
}

final class Failure<T> extends ChallengeResult<T> {
  final ChallengeException error;
  const Failure(this.error);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(ChallengeException error) failure,
  }) =>
      failure(error);
}
