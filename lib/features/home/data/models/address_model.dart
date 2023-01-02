import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/core/domain/entities/json_converters/geo_point_converter.dart';
import 'package:deliverzler/features/home/domain/entities/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';

part 'address_model.g.dart';

@Freezed(toJson: false)
class AddressModel with _$AddressModel {
  const AddressModel._();

  const factory AddressModel({
    required String state,
    required String city,
    required String street,
    required String mobile,
    @GeoPointConverter() required GeoPoint? geoPoint,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  factory AddressModel.fromEntity(Address address) {
    return AddressModel(
      state: address.state,
      city: address.city,
      street: address.street,
      mobile: address.mobile,
      geoPoint: address.geoPoint,
    );
  }

  Address toEntity() {
    return Address(
      state: state,
      city: city,
      street: street,
      mobile: mobile,
      geoPoint: geoPoint,
    );
  }
}
