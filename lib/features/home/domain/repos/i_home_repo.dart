import 'dart:async';

import '../entities/order.dart';
import '../use_cases/update_delivery_geo_point_uc.dart';
import '../use_cases/update_delivery_status_uc.dart';

abstract class IHomeRepo {
  Stream<List<AppOrder>> getUpcomingOrders();

  Future<AppOrder> getOrder(String orderId);

  Future<void> updateDeliveryStatus(UpdateDeliveryStatusParams params);

  Future<void> updateDeliveryGeoPoint(UpdateDeliveryGeoPointParams params);
}
