import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import 'package:deliverzler/modules/map/utils/constants.dart';

class LocationService {
  LocationService._();

  static final instance = LocationService._();

  Location location = Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  bool? _bgModeEnabled;

  Future<bool> enableLocationService() async {
    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled!) {
      return true;
    } else {
      _serviceEnabled = await location.requestService();
      return _serviceEnabled!;
    }
  }

  Future<PermissionStatus> requestLocationPermission() async {
    _permissionGranted = await Location().hasPermission();
    if (_permissionGranted == PermissionStatus.granted) {
      return PermissionStatus.granted;
    } else {
      _permissionGranted = await location.requestPermission();
      return _permissionGranted!;
    }
  }

  Future<bool> enableBackgroundMode() async {
    _bgModeEnabled = await location.isBackgroundModeEnabled();
    if (_bgModeEnabled!) {
      return true;
    } else {
      try {
        await location.enableBackgroundMode();
      } catch (e) {
        debugPrint(e.toString());
      }
      try {
        _bgModeEnabled = await location.enableBackgroundMode();
      } catch (e) {
        debugPrint(e.toString());
      }
      return _bgModeEnabled!;
    }
  }

  initSettings({
    LocationAccuracy? accuracy,
    int? interval,
    double? distanceFilter,
  }) async {
    try {
      await location.changeSettings(
        accuracy: accuracy ?? LocationAccuracy.high,
        interval: interval ?? locationChangeInterval,
        distanceFilter: distanceFilter ?? locationChangeDistance,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<LocationData?> getLocation() async {
    try {
      return location.getLocation();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool> locationServiceEnabled() async {
    return location.serviceEnabled();
  }
}
