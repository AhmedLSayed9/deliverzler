import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveringOrderModel {
  final String orderId;
  GeoPoint? orderGeoPoint;
  bool showedArriveNotification;

  DeliveringOrderModel({
    required this.orderId,
    this.orderGeoPoint,
    this.showedArriveNotification = false,
  });
}
