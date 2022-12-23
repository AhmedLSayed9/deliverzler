import 'package:deliverzler/core/presentation/extensions/auto_dispose_ref_extension.dart';
import 'package:deliverzler/features/home/presentation/providers/location_stream_provider.dart';
import 'package:deliverzler/features/map/domain/entities/place_directions.dart';
import 'package:deliverzler/features/map/domain/use_cases/get_place_directions_uc.dart';
import 'package:deliverzler/features/map/presentation/providers/target_location_providers/target_location_geo_point_provider.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final targetLocationDirectionsProvider =
    Provider.autoDispose<Option<PlaceDirections>>(
  (ref) {
    return ref.watch(getTargetLocationDirectionsProvider).maybeWhen(
          skipError: true,
          skipLoadingOnReload: true,
          skipLoadingOnRefresh: true,
          data: (directions) => Some(directions),
          orElse: () => const None<PlaceDirections>(),
        );
  },
);

class AbortedException implements Exception {}

final getTargetLocationDirectionsProvider =
    FutureProvider.autoDispose<PlaceDirections>(
  (ref) {
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
  },
);

final getPlaceDirectionsProvider = FutureProvider.autoDispose
    .family<PlaceDirections, GetPlaceDirectionsParams>(
  (ref, params) async {
    return ref.watch(getPlaceDirectionsUCProvider).call(params);
  },
);
