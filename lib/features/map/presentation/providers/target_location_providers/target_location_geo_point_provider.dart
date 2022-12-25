import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/features/home/presentation/providers/selected_order_provider.dart';
import 'package:deliverzler/features/map/presentation/providers/place_details_provider.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final targetLocationGeoPointProvider =
    StateProvider.autoDispose<Option<GeoPoint>>((ref) {
  final currentPlaceDetails = ref.watch(currentPlaceDetailsProvider);

  return currentPlaceDetails.match(
    () => ref.watch(
      selectedOrderProvider.select(
        (order) => order.flatMap(
          (o) => Option<GeoPoint>.fromNullable(o.address?.geoPoint),
        ),
      ),
    ),
    (placeDetails) => Some(placeDetails.geoPoint),
  );
});
