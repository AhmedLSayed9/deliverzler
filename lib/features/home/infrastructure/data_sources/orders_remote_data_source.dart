import '../../../../core/infrastructure/error/app_exception.dart';
import '../../../../core/infrastructure/network/main_api/api_callers/firebase_firestore_facade.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/value_objects.dart';
import '../dtos/order_dto.dart';
import '../dtos/update_delivery_geo_point_dto.dart';
import '../dtos/update_delivery_status_dto.dart';

part 'orders_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
OrdersRemoteDataSource ordersRemoteDataSource(OrdersRemoteDataSourceRef ref) {
  return OrdersRemoteDataSource(
    ref,
    firebaseFirestore: ref.watch(firebaseFirestoreFacadeProvider),
  );
}

class OrdersRemoteDataSource {
  OrdersRemoteDataSource(
    this.ref, {
    required this.firebaseFirestore,
  });

  final OrdersRemoteDataSourceRef ref;
  final FirebaseFirestoreFacade firebaseFirestore;

  static const String ordersCollectionPath = 'orders';

  static String orderDocPath(String id) => '$ordersCollectionPath/$id';

  Stream<List<OrderDto>> getUpcomingOrders() {
    final snapshots = firebaseFirestore.collectionStream(
      path: ordersCollectionPath,
      queryBuilder: (query) =>
          query.where('pickupOption', isEqualTo: PickupOption.delivery.name).where(
        'deliveryStatus',
        whereIn: [DeliveryStatus.upcoming.name, DeliveryStatus.onTheWay.name],
      ).orderBy('date', descending: true),
    );

    return snapshots.map((snapshot) => OrderDto.parseListOfDocument(snapshot.docs));
  }

  Future<OrderDto> getOrder(String orderId) async {
    final response = await firebaseFirestore.getData(path: orderDocPath(orderId));
    if (response.data() != null) {
      return OrderDto.fromFirestore(response);
    } else {
      throw const ServerException(
        type: ServerExceptionType.notFound,
        message: 'Order not found.',
      );
    }
  }

  Future<void> updateDeliveryStatus(UpdateDeliveryStatusDto params) async {
    await firebaseFirestore.updateData(
      path: orderDocPath(params.orderId),
      data: params.toJson(),
    );
  }

  Future<void> updateDeliveryGeoPoint(UpdateDeliveryGeoPointDto params) async {
    await firebaseFirestore.updateData(
      path: orderDocPath(params.orderId),
      data: params.toJson(),
    );
  }
}
