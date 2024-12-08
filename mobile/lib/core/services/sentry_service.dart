import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryService {
  static Future<void> initialize({
    required String dsn,
    required String environment,
    required String release,
  }) async {
    await SentryFlutter.init(
      (options) {
        options
          ..dsn = dsn
          ..environment = environment
          ..release = release
          ..tracesSampleRate = 1.0
          ..attachScreenshot = true
          ..attachViewHierarchy = true
          ..debug = kDebugMode
          ..beforeSend = (event, {hint}) {
            // Hier können wir Events filtern oder modifizieren
            return event;
          };
      },
    );
  }

  static Future<void> reportError(
    dynamic exception,
    StackTrace? stackTrace, {
    String? hint,
    Map<String, dynamic>? extras,
  }) async {
    final eventHint = hint != null ? Hint.withMap({'description': hint}) : null;

    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
      hint: eventHint,
      withScope: (scope) {
        if (extras != null) {
          extras.forEach((key, value) {
            scope.setExtra(key, value);
          });
        }
        if (hint != null) {
          scope.setTag('error_hint', hint);
        }
      },
    );
  }
}
