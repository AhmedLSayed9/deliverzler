import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String state,
    required String city,
    required String street,
    required String mobile,
    required GeoPoint? geoPoint,
  }) = _Address;
}
