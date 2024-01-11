// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_remote_message_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getInitialMessageHash() => r'73efb00ccf3c22bff0b8c406badf9bde02c82f96';

/// Called when the application open from a terminated state.
/// If it opened via notification, RemoteMessage will be returned, otherwise it will be null.
/// Should be called in app initState or at home screen because we need context for navigation.
///
/// Copied from [getInitialMessage].
@ProviderFor(getInitialMessage)
final getInitialMessageProvider =
    AutoDisposeFutureProvider<Option<RemoteMessage>>.internal(
  getInitialMessage,
  name: r'getInitialMessageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getInitialMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetInitialMessageRef
    = AutoDisposeFutureProviderRef<Option<RemoteMessage>>;
String _$onMessageHash() => r'9ef0da5670c6b7de2b80f9c572c74a894d340d44';

/// Called when FCM payload is received while the app is in the foreground.
///
/// Copied from [onMessage].
@ProviderFor(onMessage)
final onMessageProvider = AutoDisposeStreamProvider<RemoteMessage>.internal(
  onMessage,
  name: r'onMessageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$onMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OnMessageRef = AutoDisposeStreamProviderRef<RemoteMessage>;
String _$onMessageOpenedAppHash() =>
    r'bd9066dfcd4b24ad4f964dfb8a073cf69f822620';

/// Called when a user presses a notification message displayed via FCM.
/// Only if the app has opened from background state (not foreground or terminated).
///
/// Copied from [onMessageOpenedApp].
@ProviderFor(onMessageOpenedApp)
final onMessageOpenedAppProvider =
    AutoDisposeStreamProvider<RemoteMessage>.internal(
  onMessageOpenedApp,
  name: r'onMessageOpenedAppProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onMessageOpenedAppHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OnMessageOpenedAppRef = AutoDisposeStreamProviderRef<RemoteMessage>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
