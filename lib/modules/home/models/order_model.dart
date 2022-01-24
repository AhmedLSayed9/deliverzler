import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/modules/home/models/address_model.dart';

class OrderModel {
  final String? orderId;
  final int date;
  final String orderStatus;
  final String paymentMethod;
  final AddressModel? addressModel;
  final String userId;
  final String userName;
  final String userImage;
  final String userPhone;
  final String userNote;
  final String? employeeCancelNote;
  final String orderDeliveryStatus;
  final String? deliveryId;
  final GeoPoint? deliveryGeoPoint;

  OrderModel({
    this.orderId,
    required this.date,
    required this.orderStatus,
    required this.paymentMethod,
    this.addressModel,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.userPhone,
    required this.userNote,
    required this.employeeCancelNote,
    required this.orderDeliveryStatus,
    required this.deliveryId,
    required this.deliveryGeoPoint,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'orderStatus': orderStatus,
      'paymentMethod': paymentMethod,
      'addressModel': addressModel != null ? addressModel!.toMap() : null,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'phone': userPhone,
      'note': userNote,
      'employeeCancelNote': employeeCancelNote,
      'orderDeliveryStatus': orderDeliveryStatus,
      'deliveryId': deliveryId,
      'deliveryGeoPoint': deliveryGeoPoint,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map, String docId) {
    return OrderModel(
      orderId: docId,
      date: map['date'],
      orderStatus: map['orderStatus'] as String,
      paymentMethod: map['paymentMethod'] as String,
      addressModel: map['addressModel'] == null
          ? null
          : AddressModel.fromMap(map['addressModel']),
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      userImage: map['userImage'] as String,
      userPhone: map['userPhone'] as String,
      userNote: map['userNote'] as String,
      employeeCancelNote: map['employeeCancelNote'],
      orderDeliveryStatus: map['orderDeliveryStatus'] as String,
      deliveryId: map['deliveryId'],
      deliveryGeoPoint: map['deliveryGeoPoint'],
    );
  }
}
