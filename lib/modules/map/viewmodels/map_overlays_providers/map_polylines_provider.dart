import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapPolylinesProvider =
    StateNotifierProvider.autoDispose<MapPolylinesNotifier, Set<Polyline>>(
        (ref) => MapPolylinesNotifier());

class MapPolylinesNotifier extends StateNotifier<Set<Polyline>> {
  MapPolylinesNotifier() : super({});

  addPolyline(Polyline polyline) {
    if (state.any((p) => p.polylineId == polyline.polylineId)) {
      state = Set.from(state)
        ..removeWhere((p) => p.polylineId == polyline.polylineId);
    }
    state = Set.from(state)..add(polyline);
  }
}
