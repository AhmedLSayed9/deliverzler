import 'package:flutter/material.dart';

extension RouteExtension on Route<dynamic> {
  String get routeName => settings.name ?? settings.runtimeType.toString();
}
