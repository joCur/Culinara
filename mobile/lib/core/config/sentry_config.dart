class SentryConfig {
  static const String dsn = String.fromEnvironment(
    'SENTRY_DSN',
    defaultValue: '',
  );

  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'development',
  );

  static const String release = String.fromEnvironment(
    'VERSION',
    defaultValue: '1.0.0',
  );
}
