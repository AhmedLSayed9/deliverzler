import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/app_notification.dart';

part 'app_notification_dto.freezed.dart';

part 'app_notification_dto.g.dart';

@freezed
class AppNotificationDto with _$AppNotificationDto {
  const factory AppNotificationDto({
    required String tabName,
    required String? routeLocation,
    required Map<String, dynamic>? data,
  }) = _AppNotificationDto;
  const AppNotificationDto._();

  factory AppNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationDtoFromJson(json);

  factory AppNotificationDto.fromDomain(AppNotification appNotification) {
    return AppNotificationDto(
      tabName: appNotification.tabName,
      routeLocation: appNotification.routeLocation,
      data: appNotification.data,
    );
  }

  AppNotification toDomain() {
    return AppNotification(
      tabName: tabName,
      routeLocation: routeLocation,
      data: data,
    );
  }
}
