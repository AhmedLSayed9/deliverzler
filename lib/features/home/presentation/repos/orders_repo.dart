/*

import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:deliverzler/auth/repos/user_repo.dart';
import 'package:deliverzler/core/domain/failures/failures.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:deliverzler/modules/home/utils/enums.dart';

final ordersRepoProvider = Provider<OrdersRepo>((ref) => OrdersRepo(ref));

class OrdersRepo {
  OrdersRepo(this.ref) {
    _userRepo = ref.watch(userRepoProvider);
    _firebaseCaller = ref.watch(firebaseCaller);
  }

  final Ref ref;
  late UserRepo _userRepo;
  late IFirebaseCaller _firebaseCaller;

  Stream<List<OrderModel>> getUpcomingOrdersStream() {
    return _firebaseCaller.collectionStream<OrderModel>(
      path: FirestorePaths.orderPath(),
      queryBuilder: (query) => query
          .where('pickupOption', isEqualTo: OrderStatus.delivery.name)
          .where('deliveryStatus', whereIn: [
        OrderDeliveryStatus.upcoming.name,
        OrderDeliveryStatus.onTheWay.name
      ]).orderBy('date', descending: true),
      builder: (snapshotData, snapshotId) {
        return OrderModel.fromMap(snapshotData!, snapshotId);
      },
    );
  }

  Future<Either<Failure?, OrderModel>> getOrderById({
    required String orderId,
  }) async {
    return await _firebaseCaller.getData(
      path: FirestorePaths.orderById(orderId: orderId),
      builder: (data, id) {
        if (data is! ServerFailure && data != null) {
          return Right(OrderModel.fromMap(data, id!));
        } else {
          return Left(data);
        }
      },
    );
  }

  Future<Either<Failure, bool>> cancelUserOrder({
    required String orderId,
    required String? employeeCancelNote,
  }) async {
    return await _firebaseCaller.updateData(
      path: FirestorePaths.orderById(orderId: orderId),
      data: {
        'deliveryStatus': describeEnum(OrderDeliveryStatus.canceled),
        'deliveryId': _userRepo.uid,
        'employeeCancelNote': employeeCancelNote,
      },
      builder: (data) {
        if (data is! ServerFailure && data == true) {
          return Right(data);
        } else {
          return Left(data);
        }
      },
    );
  }

  Future<Either<Failure, bool>> deliverUserOrder({
    required String orderId,
  }) async {
    return await _firebaseCaller.updateData(
      path: FirestorePaths.orderById(orderId: orderId),
      data: {
        'deliveryStatus': OrderDeliveryStatus.onTheWay.name,
        'deliveryId': _userRepo.uid,
      },
      builder: (data) {
        if (data is! ServerFailure && data == true) {
          return Right(data);
        } else {
          return Left(data);
        }
      },
    );
  }

  Future<Either<Failure, bool>> confirmUserOrder({
    required String orderId,
  }) async {
    return await _firebaseCaller.updateData(
      path: FirestorePaths.orderById(orderId: orderId),
      data: {
        'deliveryStatus': describeEnum(OrderDeliveryStatus.delivered),
      },
      builder: (data) {
        if (data is! ServerFailure && data == true) {
          return Right(data);
        } else {
          return Left(data);
        }
      },
    );
  }

  Future<Either<Failure, bool>> updateDeliveryGeoPoint({
    required String orderId,
    required GeoPoint deliveryGeoPoint,
  }) async {
    return await _firebaseCaller.updateData(
      path: FirestorePaths.orderById(orderId: orderId),
      data: {
        'deliveryGeoPoint': deliveryGeoPoint,
      },
      builder: (data) {
        if (data is! ServerFailure && data == true) {
          return Right(data);
        } else {
          return Left(data);
        }
      },
    );
  }
}
*/
