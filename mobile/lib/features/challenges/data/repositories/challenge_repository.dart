import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/ingredient.dart';
import '../../domain/exceptions/challenge_exception.dart';
import '../../domain/models/challenge_result.dart';
import '../../domain/models/challenge_attempt.dart';
import '../../domain/models/challenge.dart';

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
          message: 'Ein unerwarteter Fehler ist aufgetreten',
          type: ChallengeErrorType.unknown,
          originalError: e,
        ),
      );
    }
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'unauthenticated':
        return 'Bitte melde dich erneut an';
      case 'invalid-argument':
        return 'Ungültige Eingabedaten';
      case 'internal':
        return 'Entschuldigung, es gab ein Problem bei der Generierung. Bitte versuche es erneut';
      case 'deadline-exceeded':
        return 'Die Anfrage hat zu lange gedauert. Bitte versuche es erneut';
      default:
        return 'Ein Fehler ist aufgetreten. Bitte versuche es später erneut';
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

  Future<String> saveChallenge(Challenge challenge) async {
    final docRef =
        await _firestore.collection('challenges').add(challenge.toFirestore());
    return docRef.id;
  }

  Future<void> saveChallengeAttempt(ChallengeAttempt attempt) async {
    await _firestore.collection('challengeAttempts').add(attempt.toJson());
  }
}
