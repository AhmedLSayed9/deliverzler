import 'package:deliverzler/features/map/domain/entities/place_directions.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDirectionsModel extends PlaceDirections {
  const PlaceDirectionsModel({
    required super.bounds,
    required super.polylinePoints,
    required super.distance,
    required super.duration,
  });

  factory PlaceDirectionsModel.fromMap(Map<String, dynamic> map) {
    final data = map['routes'][0];
    final southwestBounds = data['bounds']['southwest'];
    final northeastBounds = data['bounds']['northeast'];
    final legs = data['legs'][0];

    final bounds = LatLngBounds(
      southwest: LatLng(southwestBounds['lat'], southwestBounds['lng']),
      northeast: LatLng(northeastBounds['lat'], northeastBounds['lng']),
    );

    final polylinePoints = PolylinePoints().decodePolyline(
      data['overview_polyline']['points'],
    );

    return PlaceDirectionsModel(
      bounds: bounds,
      polylinePoints: polylinePoints,
      distance: legs['distance']['value'],
      duration: legs['duration']['text'],
    );
  }
}
