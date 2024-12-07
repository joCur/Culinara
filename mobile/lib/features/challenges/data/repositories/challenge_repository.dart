import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../domain/constants/challenge_constants.dart';
import '../../domain/models/ingredient.dart';
import '../../domain/exceptions/challenge_exception.dart';
import '../../domain/models/challenge_result.dart';
import '../../domain/models/challenge_attempt.dart';
import '../../domain/models/challenge.dart';
import '../../../../generated/locale_keys.g.dart';

part 'challenge_repository.g.dart';

@riverpod
ChallengeRepository challengeRepository(Ref ref) {
  final functions = FirebaseFunctions.instance;

  return ChallengeRepository(
    functions,
    FirebaseFirestore.instance,
  );
}

class ChallengeRepository {
  final FirebaseFunctions _functions;
  final FirebaseFirestore _firestore;

  ChallengeRepository(this._functions, this._firestore);

  Future<ChallengeResult<List<Ingredient>>> generateChallenge({
    required List<String> diet,
    required String availability,
    required List<String> season,
    required int numIngredients,
  }) async {
    try {
      final result = await _functions.httpsCallable('generateChallenge').call({
        'preferences': {
          'diet': diet,
          'availability': availability,
          'season': season,
        },
        'numIngredients': numIngredients,
      });

      final List<dynamic> data = result.data;
      return Success(
        data.map((e) {
          final Map<String, dynamic> ingredientData =
              Map<String, dynamic>.from(e as Map);
          return Ingredient.fromJson(ingredientData);
        }).toList(),
      );
    } on FirebaseFunctionsException catch (e) {
      return Failure(
        ChallengeException(
          message: _getErrorMessage(e.code),
          type: _getErrorType(e.code),
          originalError: e,
        ),
      );
    } catch (e) {
      return Failure(
        ChallengeException(
          message: LocaleKeys.challenge_errors_default.tr(),
          type: ChallengeErrorType.unknown,
          originalError: e,
        ),
      );
    }
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'unauthenticated':
        return LocaleKeys.challenge_errors_unauthenticated.tr();
      case 'invalid-argument':
        return LocaleKeys.challenge_errors_invalidArgument.tr();
      case 'internal':
        return LocaleKeys.challenge_errors_internal.tr();
      case 'deadline-exceeded':
        return LocaleKeys.challenge_errors_timeout.tr();
      default:
        return LocaleKeys.challenge_errors_default.tr();
    }
  }

  ChallengeErrorType _getErrorType(String code) {
    switch (code) {
      case 'unauthenticated':
        return ChallengeErrorType.authentication;
      case 'invalid-argument':
        return ChallengeErrorType.invalidArguments;
      case 'internal':
        return ChallengeErrorType.serverError;
      case 'deadline-exceeded':
        return ChallengeErrorType.timeout;
      default:
        return ChallengeErrorType.unknown;
    }
  }

  Future<DocumentReference<Map<String, dynamic>>> saveChallenge(
      Challenge challenge) async {
    return await _firestore
        .collection('challenges')
        .add(challenge.toFirestore());
  }

  Future<void> saveChallengeAttempt(ChallengeAttempt attempt) async {
    final activeCount = await _firestore
        .collection('challengeAttempts')
        .where('userId', isEqualTo: attempt.userId)
        .where('status', isEqualTo: ChallengeStatus.started.name)
        .count()
        .get();

    if (activeCount.count! >= maxActiveChallenges) {
      throw ChallengeException(
        message: LocaleKeys.challenge_errors_tooManyChallenges.tr(),
        type: ChallengeErrorType.maxChallengesReached,
      );
    }

    await _firestore.collection('challengeAttempts').add(attempt.toJson());
  }

  // Neue Methode zum Abrufen der aktiven Challenges
  Stream<List<ChallengeAttempt>> watchActiveAttempts(String userId) {
    return _firestore
        .collection('challengeAttempts')
        .where('userId', isEqualTo: userId)
        .where('status', isEqualTo: ChallengeStatus.started.name)
        .snapshots()
        .asyncMap((snapshot) async {
      final attempts = <ChallengeAttempt>[];

      for (var doc in snapshot.docs) {
        final attempt = ChallengeAttempt.fromFirestore(doc, null);
        attempts.add(attempt);
      }

      return attempts;
    });
  }

  Future<ChallengeAttempt> getChallengeAttempt(String attemptId) async {
    final doc =
        await _firestore.collection('challengeAttempts').doc(attemptId).get();
    return ChallengeAttempt.fromFirestore(doc, null);
  }

  Future<void> updateChallengeStatus(
    String attemptId,
    ChallengeStatus newStatus,
  ) async {
    await _firestore.collection('challengeAttempts').doc(attemptId).update({
      'status': newStatus.name,
      if (newStatus == ChallengeStatus.completed)
        'completedAt': Timestamp.now(),
    });
  }

  Future<void> updateChallengeFeedback(
    String attemptId,
    String feedback,
    int rating,
  ) async {
    await _firestore.collection('challengeAttempts').doc(attemptId).update({
      'feedback': feedback,
      'rating': rating,
    });
  }

  Future<void> updateChallengeReflection(
    String attemptId, {
    required String dishName,
    required String learnings,
    required int difficultyRating,
    required bool wouldTryAgain,
    List<String>? imageUrls,
  }) async {
    await _firestore.collection('challengeAttempts').doc(attemptId).update({
      'reflection': {
        'dishName': dishName,
        'learnings': learnings,
        'difficultyRating': difficultyRating,
        'wouldTryAgain': wouldTryAgain,
        'imageUrls': imageUrls,
        'timestamp': FieldValue.serverTimestamp(),
      },
    });
  }
}
