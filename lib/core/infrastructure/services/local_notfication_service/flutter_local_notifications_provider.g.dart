// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_local_notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flutterLocalNotificationsHash() =>
    r'a4fc663d10b6e1b6829802da9819ae06f4619911';

/// See also [flutterLocalNotifications].
@ProviderFor(flutterLocalNotifications)
final flutterLocalNotificationsProvider =
    Provider<FlutterLocalNotificationsPlugin>.internal(
  flutterLocalNotifications,
  name: r'flutterLocalNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$flutterLocalNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FlutterLocalNotificationsRef
    = ProviderRef<FlutterLocalNotificationsPlugin>;
String _$setupFlutterLocalNotificationsHash() =>
    r'81ee70ccb56087db7c68186a51f0550527b43763';

/// See also [setupFlutterLocalNotifications].
@ProviderFor(setupFlutterLocalNotifications)
final setupFlutterLocalNotificationsProvider =
    FutureProvider<FlutterLocalNotificationsPlugin>.internal(
  setupFlutterLocalNotifications,
  name: r'setupFlutterLocalNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$setupFlutterLocalNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SetupFlutterLocalNotificationsRef
    = FutureProviderRef<FlutterLocalNotificationsPlugin>;
String _$onSelectNotificationHash() =>
    r'd313fac2640dc7ea0b8b938f81c4bebb1c591b48';

/// See also [OnSelectNotification].
@ProviderFor(OnSelectNotification)
final onSelectNotificationProvider =
    NotifierProvider<OnSelectNotification, Option<AppNotification>>.internal(
  OnSelectNotification.new,
  name: r'onSelectNotificationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onSelectNotificationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OnSelectNotification = Notifier<Option<AppNotification>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
