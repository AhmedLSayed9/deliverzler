import 'package:deliverzler/modules/home/viewmodels/location_service_provider/location_service_provider.dart';
import 'package:deliverzler/modules/map/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentLocCameraPositionProvider = StateNotifierProvider.autoDispose<
    CurrentLocCameraPositionNotifier,
    CameraPosition>((ref) => CurrentLocCameraPositionNotifier(ref));

class CurrentLocCameraPositionNotifier extends StateNotifier<CameraPosition> {
  CurrentLocCameraPositionNotifier(this.ref) : super(getCameraPosition(ref));

  final Ref ref;

  static getCameraPosition(Ref ref) {
    final _currentLocation =
        ref.read(locationServiceProvider).whenOrNull(available: (loc) => loc);
    return CameraPosition(
      target: LatLng(
        _currentLocation?.latitude ?? defaultLatLng.latitude,
        _currentLocation?.longitude ?? defaultLatLng.longitude,
      ),
      bearing: 0.0,
      tilt: 0.0,
      zoom: defaultMapZoom,
    );
  }

  updateCameraPosition() {
    state = getCameraPosition(ref);
  }
}
