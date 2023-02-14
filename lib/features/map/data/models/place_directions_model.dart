import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/place_directions.dart';

part 'place_directions_model.freezed.dart';

part 'place_directions_model.g.dart';

@Freezed(toJson: false)
class PlaceDirectionsModel with _$PlaceDirectionsModel {
  const PlaceDirectionsModel._();

  const factory PlaceDirectionsModel({
    @JsonKey(fromJson: _fromJsonBounds) required LatLngBounds bounds,
    @JsonKey(name: 'overview_polyline', fromJson: _fromJsonPolylinePoints)
        required List<PointLatLng> polylinePoints,
    @JsonKey(readValue: _readDistance) required int distance,
    @JsonKey(readValue: _readDuration) required String duration,
  }) = _PlaceDirectionsModel;

  factory PlaceDirectionsModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDirectionsModelFromJson(json);

  factory PlaceDirectionsModel.fromEntity(PlaceDirections placeDirections) {
    return PlaceDirectionsModel(
      bounds: placeDirections.bounds,
      polylinePoints: placeDirections.polylinePoints,
      distance: placeDirections.distance,
      duration: placeDirections.duration,
    );
  }

  PlaceDirections toEntity() {
    return PlaceDirections(
      bounds: bounds,
      polylinePoints: polylinePoints,
      distance: distance,
      duration: duration,
    );
  }
}

LatLngBounds _fromJsonBounds(Map<String, dynamic> json) {
  final southwestBounds = json['southwest'];
  final northeastBounds = json['northeast'];
  return LatLngBounds(
    southwest: LatLng(southwestBounds['lat'], southwestBounds['lng']),
    northeast: LatLng(northeastBounds['lat'], northeastBounds['lng']),
  );
}

List<PointLatLng> _fromJsonPolylinePoints(Map<String, dynamic> json) {
  return PolylinePoints().decodePolyline(
    json['points'],
  );
}

int _readDistance(Map json, String key) => json['legs'][0]['distance']['value'];

String _readDuration(Map json, String key) =>
    json['legs'][0]['duration']['text'];
