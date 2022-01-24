import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  final String state;
  final String city;
  final String street;
  final String mobile;
  final GeoPoint? geoPoint;

  AddressModel({
    required this.state,
    required this.city,
    required this.street,
    required this.mobile,
    required this.geoPoint,
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
}
