import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_details.freezed.dart';

@freezed
class PlaceDetails with _$PlaceDetails {
  const factory PlaceDetails({
    required GeoPoint geoPoint,
  }) = _PlaceDetails;
}
