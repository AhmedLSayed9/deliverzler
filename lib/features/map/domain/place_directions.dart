import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'place_directions.freezed.dart';

@freezed
class PlaceDirections with _$PlaceDirections {
  const factory PlaceDirections({
    required LatLngBounds bounds,
    required List<PointLatLng> polylinePoints,
    required int distance,
    required String duration,
  }) = _PlaceDirections;
}

@freezed
class PlaceDirectionsQuery with _$PlaceDirectionsQuery {
  const factory PlaceDirectionsQuery({
    required Position origin,
    required GeoPoint destination,
  }) = _PlaceDirectionsQuery;
}
