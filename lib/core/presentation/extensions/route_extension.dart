import 'package:flutter/material.dart';

extension RouteExtension on Route {
  String get routeName => settings.name ?? settings.runtimeType.toString();
}
