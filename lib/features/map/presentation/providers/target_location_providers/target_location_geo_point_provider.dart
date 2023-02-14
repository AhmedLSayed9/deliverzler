import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/presentation/providers/provider_utils.dart';
import '../../../../../core/presentation/utils/functional.dart';
import '../../../../home/presentation/providers/selected_order_provider.dart';
import '../place_details_provider.dart';

part 'target_location_geo_point_provider.g.dart';

@riverpod
class TargetLocationGeoPoint extends _$TargetLocationGeoPoint
    with NotifierUpdate {
  @override
  Option<GeoPoint> build() {
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
  }
}
