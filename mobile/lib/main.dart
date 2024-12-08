import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/services/sentry_service.dart';
import 'core/config/sentry_config.dart';
import 'firebase_options.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SentryService.initialize(
    dsn: SentryConfig.dsn,
    environment: SentryConfig.environment,
    release: SentryConfig.release,
  );

  await runZonedGuarded(
    () async {
      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        SentryService.reportError(
          details.exception,
          details.stack,
          hint: 'FlutterError',
        );
      };

      runApp(
        EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('de')],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child: const ProviderScope(
            child: App(),
          ),
        ),
      );
    },
    (error, stackTrace) {
      SentryService.reportError(
        error,
        stackTrace,
        hint: 'Uncaught error',
      );
    },
  );
}
