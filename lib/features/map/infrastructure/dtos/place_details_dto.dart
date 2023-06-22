import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/place_details.dart';

part 'place_details_dto.freezed.dart';

part 'place_details_dto.g.dart';

@Freezed(toJson: false)
class PlaceDetailsDto with _$PlaceDetailsDto {
  const factory PlaceDetailsDto({
    @JsonKey(name: 'geometry', fromJson: _fromJsonGeoPoint) required GeoPoint geoPoint,
  }) = _PlaceDetailsDto;
  const PlaceDetailsDto._();

  factory PlaceDetailsDto.fromJson(Map<String, dynamic> json) => _$PlaceDetailsDtoFromJson(json);

  factory PlaceDetailsDto.fromDomain(PlaceDetails placeDetails) {
    return PlaceDetailsDto(
      geoPoint: placeDetails.geoPoint,
    );
  }

  PlaceDetails toDomain() {
    return PlaceDetails(
      geoPoint: geoPoint,
    );
  }
}

GeoPoint _fromJsonGeoPoint(Map<String, dynamic> json) {
  return GeoPoint(
    // ignore: avoid_dynamic_calls
    json['location']['lat'] as double,
    // ignore: avoid_dynamic_calls
    json['location']['lng'] as double,
  );
}
