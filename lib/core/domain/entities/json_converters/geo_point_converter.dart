import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geoPoint) => geoPoint;

  @override
  GeoPoint toJson(GeoPoint geoPoint) => geoPoint;
}
