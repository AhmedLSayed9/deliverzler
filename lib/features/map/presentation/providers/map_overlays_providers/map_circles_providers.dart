import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../my_location_providers/my_location_circle_provider.dart';

part 'map_circles_providers.g.dart';

@riverpod
class MapCircles extends _$MapCircles {
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

  void _addCircle(Circle circle) {
    final mapCircles = Set<Circle>.from(state);
    //If mapCircles already has circle with same id,
    //remove it first to avoid adding duplicate circles and replace it instead.
    mapCircles.removeWhere((c) => c.circleId == circle.circleId);
    mapCircles.add(circle);

    state = mapCircles;
  }
}
