// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_profile_image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pickProfileImageHash() => r'b2576e1b485906906b02b2d8b7182069b8a54571';

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

typedef PickProfileImageRef = AutoDisposeFutureProviderRef<File>;

/// See also [pickProfileImage].
@ProviderFor(pickProfileImage)
const pickProfileImageProvider = PickProfileImageFamily();

/// See also [pickProfileImage].
class PickProfileImageFamily extends Family<AsyncValue<File>> {
  /// See also [pickProfileImage].
  const PickProfileImageFamily();

  /// See also [pickProfileImage].
  PickProfileImageProvider call(
    PickSource pickSource,
  ) {
    return PickProfileImageProvider(
      pickSource,
    );
  }

  @override
  PickProfileImageProvider getProviderOverride(
    covariant PickProfileImageProvider provider,
  ) {
    return call(
      provider.pickSource,
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
  String? get name => r'pickProfileImageProvider';
}

/// See also [pickProfileImage].
class PickProfileImageProvider extends AutoDisposeFutureProvider<File> {
  /// See also [pickProfileImage].
  PickProfileImageProvider(
    this.pickSource,
  ) : super.internal(
          (ref) => pickProfileImage(
            ref,
            pickSource,
          ),
          from: pickProfileImageProvider,
          name: r'pickProfileImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pickProfileImageHash,
          dependencies: PickProfileImageFamily._dependencies,
          allTransitiveDependencies:
              PickProfileImageFamily._allTransitiveDependencies,
        );

  final PickSource pickSource;

  @override
  bool operator ==(Object other) {
    return other is PickProfileImageProvider && other.pickSource == pickSource;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pickSource.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
