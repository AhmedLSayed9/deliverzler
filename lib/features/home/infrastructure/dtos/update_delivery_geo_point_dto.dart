import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/json_converters/geo_point_converter.dart';
import '../../domain/update_delivery_geopoint.dart';

part 'update_delivery_geo_point_dto.freezed.dart';

part 'update_delivery_geo_point_dto.g.dart';

@Freezed(toJson: true)
class UpdateDeliveryGeoPointDto with _$UpdateDeliveryGeoPointDto {
  const factory UpdateDeliveryGeoPointDto({
    required String orderId,
    @GeoPointConverter() required GeoPoint geoPoint,
  }) = _UpdateDeliveryGeoPointDto;

  factory UpdateDeliveryGeoPointDto.fromDomain(UpdateDeliveryGeoPoint dg) {
    return UpdateDeliveryGeoPointDto(
      orderId: dg.orderId,
      geoPoint: dg.geoPoint,
    );
  }
}
