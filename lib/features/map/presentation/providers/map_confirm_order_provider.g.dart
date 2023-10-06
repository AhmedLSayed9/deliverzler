// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_confirm_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapConfirmOrderStatusHash() =>
    r'78338b0aca3d7fee3ee76564aa99c2d57bde7e64';

/// See also [mapConfirmOrderStatus].
@ProviderFor(mapConfirmOrderStatus)
final mapConfirmOrderStatusProvider =
    AutoDisposeFutureProvider<MapConfirmOrderState>.internal(
  mapConfirmOrderStatus,
  name: r'mapConfirmOrderStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapConfirmOrderStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MapConfirmOrderStatusRef
    = AutoDisposeFutureProviderRef<MapConfirmOrderState>;
String _$mapConfirmOrderEventHash() =>
    r'88abcd88690b92f2cf519b687779ec244d00dbaf';

/// See also [MapConfirmOrderEvent].
@ProviderFor(MapConfirmOrderEvent)
final mapConfirmOrderEventProvider = AutoDisposeNotifierProvider<
    MapConfirmOrderEvent, Option<Event<UpdateDeliveryStatus>>>.internal(
  MapConfirmOrderEvent.new,
  name: r'mapConfirmOrderEventProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapConfirmOrderEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapConfirmOrderEvent
    = AutoDisposeNotifier<Option<Event<UpdateDeliveryStatus>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
