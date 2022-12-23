import 'dart:io';

import 'package:deliverzler/core/presentation/services/location_service/i_location_service.dart';
import 'package:deliverzler/core/presentation/services/location_service/location_service.dart';
import 'package:deliverzler/core/presentation/utils/location_settings.dart';
import 'package:deliverzler/features/home/presentation/utils/location_error.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_stream_provider.g.dart';

final locationStreamProvider =
    StreamProvider.autoDispose<Position>((ref) async* {
  final locationService = ref.watch(locationServiceProvider);

  await ref.watch(enableLocationProvider(locationService).future);
  await ref.watch(requestLocationPermissionProvider(locationService).future);

  yield* Geolocator.getPositionStream(
    locationSettings: locationService.getLocationSettings(),
    //Throttling location's stream as intervalDuration is not supported on iOS
  ).throttleTime(const Duration(seconds: locationChangeInterval)).handleError(
    (err, st) {
      Error.throwWithStackTrace(LocationError.getLocationTimeout, st);
    },
  );
});

@riverpod
Future<void> enableLocation(
  EnableLocationRef ref,
  ILocationService locationService,
) async {
  final enabled = await locationService.enableLocationService();
  if (!enabled) {
    Error.throwWithStackTrace(
        LocationError.notEnabledLocation, StackTrace.current);
  }
}

@riverpod
Future<void> requestLocationPermission(
  RequestLocationPermissionRef ref,
  ILocationService locationService,
) async {
  final whileInUseGranted = await locationService.requestWhileInUsePermission();
  if (!whileInUseGranted) {
    Error.throwWithStackTrace(
        LocationError.notGrantedLocationPermission, StackTrace.current);
  }

  if (Platform.isAndroid) {
    final alwaysGranted = await locationService.requestAlwaysPermission();
    if (!alwaysGranted) {
      Error.throwWithStackTrace(
          LocationError.notGrantedLocationPermission, StackTrace.current);
    }
  }
}
