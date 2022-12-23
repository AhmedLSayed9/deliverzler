import 'package:freezed_annotation/freezed_annotation.dart';

import 'value_objects.dart';

part 'update_delivery_status.freezed.dart';

@freezed
class UpdateDeliveryStatus with _$UpdateDeliveryStatus {
  const factory UpdateDeliveryStatus({
    required String orderId,
    required DeliveryStatus deliveryStatus,
    String? deliveryId,
    String? employeeCancelNote,
  }) = _UpdateDeliveryStatus;
}
