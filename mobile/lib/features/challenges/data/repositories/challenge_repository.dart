import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/challenge.dart';
import '../../domain/models/ingredient.dart';

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

  Future<List<Ingredient>> generateChallenge({
    required List<String> diet,
    required String availability,
    required List<String> season,
    required int numIngredients,
  }) async {
    try {
      // Stelle sicher, dass der Benutzer eingeloggt ist
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('User must be logged in to generate challenges');
      }

      final result = await _functions.httpsCallable('generateChallenge').call({
        'preferences': {
          'diet': diet,
          'availability': availability,
          'season': season,
        },
        'numIngredients': numIngredients,
      });

      final List<dynamic> data = result.data;
      return data.map((e) {
        final Map<String, dynamic> ingredientData =
            Map<String, dynamic>.from(e as Map);
        return Ingredient.fromJson(ingredientData);
      }).toList();
    } catch (e) {
      throw Exception('Failed to generate challenge: ${e.toString()}');
    }
  }

  Future<void> saveChallenge(Challenge challenge) async {
    await _firestore.collection('challenges').add(challenge.toJson());
  }
}
