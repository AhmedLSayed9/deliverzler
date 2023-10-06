// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_directions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaceDirectionsDto _$$_PlaceDirectionsDtoFromJson(Map<String, dynamic> json) =>
    _$_PlaceDirectionsDto(
      bounds: _fromJsonBounds(json['bounds'] as Map<String, dynamic>),
      polylinePoints: _fromJsonPolylinePoints(json['overview_polyline'] as Map<String, dynamic>),
      distance: _readDistance(json, 'distance') as int,
      duration: _readDuration(json, 'duration') as String,
    );

Map<String, dynamic> _$$_PlaceDirectionsQueryDtoToJson(_$_PlaceDirectionsQueryDto instance) =>
    <String, dynamic>{
      'origin': _toJsonOrigin(instance.origin),
      'destination': _toJsonDestination(instance.destination),
    };
