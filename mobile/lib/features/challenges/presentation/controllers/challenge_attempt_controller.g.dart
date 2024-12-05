// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_attempt_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengeAttemptHash() => r'2fc923041649415ed522047546ef1d4624433bfc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [challengeAttempt].
@ProviderFor(challengeAttempt)
const challengeAttemptProvider = ChallengeAttemptFamily();

/// See also [challengeAttempt].
class ChallengeAttemptFamily extends Family<AsyncValue<ChallengeAttempt>> {
  /// See also [challengeAttempt].
  const ChallengeAttemptFamily();

  /// See also [challengeAttempt].
  ChallengeAttemptProvider call(
    String attemptId,
  ) {
    return ChallengeAttemptProvider(
      attemptId,
    );
  }

  @override
  ChallengeAttemptProvider getProviderOverride(
    covariant ChallengeAttemptProvider provider,
  ) {
    return call(
      provider.attemptId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'challengeAttemptProvider';
}

/// See also [challengeAttempt].
class ChallengeAttemptProvider
    extends AutoDisposeFutureProvider<ChallengeAttempt> {
  /// See also [challengeAttempt].
  ChallengeAttemptProvider(
    String attemptId,
  ) : this._internal(
          (ref) => challengeAttempt(
            ref as ChallengeAttemptRef,
            attemptId,
          ),
          from: challengeAttemptProvider,
          name: r'challengeAttemptProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$challengeAttemptHash,
          dependencies: ChallengeAttemptFamily._dependencies,
          allTransitiveDependencies:
              ChallengeAttemptFamily._allTransitiveDependencies,
          attemptId: attemptId,
        );

  ChallengeAttemptProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.attemptId,
  }) : super.internal();

  final String attemptId;

  @override
  Override overrideWith(
    FutureOr<ChallengeAttempt> Function(ChallengeAttemptRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChallengeAttemptProvider._internal(
        (ref) => create(ref as ChallengeAttemptRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        attemptId: attemptId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ChallengeAttempt> createElement() {
    return _ChallengeAttemptProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengeAttemptProvider && other.attemptId == attemptId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, attemptId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChallengeAttemptRef on AutoDisposeFutureProviderRef<ChallengeAttempt> {
  /// The parameter `attemptId` of this provider.
  String get attemptId;
}

class _ChallengeAttemptProviderElement
    extends AutoDisposeFutureProviderElement<ChallengeAttempt>
    with ChallengeAttemptRef {
  _ChallengeAttemptProviderElement(super.provider);

  @override
  String get attemptId => (origin as ChallengeAttemptProvider).attemptId;
}

String _$challengeAttemptControllerHash() =>
    r'2bf3cbdfc7d6c79c1886d804b6a9a3ee6501990e';

/// See also [ChallengeAttemptController].
@ProviderFor(ChallengeAttemptController)
final challengeAttemptControllerProvider =
    AutoDisposeAsyncNotifierProvider<ChallengeAttemptController, void>.internal(
  ChallengeAttemptController.new,
  name: r'challengeAttemptControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$challengeAttemptControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChallengeAttemptController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
