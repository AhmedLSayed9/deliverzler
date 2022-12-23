import 'dart:async';

import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:deliverzler/features/home/domain/use_cases/update_delivery_geo_point_uc.dart';
import 'package:deliverzler/features/home/domain/use_cases/update_delivery_status_uc.dart';

abstract class IHomeRepo {
  Stream<List<AppOrder>> getUpcomingOrders();

  Future<AppOrder> getOrder(String orderId);

  Future<void> updateDeliveryStatus(UpdateDeliveryStatusParams params);

  Future<void> updateDeliveryGeoPoint(UpdateDeliveryGeoPointParams params);
}
