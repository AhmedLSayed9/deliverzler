import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/core/domain/entities/json_converters/geo_point_converter.dart';
import 'package:deliverzler/features/home/data/models/address_model.dart';
import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:deliverzler/features/home/presentation/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

@Freezed(toJson: false)
class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    @JsonKey(ignore: true) String? id,
    required int date,
    required PickupOption pickupOption,
    required String paymentMethod,
    @JsonKey(name: 'addressModel') required AddressModel? address,
    required String userId,
    required String userName,
    required String userImage,
    required String userPhone,
    required String userNote,
    required String? employeeCancelNote,
    required DeliveryStatus deliveryStatus,
    required String? deliveryId,
    @GeoPointConverter() required GeoPoint? deliveryGeoPoint,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  factory OrderModel.fromFirestore(DocumentSnapshot document) {
    return OrderModel.fromJson(document.data() as Map<String, dynamic>)
        .copyWith(id: document.id);
  }

  static List<OrderModel> parseListOfDocument(
      List<QueryDocumentSnapshot> documents) {
    return List<OrderModel>.from(
      documents.map((doc) => OrderModel.fromFirestore(doc)),
    );
  }

  factory OrderModel.fromEntity(AppOrder order) {
    return OrderModel(
      id: order.id,
      date: order.date,
      pickupOption: order.pickupOption,
      paymentMethod: order.paymentMethod,
      address: order.address != null
          ? AddressModel.fromEntity(order.address!)
          : null,
      userId: order.userId,
      userName: order.userName,
      userImage: order.userImage,
      userPhone: order.userPhone,
      userNote: order.userNote,
      employeeCancelNote: order.employeeCancelNote,
      deliveryStatus: order.deliveryStatus,
      deliveryId: order.deliveryId,
      deliveryGeoPoint: order.deliveryGeoPoint,
    );
  }

  AppOrder toEntity() {
    return AppOrder(
      id: id ?? '',
      date: date,
      pickupOption: pickupOption,
      paymentMethod: paymentMethod,
      address: address?.toEntity(),
      userId: userId,
      userName: userName,
      userImage: userImage,
      userPhone: userPhone,
      userNote: userNote,
      employeeCancelNote: employeeCancelNote,
      deliveryStatus: deliveryStatus,
      deliveryId: deliveryId,
      deliveryGeoPoint: deliveryGeoPoint,
    );
  }
}
