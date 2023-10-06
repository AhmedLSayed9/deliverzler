// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_stream_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationStreamHash() => r'8a8c4a86c760e3a13cc16e9bf033392687e14028';

/// See also [locationStream].
@ProviderFor(locationStream)
final locationStreamProvider = AutoDisposeStreamProvider<Position>.internal(
  locationStream,
  name: r'locationStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationStreamRef = AutoDisposeStreamProviderRef<Position>;
String _$enableLocationHash() => r'3bc9a81dfda77cf6b6febc52669453183eb7f28a';

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

typedef EnableLocationRef = AutoDisposeFutureProviderRef<void>;

/// See also [enableLocation].
@ProviderFor(enableLocation)
const enableLocationProvider = EnableLocationFamily();

/// See also [enableLocation].
class EnableLocationFamily extends Family<AsyncValue<void>> {
  /// See also [enableLocation].
  const EnableLocationFamily();

  /// See also [enableLocation].
  EnableLocationProvider call(
    LocationService locationService,
  ) {
    return EnableLocationProvider(
      locationService,
    );
  }

  @override
  EnableLocationProvider getProviderOverride(
    covariant EnableLocationProvider provider,
  ) {
    return call(
      provider.locationService,
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
  String? get name => r'enableLocationProvider';
}

/// See also [enableLocation].
class EnableLocationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [enableLocation].
  EnableLocationProvider(
    this.locationService,
  ) : super.internal(
          (ref) => enableLocation(
            ref,
            locationService,
          ),
          from: enableLocationProvider,
          name: r'enableLocationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$enableLocationHash,
          dependencies: EnableLocationFamily._dependencies,
          allTransitiveDependencies:
              EnableLocationFamily._allTransitiveDependencies,
        );

  final LocationService locationService;

  @override
  bool operator ==(Object other) {
    return other is EnableLocationProvider &&
        other.locationService == locationService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locationService.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$requestLocationPermissionHash() =>
    r'3b5dd8d64080eacb6bde6acf8c7c03010ec632ab';
typedef RequestLocationPermissionRef = AutoDisposeFutureProviderRef<void>;

/// See also [requestLocationPermission].
@ProviderFor(requestLocationPermission)
const requestLocationPermissionProvider = RequestLocationPermissionFamily();

/// See also [requestLocationPermission].
class RequestLocationPermissionFamily extends Family<AsyncValue<void>> {
  /// See also [requestLocationPermission].
  const RequestLocationPermissionFamily();

  /// See also [requestLocationPermission].
  RequestLocationPermissionProvider call(
    LocationService locationService,
  ) {
    return RequestLocationPermissionProvider(
      locationService,
    );
  }

  @override
  RequestLocationPermissionProvider getProviderOverride(
    covariant RequestLocationPermissionProvider provider,
  ) {
    return call(
      provider.locationService,
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
  String? get name => r'requestLocationPermissionProvider';
}

/// See also [requestLocationPermission].
class RequestLocationPermissionProvider
    extends AutoDisposeFutureProvider<void> {
  /// See also [requestLocationPermission].
  RequestLocationPermissionProvider(
    this.locationService,
  ) : super.internal(
          (ref) => requestLocationPermission(
            ref,
            locationService,
          ),
          from: requestLocationPermissionProvider,
          name: r'requestLocationPermissionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$requestLocationPermissionHash,
          dependencies: RequestLocationPermissionFamily._dependencies,
          allTransitiveDependencies:
              RequestLocationPermissionFamily._allTransitiveDependencies,
        );

  final LocationService locationService;

  @override
  bool operator ==(Object other) {
    return other is RequestLocationPermissionProvider &&
        other.locationService == locationService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locationService.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
