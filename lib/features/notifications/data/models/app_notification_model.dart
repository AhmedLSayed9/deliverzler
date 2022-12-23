import 'dart:convert';

import 'package:deliverzler/features/notifications/domain/entities/app_notification.dart';

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
