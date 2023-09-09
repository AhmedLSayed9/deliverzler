// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentPlaceDetailsHash() =>
    r'2565103c12fa8cf6e031a225a4c447692ca0d49f';

/// See also [currentPlaceDetails].
@ProviderFor(currentPlaceDetails)
final currentPlaceDetailsProvider =
    AutoDisposeProvider<Option<PlaceDetails>>.internal(
  currentPlaceDetails,
  name: r'currentPlaceDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentPlaceDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentPlaceDetailsRef = AutoDisposeProviderRef<Option<PlaceDetails>>;
String _$getPlaceDetailsHash() => r'78145270f13eb00f5d3a3070ca1641634ab47045';

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

typedef GetPlaceDetailsRef = AutoDisposeFutureProviderRef<PlaceDetails>;

/// See also [getPlaceDetails].
@ProviderFor(getPlaceDetails)
const getPlaceDetailsProvider = GetPlaceDetailsFamily();

/// See also [getPlaceDetails].
class GetPlaceDetailsFamily extends Family<AsyncValue<PlaceDetails>> {
  /// See also [getPlaceDetails].
  const GetPlaceDetailsFamily();

  /// See also [getPlaceDetails].
  GetPlaceDetailsProvider call(
    String placeId,
  ) {
    return GetPlaceDetailsProvider(
      placeId,
    );
  }

  @override
  GetPlaceDetailsProvider getProviderOverride(
    covariant GetPlaceDetailsProvider provider,
  ) {
    return call(
      provider.placeId,
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
  String? get name => r'getPlaceDetailsProvider';
}

/// See also [getPlaceDetails].
class GetPlaceDetailsProvider extends AutoDisposeFutureProvider<PlaceDetails> {
  /// See also [getPlaceDetails].
  GetPlaceDetailsProvider(
    this.placeId,
  ) : super.internal(
          (ref) => getPlaceDetails(
            ref,
            placeId,
          ),
          from: getPlaceDetailsProvider,
          name: r'getPlaceDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPlaceDetailsHash,
          dependencies: GetPlaceDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetPlaceDetailsFamily._allTransitiveDependencies,
        );

  final String placeId;

  @override
  bool operator ==(Object other) {
    return other is GetPlaceDetailsProvider && other.placeId == placeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, placeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$selectedPlaceAutocompleteHash() =>
    r'1118e9c484f58c14de3e85f0eb622a9391032be5';

/// See also [SelectedPlaceAutocomplete].
@ProviderFor(SelectedPlaceAutocomplete)
final selectedPlaceAutocompleteProvider = AutoDisposeNotifierProvider<
    SelectedPlaceAutocomplete, Option<PlaceAutocomplete>>.internal(
  SelectedPlaceAutocomplete.new,
  name: r'selectedPlaceAutocompleteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedPlaceAutocompleteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedPlaceAutocomplete
    = AutoDisposeNotifier<Option<PlaceAutocomplete>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
