// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_attempt_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengeAttemptControllerHash() =>
    r'3b91ebf9fe2193058e73745bd42ba92053aee6b1';

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

abstract class _$ChallengeAttemptController
    extends BuildlessAutoDisposeAsyncNotifier<ChallengeAttempt> {
  late final String attemptId;

  FutureOr<ChallengeAttempt> build(
    String attemptId,
  );
}

/// See also [ChallengeAttemptController].
@ProviderFor(ChallengeAttemptController)
const challengeAttemptControllerProvider = ChallengeAttemptControllerFamily();

/// See also [ChallengeAttemptController].
class ChallengeAttemptControllerFamily
    extends Family<AsyncValue<ChallengeAttempt>> {
  /// See also [ChallengeAttemptController].
  const ChallengeAttemptControllerFamily();

  /// See also [ChallengeAttemptController].
  ChallengeAttemptControllerProvider call(
    String attemptId,
  ) {
    return ChallengeAttemptControllerProvider(
      attemptId,
    );
  }

  @override
  ChallengeAttemptControllerProvider getProviderOverride(
    covariant ChallengeAttemptControllerProvider provider,
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
  String? get name => r'challengeAttemptControllerProvider';
}

/// See also [ChallengeAttemptController].
class ChallengeAttemptControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChallengeAttemptController,
        ChallengeAttempt> {
  /// See also [ChallengeAttemptController].
  ChallengeAttemptControllerProvider(
    String attemptId,
  ) : this._internal(
          () => ChallengeAttemptController()..attemptId = attemptId,
          from: challengeAttemptControllerProvider,
          name: r'challengeAttemptControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$challengeAttemptControllerHash,
          dependencies: ChallengeAttemptControllerFamily._dependencies,
          allTransitiveDependencies:
              ChallengeAttemptControllerFamily._allTransitiveDependencies,
          attemptId: attemptId,
        );

  ChallengeAttemptControllerProvider._internal(
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
  FutureOr<ChallengeAttempt> runNotifierBuild(
    covariant ChallengeAttemptController notifier,
  ) {
    return notifier.build(
      attemptId,
    );
  }

  @override
  Override overrideWith(ChallengeAttemptController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChallengeAttemptControllerProvider._internal(
        () => create()..attemptId = attemptId,
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
  AutoDisposeAsyncNotifierProviderElement<ChallengeAttemptController,
      ChallengeAttempt> createElement() {
    return _ChallengeAttemptControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengeAttemptControllerProvider &&
        other.attemptId == attemptId;
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
mixin ChallengeAttemptControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ChallengeAttempt> {
  /// The parameter `attemptId` of this provider.
  String get attemptId;
}

class _ChallengeAttemptControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChallengeAttemptController,
        ChallengeAttempt> with ChallengeAttemptControllerRef {
  _ChallengeAttemptControllerProviderElement(super.provider);

  @override
  String get attemptId =>
      (origin as ChallengeAttemptControllerProvider).attemptId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
