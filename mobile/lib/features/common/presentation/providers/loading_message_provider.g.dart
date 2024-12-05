// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_message_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadingMessageNotifierHash() =>
    r'33ccf7839606c18fb7e7c2240aa128f59bf8c639';

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

abstract class _$LoadingMessageNotifier
    extends BuildlessAutoDisposeNotifier<String> {
  late final LoadingContext context;

  String build(
    LoadingContext context,
  );
}

/// See also [LoadingMessageNotifier].
@ProviderFor(LoadingMessageNotifier)
const loadingMessageNotifierProvider = LoadingMessageNotifierFamily();

/// See also [LoadingMessageNotifier].
class LoadingMessageNotifierFamily extends Family<String> {
  /// See also [LoadingMessageNotifier].
  const LoadingMessageNotifierFamily();

  /// See also [LoadingMessageNotifier].
  LoadingMessageNotifierProvider call(
    LoadingContext context,
  ) {
    return LoadingMessageNotifierProvider(
      context,
    );
  }

  @override
  LoadingMessageNotifierProvider getProviderOverride(
    covariant LoadingMessageNotifierProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'loadingMessageNotifierProvider';
}

/// See also [LoadingMessageNotifier].
class LoadingMessageNotifierProvider
    extends AutoDisposeNotifierProviderImpl<LoadingMessageNotifier, String> {
  /// See also [LoadingMessageNotifier].
  LoadingMessageNotifierProvider(
    LoadingContext context,
  ) : this._internal(
          () => LoadingMessageNotifier()..context = context,
          from: loadingMessageNotifierProvider,
          name: r'loadingMessageNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadingMessageNotifierHash,
          dependencies: LoadingMessageNotifierFamily._dependencies,
          allTransitiveDependencies:
              LoadingMessageNotifierFamily._allTransitiveDependencies,
          context: context,
        );

  LoadingMessageNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final LoadingContext context;

  @override
  String runNotifierBuild(
    covariant LoadingMessageNotifier notifier,
  ) {
    return notifier.build(
      context,
    );
  }

  @override
  Override overrideWith(LoadingMessageNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: LoadingMessageNotifierProvider._internal(
        () => create()..context = context,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<LoadingMessageNotifier, String>
      createElement() {
    return _LoadingMessageNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadingMessageNotifierProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoadingMessageNotifierRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `context` of this provider.
  LoadingContext get context;
}

class _LoadingMessageNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<LoadingMessageNotifier, String>
    with LoadingMessageNotifierRef {
  _LoadingMessageNotifierProviderElement(super.provider);

  @override
  LoadingContext get context =>
      (origin as LoadingMessageNotifierProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
