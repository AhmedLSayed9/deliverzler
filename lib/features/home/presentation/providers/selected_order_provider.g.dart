// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedOrderHash() => r'a75b94de387df0cb77074c1b82f554ba14555235';

/// See also [selectedOrder].
@ProviderFor(selectedOrder)
final selectedOrderProvider = AutoDisposeProvider<Option<AppOrder>>.internal(
  selectedOrder,
  name: r'selectedOrderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedOrderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SelectedOrderRef = AutoDisposeProviderRef<Option<AppOrder>>;
String _$selectedOrderIdHash() => r'2f92dff28f4e8e4ba8f4022e0c20706cede74494';

/// See also [SelectedOrderId].
@ProviderFor(SelectedOrderId)
final selectedOrderIdProvider =
    AutoDisposeNotifierProvider<SelectedOrderId, Option<String>>.internal(
  SelectedOrderId.new,
  name: r'selectedOrderIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedOrderIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedOrderId = AutoDisposeNotifier<Option<String>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
