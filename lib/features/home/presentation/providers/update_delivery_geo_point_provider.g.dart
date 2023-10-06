// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_delivery_geo_point_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateDeliveryGeoPointStateHash() =>
    r'175613a91e5b929a7376d930564462826f673e5f';

/// See also [updateDeliveryGeoPointState].
@ProviderFor(updateDeliveryGeoPointState)
final updateDeliveryGeoPointStateProvider =
    AutoDisposeFutureProvider<void>.internal(
  updateDeliveryGeoPointState,
  name: r'updateDeliveryGeoPointStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateDeliveryGeoPointStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpdateDeliveryGeoPointStateRef = AutoDisposeFutureProviderRef<void>;
String _$updateDeliveryGeoPointHash() =>
    r'4f01db6c2fc98d85dc92c5241c4491d21bd8d0ae';

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

typedef UpdateDeliveryGeoPointRef = AutoDisposeFutureProviderRef<void>;

/// See also [updateDeliveryGeoPoint].
@ProviderFor(updateDeliveryGeoPoint)
const updateDeliveryGeoPointProvider = UpdateDeliveryGeoPointFamily();

/// See also [updateDeliveryGeoPoint].
class UpdateDeliveryGeoPointFamily extends Family<AsyncValue<void>> {
  /// See also [updateDeliveryGeoPoint].
  const UpdateDeliveryGeoPointFamily();

  /// See also [updateDeliveryGeoPoint].
  UpdateDeliveryGeoPointProvider call(
    UpdateDeliveryGeoPoint deliveryGeoPoint,
  ) {
    return UpdateDeliveryGeoPointProvider(
      deliveryGeoPoint,
    );
  }

  @override
  UpdateDeliveryGeoPointProvider getProviderOverride(
    covariant UpdateDeliveryGeoPointProvider provider,
  ) {
    return call(
      provider.deliveryGeoPoint,
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
  String? get name => r'updateDeliveryGeoPointProvider';
}

/// See also [updateDeliveryGeoPoint].
class UpdateDeliveryGeoPointProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateDeliveryGeoPoint].
  UpdateDeliveryGeoPointProvider(
    this.deliveryGeoPoint,
  ) : super.internal(
          (ref) => updateDeliveryGeoPoint(
            ref,
            deliveryGeoPoint,
          ),
          from: updateDeliveryGeoPointProvider,
          name: r'updateDeliveryGeoPointProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateDeliveryGeoPointHash,
          dependencies: UpdateDeliveryGeoPointFamily._dependencies,
          allTransitiveDependencies:
              UpdateDeliveryGeoPointFamily._allTransitiveDependencies,
        );

  final UpdateDeliveryGeoPoint deliveryGeoPoint;

  @override
  bool operator ==(Object other) {
    return other is UpdateDeliveryGeoPointProvider &&
        other.deliveryGeoPoint == deliveryGeoPoint;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, deliveryGeoPoint.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
