import 'dart:async';

import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/entities/order.dart';
import '../../domain/repos/i_home_repo.dart';
import '../../domain/use_cases/update_delivery_geo_point_uc.dart';
import '../../domain/use_cases/update_delivery_status_uc.dart';
import '../data_sources/home_remote_data_source.dart';

part 'home_repo.g.dart';

@Riverpod(keepAlive: true)
IHomeRepo homeRepo(HomeRepoRef ref) {
  return HomeRepo(
    remoteDataSource: ref.watch(homeRemoteDataSourceProvider),
  );
}

class HomeRepo implements IHomeRepo {
  HomeRepo({
    required this.remoteDataSource,
  });

  final IHomeRemoteDataSource remoteDataSource;

  @override
  Stream<List<AppOrder>> getUpcomingOrders() {
    return remoteDataSource.getUpcomingOrders().map(
          (orders) => orders.map((o) => o.toEntity()).toList(),
        );
  }

  @override
  Future<AppOrder> getOrder(String orderId) async {
    final order = await remoteDataSource.getOrder(orderId);
    return order.toEntity();
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
