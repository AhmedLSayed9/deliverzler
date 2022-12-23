import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_notification.freezed.dart';

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String tabName,
    required String? routeLocation,
    required Map<String, dynamic>? data,
  }) = _AppNotification;
}
