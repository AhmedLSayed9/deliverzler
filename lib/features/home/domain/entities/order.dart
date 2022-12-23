import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/features/home/domain/entities/address.dart';
import 'package:deliverzler/features/home/presentation/utils/enums.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String orderId;
  final int date;
  final PickupOption pickupOption;
  final String paymentMethod;
  final Address? address;
  final String userId;
  final String userName;
  final String userImage;
  final String userPhone;
  final String userNote;
  final String? employeeCancelNote;
  final DeliveryStatus deliveryStatus;
  final String? deliveryId;
  final GeoPoint? deliveryGeoPoint;

  const Order({
    required this.orderId,
    required this.date,
    required this.pickupOption,
    required this.paymentMethod,
    this.address,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.userPhone,
    required this.userNote,
    required this.employeeCancelNote,
    required this.deliveryStatus,
    required this.deliveryId,
    required this.deliveryGeoPoint,
  });

  @override
  List<Object?> get props => [
        orderId,
        date,
        pickupOption,
        paymentMethod,
        address,
        userId,
        userName,
        userImage,
        userPhone,
        userNote,
        employeeCancelNote,
        deliveryStatus,
        deliveryId,
      ];
}
