import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/json_converters/geo_point_converter.dart';
import '../../domain/order.dart';
import '../../domain/value_objects.dart';

part 'order_dto.freezed.dart';

part 'order_dto.g.dart';

@Freezed(toJson: false)
class OrderDto with _$OrderDto {
  const OrderDto._();

  const factory OrderDto({
    @JsonKey(includeToJson: false) String? id,
    required int date,
    required PickupOption pickupOption,
    required String paymentMethod,
    @JsonKey(name: 'addressModel') required AddressDto? address,
    required String userId,
    required String userName,
    required String userImage,
    required String userPhone,
    required String userNote,
    required String? employeeCancelNote,
    required DeliveryStatus deliveryStatus,
    required String? deliveryId,
    @GeoPointConverter() required GeoPoint? deliveryGeoPoint,
  }) = _OrderDto;

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);

  factory OrderDto.fromFirestore(DocumentSnapshot document) {
    return OrderDto.fromJson(document.data() as Map<String, dynamic>)
        .copyWith(id: document.id);
  }

  static List<OrderDto> parseListOfDocument(
      List<QueryDocumentSnapshot> documents) {
    return List<OrderDto>.from(
      documents.map((doc) => OrderDto.fromFirestore(doc)),
    );
  }

  factory OrderDto.fromDomain(AppOrder order) {
    return OrderDto(
      id: order.id,
      date: order.date,
      pickupOption: order.pickupOption,
      paymentMethod: order.paymentMethod,
      address:
          order.address != null ? AddressDto.fromDomain(order.address!) : null,
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

  AppOrder toDomain() {
    return AppOrder(
      id: id ?? '',
      date: date,
      pickupOption: pickupOption,
      paymentMethod: paymentMethod,
      address: address?.toDomain(),
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

@Freezed(toJson: false)
class AddressDto with _$AddressDto {
  const AddressDto._();

  const factory AddressDto({
    required String state,
    required String city,
    required String street,
    required String mobile,
    @GeoPointConverter() required GeoPoint? geoPoint,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  factory AddressDto.fromDomain(Address address) {
    return AddressDto(
      state: address.state,
      city: address.city,
      street: address.street,
      mobile: address.mobile,
      geoPoint: address.geoPoint,
    );
  }

  Address toDomain() {
    return Address(
      state: state,
      city: city,
      street: street,
      mobile: mobile,
      geoPoint: geoPoint,
    );
  }
}
