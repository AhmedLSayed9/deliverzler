import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/value_validators.dart';
import '../../../core/presentation/utils/fp_framework.dart';
import 'value_objects.dart';

part 'order.freezed.dart';

@freezed
class AppOrder with _$AppOrder {
  const AppOrder._();

  const factory AppOrder({
    required String id,
    required int date,
    required PickupOption pickupOption,
    required String paymentMethod,
    required Address? address,
    required String userId,
    required String userName,
    required String userImage,
    required String userPhone,
    required String userNote,
    required String? employeeCancelNote,
    required DeliveryStatus deliveryStatus,
    required String? deliveryId,
    required GeoPoint? deliveryGeoPoint,
  }) = _AppOrder;

  Option<String> get validatedUserPhone =>
      ValueValidators.isNumeric(userPhone) ? Some(userPhone) : none();

  //Use custom equality implementation to ignore deliveryGeoPoint value
  //this helps [upcomingOrdersProvider] to ignore deliveryGeoPoint in deep equality of distinct method
  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppOrder &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.pickupOption, pickupOption) ||
                other.pickupOption == pickupOption) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.userNote, userNote) ||
                other.userNote == userNote) &&
            (identical(other.employeeCancelNote, employeeCancelNote) ||
                other.employeeCancelNote == employeeCancelNote) &&
            (identical(other.deliveryStatus, deliveryStatus) ||
                other.deliveryStatus == deliveryStatus) &&
            (identical(other.deliveryId, deliveryId) ||
                other.deliveryId == deliveryId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
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
      deliveryId);
}
