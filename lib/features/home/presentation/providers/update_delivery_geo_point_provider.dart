import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/presentation/extensions/future_extensions.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/update_delivery_geopoint.dart';
import '../../infrastructure/repos/orders_repo.dart';
import 'location_stream_provider.dart';
import 'my_delivering_orders_provider.dart';

part 'update_delivery_geo_point_provider.g.dart';

@riverpod
Future<void> updateDeliveryGeoPointState(
  UpdateDeliveryGeoPointStateRef ref,
) async {
  final myDeliveryOrders = ref.watch(myDeliveringOrdersProvider);
  final position = ref.watch(locationStreamProvider).valueOrNull;

  if (myDeliveryOrders.isEmpty || position == null) return;

  final futures = <Future<void>>[];
  for (final order in myDeliveryOrders) {
    final deliveryGeoPoint = UpdateDeliveryGeoPoint(
      orderId: order.id,
      geoPoint: GeoPoint(position.latitude, position.longitude),
    );
    futures.add(
      ref.watch(updateDeliveryGeoPointProvider(deliveryGeoPoint).future),
    );
  }
  //Run all calls in parallel to ensure all orders get updated in case the location is changing fast.
  await futures.wait.throwAllErrors();
}

@riverpod
Future<void> updateDeliveryGeoPoint(
  UpdateDeliveryGeoPointRef ref,
  UpdateDeliveryGeoPoint deliveryGeoPoint,
) async {
  await ref.watch(ordersRepoProvider).updateDeliveryGeoPoint(deliveryGeoPoint);
}
