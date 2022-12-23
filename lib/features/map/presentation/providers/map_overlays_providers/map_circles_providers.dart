import 'package:deliverzler/features/map/presentation/providers/my_location_providers/my_location_circle_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapCirclesProvider =
    NotifierProvider.autoDispose<MapCirclesNotifier, Set<Circle>>(
        MapCirclesNotifier.new);

class MapCirclesNotifier extends AutoDisposeNotifier<Set<Circle>> {
  @override
  Set<Circle> build() {
    state = {};
    ref.listen<Circle>(
      myLocationCircleProvider,
      (previous, next) {
        _addCircle(next);
      },
      fireImmediately: true,
    );
    return state;
  }

  _addCircle(Circle circle) {
    final Set<Circle> mapCircles = Set.from(state);
    //If mapCircles already has circle with same id,
    //remove it first to avoid adding duplicate circles and replace it instead.
    mapCircles.removeWhere((c) => c.circleId == circle.circleId);
    mapCircles.add(circle);

    state = mapCircles;
  }
}
