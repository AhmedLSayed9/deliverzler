import 'package:deliverzler/modules/home/viewmodels/home_state_providers.dart';
import 'package:deliverzler/modules/map/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedPlaceCameraPositionProvider = StateNotifierProvider.autoDispose<
    SelectedPlaceCameraPositionNotifier,
    CameraPosition>((ref) => SelectedPlaceCameraPositionNotifier(ref));

class SelectedPlaceCameraPositionNotifier
    extends StateNotifier<CameraPosition> {
  SelectedPlaceCameraPositionNotifier(this.ref) : super(getCameraPosition(ref));

  final Ref ref;

  static getCameraPosition(Ref ref) {
    final _geoPoint = ref.watch(selectedPlaceGeoPointProvider.notifier).state;
    return CameraPosition(
      target: LatLng(
        _geoPoint?.latitude ?? defaultLatLng.latitude,
        _geoPoint?.longitude ?? defaultLatLng.longitude,
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
