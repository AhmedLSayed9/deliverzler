import 'package:deliverzler/modules/map/viewmodels/main_map_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapMarkersBoundsProvider =
    StateNotifierProvider.autoDispose<MapMarkersBoundsNotifier, LatLngBounds?>(
        (ref) => MapMarkersBoundsNotifier(ref));

class MapMarkersBoundsNotifier extends StateNotifier<LatLngBounds?> {
  MapMarkersBoundsNotifier(this.ref) : super(null);

  final Ref ref;

  addMarkersBounds(LatLngBounds bounds) {
    state = bounds;
    ref.read(mainMapViewModel.notifier).animateToBounds(bounds);
  }
}
