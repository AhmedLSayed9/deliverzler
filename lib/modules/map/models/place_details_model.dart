import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceDetailsModel {
  final GeoPoint geoPoint;

  PlaceDetailsModel({
    required this.geoPoint,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': geoPoint.latitude,
      'lng': geoPoint.longitude,
    };
  }

  factory PlaceDetailsModel.fromMap(Map<String, dynamic> map) {
    return PlaceDetailsModel(
      geoPoint: GeoPoint(
        map['geometry']['location']['lat'],
        map['geometry']['location']['lng'],
      ),
    );
  }
}
