import 'package:deliverzler/core/services/theme_service.dart';
import 'package:deliverzler/modules/map/viewmodels/current_location_providers/current_loc_camera_position_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/current_location_providers/current_loc_marker_provider/current_loc_marker_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/map_location_change_viewmodel.dart';
import 'package:deliverzler/modules/map/viewmodels/map_overlays_providers/map_markers_bounds_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/selected_place_providers/selected_place_directions_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:deliverzler/modules/map/services/map_service.dart';

final mainMapViewModel = ChangeNotifierProvider.autoDispose<MainMapViewModel>(
    (ref) => MainMapViewModel(ref));

class MainMapViewModel extends ChangeNotifier {
  MainMapViewModel(this.ref) {
    initData();
  }

  final Ref ref;

  GoogleMapController? mapController;

  initData() async {
    await ref.read(currentLocMarkerProvider.notifier).updateMarker();
    await ref
        .read(selectedPlaceDirectionsProvider.notifier)
        .setSelectedPlaceByGeoPoint();
    ref.read(mapLocationChangeViewModel.notifier).addMapLocationChangeCalls();
  }

  onMapCreated(GoogleMapController controller) async {
    await controller.setMapStyle(
      await MapService.instance.mapStyle(ThemeService.instance.isDarkMode()),
    );
    mapController = controller;
  }

  changeMapStyle({required bool isDarkMode}) async {
    await mapController
        ?.setMapStyle(await MapService.instance.mapStyle(isDarkMode));
  }

  animateToLocation(CameraPosition cameraPosition) {
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  animateToBounds(LatLngBounds bounds) {
    mapController?.animateCamera(
      CameraUpdate.newLatLngBounds(
        bounds,
        60,
      ),
    );
  }

  handleFABonPressed() {
    final _mapBounds = ref.read(mapMarkersBoundsProvider);
    if (_mapBounds == null) {
      animateToLocation(ref.read(currentLocCameraPositionProvider));
    } else {
      animateToBounds(_mapBounds);
    }
  }

  @override
  void dispose() {
    ref
        .read(mapLocationChangeViewModel.notifier)
        .removeMapLocationChangeCalls();
    mapController?.dispose();
    super.dispose();
  }
}
