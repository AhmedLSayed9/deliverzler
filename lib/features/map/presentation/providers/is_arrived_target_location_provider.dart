import 'package:deliverzler/features/map/presentation/providers/target_location_providers/target_location_directions_provider.dart';
import 'package:deliverzler/features/map/presentation/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isArrivedTargetLocationProvider = Provider.autoDispose<bool>((ref) {
  return ref.watch(targetLocationDirectionsProvider.select(
    (value) {
      return value.fold(
        () => false,
        (directions) => directions.distance < targetArriveDistance,
      );
    },
  ));
});
