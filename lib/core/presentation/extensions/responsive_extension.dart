import 'package:deliverzler/core/presentation/services/locator_service.dart';
import 'package:deliverzler/core/presentation/services/responsive_service.dart';
import 'package:flutter/material.dart';

final _responsiveService = getIt<ResponsiveService>();

extension ResponsiveExtension on num {
  double w(BuildContext context) =>
      _responsiveService.scaleWidth(context) * this;

  double h(BuildContext context) =>
      _responsiveService.scaleHeight(context) * this;

  double r(BuildContext context) =>
      _responsiveService.scaleRadius(context) * this;

  double sp(BuildContext context) =>
      _responsiveService.scaleText(context) * this;
}
