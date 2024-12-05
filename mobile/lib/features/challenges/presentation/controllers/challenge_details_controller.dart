import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/challenge.dart';

part 'challenge_details_controller.g.dart';

@riverpod
Future<Challenge> challengeDetails(
  Ref ref,
  DocumentReference<Map<String, dynamic>> challengeRef,
) async {
  final snapshot = await challengeRef.get();
  return Challenge.fromFirestore(snapshot, null);
}
