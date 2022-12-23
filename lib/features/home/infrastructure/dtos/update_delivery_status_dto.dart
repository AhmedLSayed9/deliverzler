import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/update_delivery_status.dart';
import '../../domain/value_objects.dart';

part 'update_delivery_status_dto.freezed.dart';

part 'update_delivery_status_dto.g.dart';

@Freezed(toJson: true)
class UpdateDeliveryStatusDto with _$UpdateDeliveryStatusDto {
  const factory UpdateDeliveryStatusDto({
    @JsonKey(includeToJson: false) required String orderId,
    required DeliveryStatus deliveryStatus,
    @JsonKey(disallowNullValue: true) String? deliveryId,
    @JsonKey(disallowNullValue: true) String? employeeCancelNote,
  }) = _UpdateDeliveryStatusDto;

  factory UpdateDeliveryStatusDto.fromDomain(UpdateDeliveryStatus ds) {
    return UpdateDeliveryStatusDto(
      orderId: ds.orderId,
      deliveryStatus: ds.deliveryStatus,
      deliveryId: ds.deliveryId,
      employeeCancelNote: ds.employeeCancelNote,
    );
  }
}
