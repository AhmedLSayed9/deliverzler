import 'dart:convert';

class NotificationModel {
  final String route;
  final Map<String, dynamic>? data;

  const NotificationModel({
    required this.route,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'route': route,
      'data': data,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      route: map['route'] as String,
      data: map['data'],
    );
  }

  String toJsonString() {
    return jsonEncode(toMap());
  }

  factory NotificationModel.fromJsonString(String payload) {
    return NotificationModel.fromMap(jsonDecode(payload));
  }
}
