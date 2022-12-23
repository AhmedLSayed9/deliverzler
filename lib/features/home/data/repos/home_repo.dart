import 'dart:async';

import 'package:deliverzler/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:deliverzler/features/home/domain/repos/i_home_repo.dart';
import 'package:deliverzler/features/home/domain/use_cases/update_delivery_geo_point_uc.dart';
import 'package:deliverzler/features/home/domain/use_cases/update_delivery_status_uc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeRepoProvider = Provider<IHomeRepo>(
  (ref) => HomeRepo(
    remoteDataSource: ref.watch(homeRemoteDataSourceProvider),
  ),
);

class HomeRepo implements IHomeRepo {
  HomeRepo({
    required this.remoteDataSource,
  });

  final IHomeRemoteDataSource remoteDataSource;

  @override
  Stream<List<Order>> getUpcomingOrders() {
    return remoteDataSource.getUpcomingOrders();
  }

  @override
  Future<Order> getOrder(String orderId) async {
    final order = await remoteDataSource.getOrder(orderId);
    return order;
  }

  @override
  Future<void> updateDeliveryStatus(UpdateDeliveryStatusParams params) async {
    await remoteDataSource.updateDeliveryStatus(params);
  }

  @override
  Future<void> updateDeliveryGeoPoint(
      UpdateDeliveryGeoPointParams params) async {
    await remoteDataSource.updateDeliveryGeoPoint(params);
  }
}
