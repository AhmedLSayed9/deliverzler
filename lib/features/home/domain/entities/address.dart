import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String state;
  final String city;
  final String street;
  final String mobile;
  final GeoPoint? geoPoint;

  const Address({
    required this.state,
    required this.city,
    required this.street,
    required this.mobile,
    required this.geoPoint,
  });

  @override
  List<Object?> get props => [
        state,
        city,
        street,
        mobile,
        geoPoint,
      ];
}
