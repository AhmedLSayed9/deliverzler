import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/app_notification.dart';

part 'app_notification_model.freezed.dart';

part 'app_notification_model.g.dart';

@freezed
class AppNotificationModel with _$AppNotificationModel {
  const AppNotificationModel._();

  const factory AppNotificationModel({
    required String initialRoute,
    required String? route,
    required Map<String, dynamic>? data,
  }) = _AppNotificationModel;

  factory AppNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationModelFromJson(json);

  factory AppNotificationModel.fromEntity(AppNotification appNotification) {
    return AppNotificationModel(
      initialRoute: appNotification.initialRoute,
      route: appNotification.route,
      data: appNotification.data,
    );
  }

  AppNotification toEntity() {
    return AppNotification(
      initialRoute: initialRoute,
      route: route,
      data: data,
    );
  }
}
/*
class AppNotificationModel extends AppNotification {
  const AppNotificationModel({
    required super.initialRoute,
    super.route,
    super.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'initialRoute': initialRoute,
      'route': route,
      'data': data,
    };
  }

  factory AppNotificationModel.fromMap(Map<String, dynamic> map) {
    return AppNotificationModel(
      initialRoute: map['initialRoute'],
      route: map['route'],
      data: map['data'],
    );
  }

  String toJsonString() {
    return jsonEncode(toMap());
  }

  factory AppNotificationModel.fromJsonString(String payload) {
    return AppNotificationModel.fromMap(jsonDecode(payload));
  }
}
*/
