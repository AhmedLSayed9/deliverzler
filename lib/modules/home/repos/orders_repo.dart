import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:deliverzler/core/services/firebase_services/firebase_caller.dart';
import 'package:deliverzler/core/services/firebase_services/firestore_paths.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:deliverzler/modules/home/utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersRepoProvider = Provider<OrdersRepo>((ref) => OrdersRepo(ref));

class OrdersRepo {
  OrdersRepo(this.ref) {
    _userRepo = ref.read(userRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;
  final FirebaseCaller _firebaseCaller = FirebaseCaller.instance;

  Stream<List<OrderModel>> getUpcomingOrdersStream() {
    return _firebaseCaller.collectionStream<OrderModel>(
      path: FirestorePaths.orderPath(),
      queryBuilder: (query) => query
          .where('orderStatus', isEqualTo: describeEnum(OrderStatus.delivery))
          .where('orderDeliveryStatus', whereIn: [
        describeEnum(OrderDeliveryStatus.upcoming),
        describeEnum(OrderDeliveryStatus.onTheWay)
      ]).orderBy('date', descending: true),
      builder: (snapshotData, snapshotId) {
        return OrderModel.fromMap(snapshotData!, snapshotId);
      },
    );
  }

  Future<OrderModel?> getOrderById({
    required String orderId,
  }) async {
    return await FirebaseCaller.instance.getData(
      path: FirestorePaths.orderById(orderId: orderId),
      builder: (data, id) {
        if (data != null) {
          return OrderModel.fromMap(data, id!);
        } else {
          return null;
        }
      },
    );
  }

  Future cancelUserOrder({
    required String orderId,
    required String? employeeCancelNote,
  }) async {
    await _firebaseCaller.updateData(
      path: FirestorePaths.orderById(orderId: orderId),
      data: {
        'orderDeliveryStatus': describeEnum(OrderDeliveryStatus.canceled),
        'deliveryId': _userRepo.uid,
        'employeeCancelNote': employeeCancelNote,
      },
    );
  }

  Future deliverUserOrder({
    required String orderId,
  }) async {
    await _firebaseCaller.updateData(
      path: FirestorePaths.orderById(orderId: orderId),
      data: {
        'orderDeliveryStatus': describeEnum(OrderDeliveryStatus.onTheWay),
        'deliveryId': _userRepo.uid,
      },
    );
  }

  Future confirmUserOrder({
    required String orderId,
  }) async {
    await _firebaseCaller.updateData(
      path: FirestorePaths.orderById(orderId: orderId),
      data: {
        'orderDeliveryStatus': describeEnum(OrderDeliveryStatus.delivered),
      },
    );
  }

  Future updateDeliveryGeoPoint({
    required String orderId,
    required GeoPoint deliveryGeoPoint,
  }) async {
    await _firebaseCaller.updateData(
      path: FirestorePaths.orderById(orderId: orderId),
      data: {
        'deliveryGeoPoint': deliveryGeoPoint,
      },
    );
  }
}
