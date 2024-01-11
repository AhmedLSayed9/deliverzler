// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationPayload _$$_NotificationPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationPayload(
      routeLocation: json['routeLocation'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_NotificationPayloadToJson(
        _$_NotificationPayload instance) =>
    <String, dynamic>{
      'routeLocation': instance.routeLocation,
      'data': instance.data,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tappedNotificationHash() =>
    r'30ad5390133def07ab231725a2497ad717ed64f2';

/// See also [tappedNotification].
@ProviderFor(tappedNotification)
final tappedNotificationProvider =
    AutoDisposeProvider<Option<NotificationPayload>>.internal(
  tappedNotification,
  name: r'tappedNotificationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tappedNotificationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TappedNotificationRef
    = AutoDisposeProviderRef<Option<NotificationPayload>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
