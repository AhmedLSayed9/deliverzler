import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/data/error/app_exception.dart';
import '../../../../core/data/network/i_firebase_firestore_caller.dart';
import '../../../../core/data/network/main_api/api_callers/main_api_firestore_caller.dart';
import '../../domain/use_cases/update_delivery_geo_point_uc.dart';
import '../../domain/use_cases/update_delivery_status_uc.dart';
import '../../presentation/utils/enums.dart';
import '../models/order_model.dart';

part 'home_remote_data_source.g.dart';

abstract class IHomeRemoteDataSource {
  /// Calls the api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Stream<List<OrderModel>> getUpcomingOrders();

  Future<OrderModel> getOrder(String orderId);

  Future<void> updateDeliveryStatus(UpdateDeliveryStatusParams params);

  Future<void> updateDeliveryGeoPoint(UpdateDeliveryGeoPointParams params);
}

@Riverpod(keepAlive: true)
IHomeRemoteDataSource homeRemoteDataSource(HomeRemoteDataSourceRef ref) {
  return HomeRemoteDataSource(
    ref,
    firebaseFirestoreCaller: ref.watch(mainApiFirestoreCallerProvider),
  );
}

class HomeRemoteDataSource implements IHomeRemoteDataSource {
  HomeRemoteDataSource(
    this.ref, {
    required this.firebaseFirestoreCaller,
  });

  final HomeRemoteDataSourceRef ref;
  final IFirebaseFirestoreCaller firebaseFirestoreCaller;

  static const String ordersCollectionPath = 'orders';

  static String orderDocPath(String id) => '$ordersCollectionPath/$id';

  @override
  Stream<List<OrderModel>> getUpcomingOrders() {
    final snapshots = firebaseFirestoreCaller.collectionStream(
      path: ordersCollectionPath,
      queryBuilder: (query) => query
          .where('pickupOption', isEqualTo: PickupOption.delivery.name)
          .where('deliveryStatus', whereIn: [
        DeliveryStatus.upcoming.name,
        DeliveryStatus.onTheWay.name
      ]).orderBy('date', descending: true),
    );

    return snapshots
        .map((snapshot) => OrderModel.parseListOfDocument(snapshot.docs));
  }

  @override
  Future<OrderModel> getOrder(String orderId) async {
    final response =
        await firebaseFirestoreCaller.getData(path: orderDocPath(orderId));
    if (response.data() != null) {
      return OrderModel.fromFirestore(response);
    } else {
      throw const ServerException(
        type: ServerExceptionType.notFound,
        message: 'Order not found.',
      );
    }
  }

  @override
  Future<void> updateDeliveryStatus(UpdateDeliveryStatusParams params) async {
    await firebaseFirestoreCaller.updateData(
      path: orderDocPath(params.orderId),
      data: params.toJson(),
    );
  }

  @override
  Future<void> updateDeliveryGeoPoint(
      UpdateDeliveryGeoPointParams params) async {
    await firebaseFirestoreCaller.updateData(
      path: orderDocPath(params.orderId),
      data: params.toJson(),
    );
  }
}
