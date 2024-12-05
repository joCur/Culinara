import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampOrStringConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampOrStringConverter();

  @override
  DateTime fromJson(dynamic value) {
    if (value == null) {
      throw Exception('Timestamp cannot be null');
    }
    if (value is Timestamp) {
      return value.toDate();
    }
    if (value is String) {
      return DateTime.parse(value);
    }
    throw Exception('Invalid timestamp format: $value');
  }

  @override
  String toJson(DateTime date) => date.toIso8601String();
}

class NullableTimestampOrStringConverter
    implements JsonConverter<DateTime?, dynamic> {
  const NullableTimestampOrStringConverter();

  @override
  DateTime? fromJson(dynamic value) {
    if (value == null) return null;
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.parse(value);
    throw Exception('Invalid timestamp format: $value');
  }

  @override
  String? toJson(DateTime? date) => date?.toIso8601String();
}
