import 'package:cloud_firestore/cloud_firestore.dart' as cf;
import 'package:deliverzler/features/home/data/models/address_model.dart';
import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:deliverzler/features/home/presentation/utils/enums.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.orderId,
    required super.date,
    required super.pickupOption,
    required super.paymentMethod,
    super.address,
    required super.userId,
    required super.userName,
    required super.userImage,
    required super.userPhone,
    required super.userNote,
    required super.employeeCancelNote,
    required super.deliveryStatus,
    required super.deliveryId,
    required super.deliveryGeoPoint,
  });

  Map<String, dynamic> toMap() {
    final addressModel =
        address != null ? AddressModel.fromAddress(address!) : null;

    return {
      'date': date,
      'pickupOption': pickupOption.name,
      'paymentMethod': paymentMethod,
      'addressModel': addressModel?.toMap(),
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'phone': userPhone,
      'note': userNote,
      'employeeCancelNote': employeeCancelNote,
      'deliveryStatus': deliveryStatus.name,
      'deliveryId': deliveryId,
      'deliveryGeoPoint': deliveryGeoPoint,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map, String docId) {
    return OrderModel(
      orderId: docId,
      date: map['date'],
      pickupOption: PickupOption.values.byName(map['pickupOption']),
      paymentMethod: map['paymentMethod'] as String,
      address: map['addressModel'] == null
          ? null
          : AddressModel.fromMap(map['addressModel']),
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      userImage: map['userImage'] as String,
      userPhone: map['userPhone'] as String,
      userNote: map['userNote'] as String,
      employeeCancelNote: map['employeeCancelNote'],
      deliveryStatus: DeliveryStatus.values.byName(map['deliveryStatus']),
      deliveryId: map['deliveryId'],
      deliveryGeoPoint: map['deliveryGeoPoint'],
    );
  }

  static List<OrderModel> parseListOfDocument(
      List<cf.QueryDocumentSnapshot> documents) {
    return List<OrderModel>.from(
      documents.map(
        (doc) => OrderModel.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        ),
      ),
    );
  }
}
