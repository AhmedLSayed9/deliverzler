import 'package:deliverzler/modules/home/viewmodels/location_service_provider/location_service_provider.dart';
import 'package:deliverzler/modules/map/services/map_service.dart';
import 'package:deliverzler/modules/map/viewmodels/current_location_providers/current_loc_camera_position_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/current_location_providers/current_loc_marker_provider/current_loc_marker_state.dart';
import 'package:deliverzler/modules/map/viewmodels/map_overlays_providers/map_circles_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/map_overlays_providers/map_markers_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentLocMarkerProvider = StateNotifierProvider.autoDispose<
    CurrentLocMarkerNotifier,
    CurrentLocMarkerState>((ref) => CurrentLocMarkerNotifier(ref));

class CurrentLocMarkerNotifier extends StateNotifier<CurrentLocMarkerState> {
  CurrentLocMarkerNotifier(this.ref)
      : super(const CurrentLocMarkerState.loading());

  final Ref ref;

  updateMarker() async {
    final _currentLocation =
        ref.read(locationServiceProvider).whenOrNull(available: (loc) => loc);
    final _position = ref.read(currentLocCameraPositionProvider.notifier).state;

    final _marker = await MapService.instance.getMyLocationMarker(
      position: _position.target,
      rotation: _currentLocation?.heading ?? 0,
    );
    final _circle = MapService.instance.getMyLocationCircle(
      position: _position.target,
      radius: _currentLocation?.accuracy ?? 0,
    );

    state = CurrentLocMarkerState.available(_marker, _circle);
    ref.read(mapMarkersProvider.notifier).addMarker(_marker);
    ref.read(mapCirclesProvider.notifier).addCircle(_circle);
  }
}
