// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_autocomplete_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$placeAutocompleteStateHash() => r'fb521bd99cc799def513373518ce32a31e05e9ca';

/// See also [placeAutocompleteState].
@ProviderFor(placeAutocompleteState)
final placeAutocompleteStateProvider = AutoDisposeFutureProvider<List<PlaceAutocomplete>>.internal(
  placeAutocompleteState,
  name: r'placeAutocompleteStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$placeAutocompleteStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlaceAutocompleteStateRef = AutoDisposeFutureProviderRef<List<PlaceAutocomplete>>;
String _$getPlaceAutocompleteHash() => r'4532d022361a837aeb77a2d7ca50761148f4012c';

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

typedef GetPlaceAutocompleteRef = AutoDisposeFutureProviderRef<List<PlaceAutocomplete>>;

/// See also [getPlaceAutocomplete].
@ProviderFor(getPlaceAutocomplete)
const getPlaceAutocompleteProvider = GetPlaceAutocompleteFamily();

/// See also [getPlaceAutocomplete].
class GetPlaceAutocompleteFamily extends Family<AsyncValue<List<PlaceAutocomplete>>> {
  /// See also [getPlaceAutocomplete].
  const GetPlaceAutocompleteFamily();

  /// See also [getPlaceAutocomplete].
  GetPlaceAutocompleteProvider call(
    String autocompleteQuery,
  ) {
    return GetPlaceAutocompleteProvider(
      autocompleteQuery,
    );
  }

  @override
  GetPlaceAutocompleteProvider getProviderOverride(
    covariant GetPlaceAutocompleteProvider provider,
  ) {
    return call(
      provider.autocompleteQuery,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'getPlaceAutocompleteProvider';
}

/// See also [getPlaceAutocomplete].
class GetPlaceAutocompleteProvider extends AutoDisposeFutureProvider<List<PlaceAutocomplete>> {
  /// See also [getPlaceAutocomplete].
  GetPlaceAutocompleteProvider(
    this.autocompleteQuery,
  ) : super.internal(
          (ref) => getPlaceAutocomplete(
            ref,
            autocompleteQuery,
          ),
          from: getPlaceAutocompleteProvider,
          name: r'getPlaceAutocompleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$getPlaceAutocompleteHash,
          dependencies: GetPlaceAutocompleteFamily._dependencies,
          allTransitiveDependencies: GetPlaceAutocompleteFamily._allTransitiveDependencies,
        );

  final String autocompleteQuery;

  @override
  bool operator ==(Object other) {
    return other is GetPlaceAutocompleteProvider && other.autocompleteQuery == autocompleteQuery;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, autocompleteQuery.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$placeAutocompleteQueryHash() => r'9ffe997c902e4fa64c6b002953f1e06145dfa729';

/// See also [PlaceAutocompleteQuery].
@ProviderFor(PlaceAutocompleteQuery)
final placeAutocompleteQueryProvider =
    AutoDisposeNotifierProvider<PlaceAutocompleteQuery, Option<String>>.internal(
  PlaceAutocompleteQuery.new,
  name: r'placeAutocompleteQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$placeAutocompleteQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlaceAutocompleteQuery = AutoDisposeNotifier<Option<String>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
