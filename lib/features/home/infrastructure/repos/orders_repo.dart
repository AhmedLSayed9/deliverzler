import 'dart:async';

import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/order.dart';
import '../../domain/update_delivery_geopoint.dart';
import '../../domain/update_delivery_status.dart';
import '../../domain/value_objects.dart';
import '../data_sources/orders_remote_data_source.dart';
import '../dtos/update_delivery_geo_point_dto.dart';
import '../dtos/update_delivery_status_dto.dart';

part 'orders_repo.g.dart';

@Riverpod(keepAlive: true)
OrdersRepo ordersRepo(OrdersRepoRef ref) {
  return OrdersRepo(ref);
}

class OrdersRepo {
  OrdersRepo(this.ref);

  final Ref ref;
  OrdersRemoteDataSource get remoteDataSource => ref.read(ordersRemoteDataSourceProvider);

  Stream<List<AppOrder>> getUpcomingOrders(String userId) {
    return remoteDataSource.getUpcomingOrders().map(
          (orders) => orders
              .where(
                (order) {
                  final status = order.deliveryStatus;
                  return status == DeliveryStatus.upcoming ||
                      (status == DeliveryStatus.onTheWay && order.deliveryId == userId);
                },
              )
              .map((o) => o.toDomain())
              .toList(),
        );
  }

  Future<AppOrder> getOrder(String orderId) async {
    final order = await remoteDataSource.getOrder(orderId);
    return order.toDomain();
  }

  Future<void> updateDeliveryStatus(UpdateDeliveryStatus params) async {
    final dto = UpdateDeliveryStatusDto.fromDomain(params);
    await remoteDataSource.updateDeliveryStatus(dto);
  }

  Future<void> updateDeliveryGeoPoint(UpdateDeliveryGeoPoint params) async {
    final dto = UpdateDeliveryGeoPointDto.fromDomain(params);
    await remoteDataSource.updateDeliveryGeoPoint(dto);
  }
}
