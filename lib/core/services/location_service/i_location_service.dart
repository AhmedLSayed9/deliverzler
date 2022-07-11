import 'package:geolocator/geolocator.dart';

abstract class ILocationService {
  Future<bool> isLocationServiceEnabled();

  Future<bool> isWhileInUsePermissionGranted();

  Future<bool> isAlwaysPermissionGranted();

  Future<bool> enableLocationService();

  Future<bool> requestWhileInUsePermission();

  Future<bool> requestAlwaysPermission();

  LocationSettings getLocationSettings({
    LocationAccuracy? accuracy,
    int? interval,
    int? distanceFilter,
  });

  Future<Position?> getLocation();
}
