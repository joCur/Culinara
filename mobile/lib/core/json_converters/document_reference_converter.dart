import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DocumentReferenceConverter
    implements JsonConverter<DocumentReference<Map<String, dynamic>>, dynamic> {
  const DocumentReferenceConverter();

  @override
  DocumentReference<Map<String, dynamic>> fromJson(dynamic ref) {
    if (ref is DocumentReference) {
      return ref.withConverter<Map<String, dynamic>>(
        fromFirestore: (snapshot, _) => snapshot.data()!,
        toFirestore: (data, _) => data,
      );
    }
    if (ref is String) {
      return FirebaseFirestore.instance
          .doc(ref)
          .withConverter<Map<String, dynamic>>(
            fromFirestore: (snapshot, _) => snapshot.data()!,
            toFirestore: (data, _) => data,
          );
    }
    throw Exception('Invalid DocumentReference format');
  }

  @override
  DocumentReference<Map<String, dynamic>> toJson(
          DocumentReference<Map<String, dynamic>> ref) =>
      ref;
}
