// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_remote_message_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getInitialMessageHash() => r'96d9f3825434968d108668c50df9263ba7c9cf11';

/// See also [getInitialMessage].
@ProviderFor(getInitialMessage)
final getInitialMessageProvider = AutoDisposeFutureProvider<Option<RemoteMessage>>.internal(
  getInitialMessage,
  name: r'getInitialMessageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getInitialMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetInitialMessageRef = AutoDisposeFutureProviderRef<Option<RemoteMessage>>;
String _$onMessageHash() => r'9ef0da5670c6b7de2b80f9c572c74a894d340d44';

/// See also [onMessage].
@ProviderFor(onMessage)
final onMessageProvider = AutoDisposeStreamProvider<RemoteMessage>.internal(
  onMessage,
  name: r'onMessageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$onMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OnMessageRef = AutoDisposeStreamProviderRef<RemoteMessage>;
String _$onMessageOpenedAppHash() => r'bd9066dfcd4b24ad4f964dfb8a073cf69f822620';

/// See also [onMessageOpenedApp].
@ProviderFor(onMessageOpenedApp)
final onMessageOpenedAppProvider = AutoDisposeStreamProvider<RemoteMessage>.internal(
  onMessageOpenedApp,
  name: r'onMessageOpenedAppProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$onMessageOpenedAppHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OnMessageOpenedAppRef = AutoDisposeStreamProviderRef<RemoteMessage>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
