import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/presentation/utils/functional.dart';
import '../../../domain/entities/place_directions.dart';
import '../../helpers/map_coordinates_helper.dart';
import '../target_location_providers/target_location_directions_provider.dart';

part 'map_polylines_provider.g.dart';

@riverpod
class MapPolylines extends _$MapPolylines {
  @override
  Set<Polyline> build() {
    state = {};
    ref.listen<Option<PlaceDirections>>(
      targetLocationDirectionsProvider,
      (previous, next) {
        next.fold(
          () {},
          (placeDirections) {
            _addPolylineFromDirections(placeDirections);
          },
        );
      },
      fireImmediately: true,
    );
    return state;
  }

  _addPolylineFromDirections(PlaceDirections placeDirections) {
    final polyline = MapCoordinatesHelper.getPolylineFromRouteCoordinates(
      polylinePoints: placeDirections.polylinePoints,
    );

    final Set<Polyline> mapPolylines = Set.from(state);
    //If mapPolylines already has polyline with same id,
    //remove it first to avoid adding duplicate polylines and replace it instead.
    mapPolylines.removeWhere((p) => p.polylineId == p.polylineId);
    mapPolylines.add(polyline);

    state = mapPolylines;
  }
}
