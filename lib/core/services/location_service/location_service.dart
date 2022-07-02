import 'dart:developer';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:deliverzler/core/services/location_service/i_location_service.dart';
import 'package:deliverzler/core/utils/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/src/types/foreground_settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart' as loc;

final locationService = Provider<ILocationService>(
  (ref) => GeoLocatorLocationService(),
);

class GeoLocatorLocationService implements ILocationService {
  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<bool> isWhileInUsePermissionGranted() async {
    return await Geolocator.checkPermission() == LocationPermission.whileInUse;
  }

  @override
  Future<bool> isAlwaysPermissionGranted() async {
    return await Geolocator.checkPermission() == LocationPermission.always;
  }

  @override
  Future<bool> isTrackingPermissionGranted() async {
    final _status = await AppTrackingTransparency.trackingAuthorizationStatus;
    return (_status == TrackingStatus.notSupported ||
        _status == TrackingStatus.authorized);
  }

  @override
  Future<bool> enableLocationService() async {
    bool _serviceEnabled = await isLocationServiceEnabled();
    if (_serviceEnabled) {
      return true;
    } else {
      _serviceEnabled = await loc.Location().requestService();
      return _serviceEnabled;
    }
  }

  @override
  Future<bool> requestWhileInUsePermission() async {
    if (await isWhileInUsePermissionGranted()) {
      return true;
    } else {
      final _permissionGranted = await Geolocator.requestPermission();
      return _permissionGranted == LocationPermission.whileInUse;
    }
  }

  @override
  Future<bool> requestAlwaysPermission() async {
    if (await isAlwaysPermissionGranted()) {
      return true;
    } else {
      await Geolocator.requestPermission();
      return await isAlwaysPermissionGranted();
    }
  }

  //Request AppTrackingTransparency for IOS
  @override
  //Request AppTrackingTransparency for IOS
  Future<bool> requestTrackingPermission() async {
    try {
      if (await isTrackingPermissionGranted()) {
        return true;
      } else {
        //This fix: https://github.com/deniza/app_tracking_transparency/issues/29
        await Future.delayed(const Duration(milliseconds: 500));
        final _status =
            await AppTrackingTransparency.requestTrackingAuthorization();
        return (_status == TrackingStatus.notSupported ||
            _status == TrackingStatus.authorized);
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  LocationSettings getLocationSettings({
    LocationAccuracy? accuracy,
    int? interval,
    int? distanceFilter,
  }) {
    if (Platform.isAndroid) {
      return AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: distanceFilter ?? locationChangeDistance,
        intervalDuration: Duration(seconds: interval ?? locationChangeInterval),
        //Set foreground notification config to keep app alive in background
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationTitle: 'Deliverzler Attendance Service',
          notificationText:
              'Deliverzler will receive your location in background.',
          notificationIcon:
              AndroidResource(name: 'notification_icon', defType: 'drawable'),
          enableWakeLock: true,
        ),
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      return AppleSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: distanceFilter ?? locationChangeDistance,
        activityType: ActivityType.fitness,
        pauseLocationUpdatesAutomatically: true,
        //Set to true to keep app alive in background
        showBackgroundLocationIndicator: true,
      );
    } else {
      return LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: distanceFilter ?? locationChangeDistance,
      );
    }
  }

  @override
  Future<Position?> getLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: getLocationTimeLimit),
      );
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
