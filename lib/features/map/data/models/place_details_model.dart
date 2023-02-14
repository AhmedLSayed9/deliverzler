import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/place_details.dart';

part 'place_details_model.freezed.dart';

part 'place_details_model.g.dart';

@Freezed(toJson: false)
class PlaceDetailsModel with _$PlaceDetailsModel {
  const PlaceDetailsModel._();

  const factory PlaceDetailsModel({
    @JsonKey(name: 'geometry', fromJson: _fromJsonGeoPoint)
        required GeoPoint geoPoint,
  }) = _PlaceDetailsModel;

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsModelFromJson(json);

  factory PlaceDetailsModel.fromEntity(PlaceDetails placeDetails) {
    return PlaceDetailsModel(
      geoPoint: placeDetails.geoPoint,
    );
  }

  PlaceDetails toEntity() {
    return PlaceDetails(
      geoPoint: geoPoint,
    );
  }
}

GeoPoint _fromJsonGeoPoint(Map<String, dynamic> json) {
  return GeoPoint(
    json['location']['lat'],
    json['location']['lng'],
  );
}
