import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ingredient.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

@freezed
class Challenge with _$Challenge {
  const Challenge._();

  const factory Challenge({
    required String id,
    required List<Ingredient> ingredients,
    required DateTime createdAt,
    required String creatorId,
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  factory Challenge.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Challenge.fromJson({
      ...data,
      'id': snapshot.id,
    });
  }

  Map<String, dynamic> toFirestore() {
    return {
      'ingredients': ingredients.map((i) => i.toJson()).toList(),
      'createdAt': createdAt,
      'creatorId': creatorId,
    };
  }
}
