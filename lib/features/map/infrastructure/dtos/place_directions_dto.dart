import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/place_directions.dart';

part 'place_directions_dto.freezed.dart';

part 'place_directions_dto.g.dart';

@Freezed(toJson: false)
class PlaceDirectionsDto with _$PlaceDirectionsDto {
  const PlaceDirectionsDto._();

  const factory PlaceDirectionsDto({
    @JsonKey(fromJson: _fromJsonBounds) required LatLngBounds bounds,
    @JsonKey(name: 'overview_polyline', fromJson: _fromJsonPolylinePoints)
    required List<PointLatLng> polylinePoints,
    @JsonKey(readValue: _readDistance) required int distance,
    @JsonKey(readValue: _readDuration) required String duration,
  }) = _PlaceDirectionsDto;

  factory PlaceDirectionsDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceDirectionsDtoFromJson(json);

  factory PlaceDirectionsDto.fromDomain(PlaceDirections placeDirections) {
    return PlaceDirectionsDto(
      bounds: placeDirections.bounds,
      polylinePoints: placeDirections.polylinePoints,
      distance: placeDirections.distance,
      duration: placeDirections.duration,
    );
  }

  PlaceDirections toDomain() {
    return PlaceDirections(
      bounds: bounds,
      polylinePoints: polylinePoints,
      distance: distance,
      duration: duration,
    );
  }
}

@Freezed(toJson: true)
class PlaceDirectionsQueryDto with _$PlaceDirectionsQueryDto {
  const factory PlaceDirectionsQueryDto({
    @JsonKey(toJson: _toJsonOrigin) required Position origin,
    @JsonKey(toJson: _toJsonDestination) required GeoPoint destination,
  }) = _PlaceDirectionsQueryDto;

  factory PlaceDirectionsQueryDto.fromDomain(PlaceDirectionsQuery query) {
    return PlaceDirectionsQueryDto(
      origin: query.origin,
      destination: query.destination,
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

String _toJsonOrigin(Position p) => '${p.latitude},${p.longitude}';

String _toJsonDestination(GeoPoint d) => '${d.latitude},${d.longitude}';
