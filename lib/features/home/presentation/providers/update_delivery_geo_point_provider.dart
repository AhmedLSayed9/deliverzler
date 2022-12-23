import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/features/home/domain/use_cases/update_delivery_geo_point_uc.dart';
import 'package:deliverzler/features/home/presentation/providers/location_stream_provider.dart';
import 'package:deliverzler/features/home/presentation/providers/my_delivering_orders_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateDeliveryGeoPointStatusProvider =
    FutureProvider.autoDispose<void>((ref) async {
  final myDeliveryOrders = ref.watch(myDeliveringOrdersProvider);
  final position = ref.watch(locationStreamProvider).valueOrNull;

  if (myDeliveryOrders.isEmpty || position == null) return;

  final List<Future<void>> futures = [];
  for (final order in myDeliveryOrders) {
    final params = UpdateDeliveryGeoPointParams(
      orderId: order.orderId,
      deliveryGeoPoint: GeoPoint(position.latitude, position.longitude),
    );
    futures.add(ref.watch(updateDeliveryGeoPointProvider(params).future));
  }
  //Run all calls in parallel to ensure all orders get updated in case the location is changing fast.
  await Future.wait(futures);
});

final updateDeliveryGeoPointProvider = FutureProvider.autoDispose
    .family<void, UpdateDeliveryGeoPointParams>((ref, params) async {
  await ref.watch(updateDeliveryGeoPointUCProvider).call(params);
});
