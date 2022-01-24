import 'dart:convert';

class PayloadModel {
  final String route;
  final Map<String, dynamic>? data;

  const PayloadModel({
    required this.route,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'route': route,
      'data': data,
    };
  }

  factory PayloadModel.fromMap(Map<String, dynamic> map) {
    return PayloadModel(
      route: map['route'] as String,
      data: map['data'],
    );
  }

  String toJsonString() {
    return jsonEncode(toMap());
  }

  factory PayloadModel.fromJsonString(String payload) {
    return PayloadModel.fromMap(jsonDecode(payload));
  }
}
