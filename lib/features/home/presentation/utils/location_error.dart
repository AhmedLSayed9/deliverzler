import 'package:flutter/material.dart';

import '../../../../core/presentation/helpers/localization_helper.dart';

enum LocationError {
  notEnabledLocation,
  notGrantedLocationPermission,
  getLocationTimeout,
}

extension LocationErrorExtension on LocationError {
  String getErrorText(BuildContext context) {
    switch (this) {
      case LocationError.notEnabledLocation:
        return tr(context).please_enable_location_service;
      case LocationError.notGrantedLocationPermission:
        return tr(context).location_permission_required;
      case LocationError.getLocationTimeout:
        return tr(context).location_timeout_error;
    }
  }
}
