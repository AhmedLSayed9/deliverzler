import 'package:deliverzler/core/services/localization_service.dart';
import 'package:flutter/material.dart';

enum LocationError {
  notEnabledLocation,
  notGrantedLocationPermission,
  getLocationTimeout,
}

String getLocationErrorText(BuildContext context, LocationError error) {
  switch (error) {
    case LocationError.notEnabledLocation:
      return tr(context).please_enable_location_service;
    case LocationError.notGrantedLocationPermission:
      return tr(context).location_permission_required;
    case LocationError.getLocationTimeout:
      return tr(context).location_timeout_error;
  }
}
