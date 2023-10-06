import 'package:flutter/material.dart';

import '../../../../core/presentation/helpers/localization_helper.dart';

enum LocationError {
  notEnabledLocation,
  notGrantedLocationPermission,
  getLocationTimeout;

  const LocationError();

  String getErrorText(BuildContext context) {
    return switch (this) {
      LocationError.notEnabledLocation => tr(context).please_enable_location_service,
      LocationError.notGrantedLocationPermission => tr(context).location_permission_required,
      LocationError.getLocationTimeout => tr(context).location_timeout_error,
    };
  }
}
