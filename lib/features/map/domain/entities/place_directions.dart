import 'package:equatable/equatable.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDirections extends Equatable {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final int distance;
  final String duration;

  const PlaceDirections({
    required this.bounds,
    required this.polylinePoints,
    required this.distance,
    required this.duration,
  });

  @override
  List<Object?> get props => [
        bounds,
        distance,
        duration,
      ];
}
