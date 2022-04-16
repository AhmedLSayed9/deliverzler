import 'package:deliverzler/modules/home/viewmodels/location_change_callbacks_viewmodel.dart';
import 'package:deliverzler/modules/map/viewmodels/current_location_providers/current_loc_camera_position_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/current_location_providers/current_loc_marker_provider/current_loc_marker_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/map_overlays_providers/map_polylines_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/selected_place_providers/selected_place_directions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final mapLocationChangeViewModel =
    ChangeNotifierProvider.autoDispose<MapLocationChangeViewModel>(
        (ref) => MapLocationChangeViewModel(ref));

class MapLocationChangeViewModel extends ChangeNotifier {
  MapLocationChangeViewModel(this.ref) {
    _mapCallBacks = (location) async {
      final _currentLocCameraPositionProvider =
          ref.read(currentLocCameraPositionProvider.notifier);
      final _selectedPlaceDirectionsProvider =
          ref.read(selectedPlaceDirectionsProvider.notifier);

      _currentLocCameraPositionProvider.updateCameraPosition();
      await ref.read(currentLocMarkerProvider.notifier).updateMarker();
      if (ref.read(mapPolylinesProvider).isNotEmpty) {
        await _selectedPlaceDirectionsProvider.updateSelectedPlaceDirections();
      }
    };
  }

  Ref ref;
  late Function(Position location) _mapCallBacks;

  addMapLocationChangeCalls() async {
    ref
        .watch(locationChangeCallbacksViewModel)
        .addCallBack('map_callbacks', _mapCallBacks);
  }

  removeMapLocationChangeCalls() async {
    ref.watch(locationChangeCallbacksViewModel).removeCallBack('map_callbacks');
  }
}
