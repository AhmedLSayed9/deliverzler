import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PlaceDetails extends Equatable {
  final GeoPoint geoPoint;

  const PlaceDetails({
    required this.geoPoint,
  });

  @override
  List<Object?> get props => [
        geoPoint,
      ];
}
