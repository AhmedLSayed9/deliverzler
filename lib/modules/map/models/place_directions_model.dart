import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDirectionsModel {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final int distance;
  final String duration;

  const PlaceDirectionsModel({
    required this.bounds,
    required this.polylinePoints,
    required this.distance,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'bounds': bounds,
      'polylinePoints': polylinePoints,
      'distance': distance,
      'duration': duration,
    };
  }

  factory PlaceDirectionsModel.fromMap(Map<String, dynamic> map) {
    final _data = map['routes'][0];
    final _bounds = LatLngBounds(
      southwest: LatLng(
        _data['bounds']['southwest']['lat'],
        _data['bounds']['southwest']['lng'],
      ),
      northeast: LatLng(
        _data['bounds']['northeast']['lat'],
        _data['bounds']['northeast']['lng'],
      ),
    );
    final _polylinePoints = PolylinePoints().decodePolyline(
      _data['overview_polyline']['points'],
    );

    return PlaceDirectionsModel(
      bounds: _bounds,
      polylinePoints: _polylinePoints,
      distance: _data['legs'][0]['distance']['value'] as int,
      duration: _data['legs'][0]['duration']['text'] as String,
    );
  }
}
