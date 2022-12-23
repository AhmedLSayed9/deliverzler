import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/features/map/domain/entities/place_details.dart';

class PlaceDetailsModel extends PlaceDetails {
  const PlaceDetailsModel({
    required super.geoPoint,
  });

  factory PlaceDetailsModel.fromMap(Map<String, dynamic> map) {
    return PlaceDetailsModel(
      geoPoint: GeoPoint(
        map['geometry']['location']['lat'],
        map['geometry']['location']['lng'],
      ),
    );
  }
}
