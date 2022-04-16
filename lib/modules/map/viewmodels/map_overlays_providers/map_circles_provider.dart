import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapCirclesProvider =
    StateNotifierProvider.autoDispose<MapCirclesNotifier, Set<Circle>>(
        (ref) => MapCirclesNotifier());

class MapCirclesNotifier extends StateNotifier<Set<Circle>> {
  MapCirclesNotifier() : super({});

  addCircle(Circle circle) {
    if (state.any((c) => c.circleId == circle.circleId)) {
      state = Set.from(state)
        ..removeWhere((c) => c.circleId == circle.circleId);
    }
    state = Set.from(state)..add(circle);
  }
}
