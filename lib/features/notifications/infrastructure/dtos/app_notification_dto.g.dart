// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppNotificationDto _$$_AppNotificationDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AppNotificationDto(
      tabName: json['tabName'] as String,
      routeLocation: json['routeLocation'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_AppNotificationDtoToJson(
        _$_AppNotificationDto instance) =>
    <String, dynamic>{
      'tabName': instance.tabName,
      'routeLocation': instance.routeLocation,
      'data': instance.data,
    };
