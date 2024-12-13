// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengeDetailsHash() => r'110a909d8446f3f366b9214e88957089f2f5d289';

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

/// See also [challengeDetails].
@ProviderFor(challengeDetails)
const challengeDetailsProvider = ChallengeDetailsFamily();

/// See also [challengeDetails].
class ChallengeDetailsFamily extends Family<AsyncValue<Challenge>> {
  /// See also [challengeDetails].
  const ChallengeDetailsFamily();

  /// See also [challengeDetails].
  ChallengeDetailsProvider call(
    DocumentReference<Map<String, dynamic>> challengeRef,
  ) {
    return ChallengeDetailsProvider(
      challengeRef,
    );
  }

  @override
  ChallengeDetailsProvider getProviderOverride(
    covariant ChallengeDetailsProvider provider,
  ) {
    return call(
      provider.challengeRef,
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
  String? get name => r'challengeDetailsProvider';
}

/// See also [challengeDetails].
class ChallengeDetailsProvider extends AutoDisposeFutureProvider<Challenge> {
  /// See also [challengeDetails].
  ChallengeDetailsProvider(
    DocumentReference<Map<String, dynamic>> challengeRef,
  ) : this._internal(
          (ref) => challengeDetails(
            ref as ChallengeDetailsRef,
            challengeRef,
          ),
          from: challengeDetailsProvider,
          name: r'challengeDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$challengeDetailsHash,
          dependencies: ChallengeDetailsFamily._dependencies,
          allTransitiveDependencies:
              ChallengeDetailsFamily._allTransitiveDependencies,
          challengeRef: challengeRef,
        );

  ChallengeDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.challengeRef,
  }) : super.internal();

  final DocumentReference<Map<String, dynamic>> challengeRef;

  @override
  Override overrideWith(
    FutureOr<Challenge> Function(ChallengeDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChallengeDetailsProvider._internal(
        (ref) => create(ref as ChallengeDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        challengeRef: challengeRef,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Challenge> createElement() {
    return _ChallengeDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengeDetailsProvider &&
        other.challengeRef == challengeRef;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, challengeRef.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChallengeDetailsRef on AutoDisposeFutureProviderRef<Challenge> {
  /// The parameter `challengeRef` of this provider.
  DocumentReference<Map<String, dynamic>> get challengeRef;
}

class _ChallengeDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Challenge>
    with ChallengeDetailsRef {
  _ChallengeDetailsProviderElement(super.provider);

  @override
  DocumentReference<Map<String, dynamic>> get challengeRef =>
      (origin as ChallengeDetailsProvider).challengeRef;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
