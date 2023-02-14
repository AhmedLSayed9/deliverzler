import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/constants.dart';
import 'target_location_providers/target_location_directions_provider.dart';

part 'is_arrived_target_location_provider.g.dart';

@riverpod
bool isArrivedTargetLocation(IsArrivedTargetLocationRef ref) {
  return ref.watch(targetLocationDirectionsProvider.select(
    (value) {
      return value.fold(
        () => false,
        (directions) => directions.distance < targetArriveDistance,
      );
    },
  ));
}
