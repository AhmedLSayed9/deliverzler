// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$setupFlutterNotificationsHash() =>
    r'24e21dd91048accf792425680cee4c4fb1560328';

/// See also [setupFlutterNotifications].
@ProviderFor(setupFlutterNotifications)
final setupFlutterNotificationsProvider =
    AutoDisposeFutureProvider<void>.internal(
  setupFlutterNotifications,
  name: r'setupFlutterNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$setupFlutterNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SetupFlutterNotificationsRef = AutoDisposeFutureProviderRef<void>;
String _$requestNotificationPermissionsHash() =>
    r'048b7e7439534a493ba60e54c9e8433f455e26cb';

/// See also [requestNotificationPermissions].
@ProviderFor(requestNotificationPermissions)
final requestNotificationPermissionsProvider =
    AutoDisposeFutureProvider<AuthorizationStatus>.internal(
  requestNotificationPermissions,
  name: r'requestNotificationPermissionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$requestNotificationPermissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RequestNotificationPermissionsRef
    = AutoDisposeFutureProviderRef<AuthorizationStatus>;
String _$notificationServiceHash() =>
    r'f2936d3291320e39fb9cd3836efd25930d5aac71';

/// See also [notificationService].
@ProviderFor(notificationService)
final notificationServiceProvider = Provider<NotificationService>.internal(
  notificationService,
  name: r'notificationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationServiceRef = ProviderRef<NotificationService>;
String _$notificationResponseEventHash() =>
    r'2a042768d47ca4db0cc1593b7fa2947b1a2fee10';

/// See also [NotificationResponseEvent].
@ProviderFor(NotificationResponseEvent)
final notificationResponseEventProvider = NotifierProvider<
    NotificationResponseEvent, Option<NotificationResponse>>.internal(
  NotificationResponseEvent.new,
  name: r'notificationResponseEventProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationResponseEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationResponseEvent = Notifier<Option<NotificationResponse>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
