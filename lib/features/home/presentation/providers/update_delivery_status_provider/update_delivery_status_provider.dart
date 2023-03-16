

import '../../../../../core/presentation/providers/provider_utils.dart';
import '../../../../../core/presentation/utils/functional.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../domain/use_cases/update_delivery_status_uc.dart';
import 'update_delivery_status_state.dart';

part 'update_delivery_status_provider.g.dart';

@riverpod
AsyncValue<UpdateDeliveryStatusState> updateDeliveryStatusState(
    UpdateDeliveryStatusStateRef ref) {
  final event = ref.watch(updateDeliveryStatusEventProvider);
  return event.match(
    () => const AsyncData(UpdateDeliveryStatusState.idle()),
    (event) => ref.watch(updateDeliveryStatusProvider(event)),
  );
}

@riverpod
class UpdateDeliveryStatusEvent extends _$UpdateDeliveryStatusEvent
    with NotifierUpdate {
  @override
  Option<Event<UpdateDeliveryStatusParams>> build() => const None();
}

@riverpod
Future<UpdateDeliveryStatusState> updateDeliveryStatus(
  UpdateDeliveryStatusRef ref,
  Event<UpdateDeliveryStatusParams> event,
) async {
  final params = event.arg;
  await ref.watch(updateDeliveryStatusUCProvider).call(params);
  return UpdateDeliveryStatusState.success(
    orderId: params.orderId,
    deliveryStatus: params.deliveryStatus,
  );
}
