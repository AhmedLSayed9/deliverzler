import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveringOrderModel {
  final String orderId;
  GeoPoint? orderGeoPoint;
  bool didShowNotification;

  DeliveringOrderModel({
    required this.orderId,
    this.orderGeoPoint,
    this.didShowNotification = false,
  });
}
