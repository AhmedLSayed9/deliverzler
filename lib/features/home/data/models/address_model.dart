import 'package:deliverzler/features/home/domain/entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.state,
    required super.city,
    required super.street,
    required super.mobile,
    required super.geoPoint,
  });

  Map<String, dynamic> toMap() {
    return {
      'state': state,
      'city': city,
      'street': street,
      'mobile': mobile,
      'geoPoint': geoPoint,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      state: map['state'] as String,
      city: map['city'] as String,
      street: map['street'] as String,
      mobile: map['mobile'] as String,
      geoPoint: map['geoPoint'],
    );
  }

  factory AddressModel.fromAddress(Address address) {
    return AddressModel(
      state: address.state,
      city: address.city,
      street: address.street,
      mobile: address.mobile,
      geoPoint: address.geoPoint,
    );
  }
}
