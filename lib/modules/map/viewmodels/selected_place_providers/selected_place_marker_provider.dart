import 'package:deliverzler/modules/map/services/map_service.dart';
import 'package:deliverzler/modules/map/viewmodels/map_overlays_providers/map_markers_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/selected_place_providers/selected_place_camera_position_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final selectedPlaceMarkerProvider =
    StateNotifierProvider.autoDispose<SelectedPlaceMarkerNotifier, Marker?>(
        (ref) => SelectedPlaceMarkerNotifier(ref));

class SelectedPlaceMarkerNotifier extends StateNotifier<Marker?> {
  SelectedPlaceMarkerNotifier(this.ref) : super(null);

  final Ref ref;

  updateMarker({
    String? markerDescription,
    required Function(LatLng) onDragEnd,
  }) async {
    final _position =
        ref.read(selectedPlaceCameraPositionProvider.notifier).state;
    final _selectedPlaceMarker = MapService.instance.getSelectedPlaceMarker(
      position: _position.target,
      description: markerDescription ?? 'User Location',
      onDragEnd: onDragEnd,
    );

    state = _selectedPlaceMarker;
    ref.read(mapMarkersProvider.notifier).addMarker(_selectedPlaceMarker);
  }
}
