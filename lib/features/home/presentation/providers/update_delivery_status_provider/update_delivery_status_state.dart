import 'package:deliverzler/features/home/presentation/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_delivery_status_state.freezed.dart';

@freezed
class UpdateDeliveryStatusState with _$UpdateDeliveryStatusState {
  const factory UpdateDeliveryStatusState.initial() = Initial;

  const factory UpdateDeliveryStatusState.success(
      {required String orderId,
      required DeliveryStatus deliveryStatus}) = Success;
}
