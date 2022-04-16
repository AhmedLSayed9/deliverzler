import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapMarkersProvider =
    StateNotifierProvider.autoDispose<MapMarkersNotifier, Set<Marker>>(
        (ref) => MapMarkersNotifier());

class MapMarkersNotifier extends StateNotifier<Set<Marker>> {
  MapMarkersNotifier() : super({});

  addMarker(Marker marker) {
    if (state.any((m) => m.markerId == marker.markerId)) {
      state = Set.from(state)
        ..removeWhere((m) => m.markerId == marker.markerId);
    }
    state = Set.from(state)..add(marker);
  }
}
