

import '../../../../../core/presentation/providers/provider_utils.dart';
import '../../../../../core/presentation/utils/fp_framework.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../home/presentation/providers/location_stream_provider.dart';
import '../../../domain/entities/place_directions.dart';
import '../../../domain/use_cases/get_place_directions_uc.dart';
import 'target_location_geo_point_provider.dart';

part 'target_location_directions_provider.g.dart';

@riverpod
Option<PlaceDirections> targetLocationDirections(
  TargetLocationDirectionsRef ref,
) {
  return ref.watch(getTargetLocationDirectionsProvider).maybeWhen(
        skipError: true,
        skipLoadingOnReload: true,
        skipLoadingOnRefresh: true,
        data: (directions) => Some(directions),
        orElse: () => const None<PlaceDirections>(),
      );
}

@riverpod
Future<PlaceDirections> getTargetLocationDirections(
  GetTargetLocationDirectionsRef ref,
) async {
  final myLocation =
      ref.watch(locationStreamProvider.select((value) => value.valueOrNull));
  if (myLocation == null) throw AbortedException();

  final targetLocation = ref
      .watch(targetLocationGeoPointProvider)
      .getOrElse(() => throw AbortedException());

  final cancelToken = ref.cancelToken();
  final params = GetPlaceDirectionsParams(
    cancelToken: cancelToken,
    origin: myLocation,
    destination: targetLocation,
  );

  return ref.watch(getPlaceDirectionsProvider(params).future);
}

@riverpod
Future<PlaceDirections> getPlaceDirections(
  GetPlaceDirectionsRef ref,
  GetPlaceDirectionsParams params,
) async {
  return ref.watch(getPlaceDirectionsUCProvider).call(params);
}
