import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_delivery_geopoint.freezed.dart';

@freezed
class UpdateDeliveryGeoPoint with _$UpdateDeliveryGeoPoint {
  const factory UpdateDeliveryGeoPoint({
    required String orderId,
    required GeoPoint geoPoint,
  }) = _UpdateDeliveryGeoPoint;
}