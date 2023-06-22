import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/presentation/utils/fp_framework.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../my_location_providers/my_location_marker_provider.dart';
import '../target_location_providers/target_location_marker_provider.dart';

part 'map_markers_providers.g.dart';

@riverpod
class MapMarkers extends _$MapMarkers {
  @override
  Set<Marker> build() {
    state = {};
    ref.listen<Option<Marker>>(
      myLocationMarkerProvider,
      (previous, next) {
        next.fold(
          () {},
          _addMarker,
        );
      },
      fireImmediately: true,
    );
    ref.listen<Marker>(
      targetLocationMarkerProvider,
      (previous, next) {
        _addMarker(next);
      },
      fireImmediately: true,
    );
    return state;
  }

  void _addMarker(Marker marker) {
    final mapMarkers = Set<Marker>.from(state);
    //If mapMarkers already has marker with same id,
    //remove it first to avoid adding duplicate markers and replace it instead.
    mapMarkers.removeWhere((m) => m.markerId == marker.markerId);
    mapMarkers.add(marker);

    state = mapMarkers;
  }
}
