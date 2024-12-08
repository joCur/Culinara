import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/challenge.dart';
import '../../../../core/services/sentry_service.dart';

part 'challenge_details_controller.g.dart';

@riverpod
Future<Challenge> challengeDetails(
  Ref ref,
  DocumentReference<Map<String, dynamic>> challengeRef,
) async {
  try {
    final snapshot = await challengeRef.get();
    return Challenge.fromFirestore(snapshot, null);
  } catch (e, stackTrace) {
    await SentryService.reportError(
      e,
      stackTrace,
      hint: 'Challenge details fetch failed',
      extras: {
        'challengeRef': challengeRef.path,
      },
    );
    rethrow;
  }
}
