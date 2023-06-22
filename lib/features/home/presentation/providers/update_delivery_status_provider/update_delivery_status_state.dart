import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/value_objects.dart';

part 'update_delivery_status_state.freezed.dart';

@freezed
class UpdateDeliveryStatusState with _$UpdateDeliveryStatusState {
  const factory UpdateDeliveryStatusState.idle() = Idle;

  const factory UpdateDeliveryStatusState.success(
      {required String orderId,
      required DeliveryStatus deliveryStatus,}) = Success;
}
