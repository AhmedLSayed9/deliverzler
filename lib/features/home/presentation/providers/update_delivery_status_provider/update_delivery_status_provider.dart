import '../../../../../core/presentation/providers/provider_utils.dart';
import '../../../../../core/presentation/utils/fp_framework.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../domain/update_delivery_status.dart';
import '../../../infrastructure/repos/orders_repo.dart';
import 'update_delivery_status_state.dart';

part 'update_delivery_status_provider.g.dart';

@riverpod
FutureOr<UpdateDeliveryStatusState> updateDeliveryStatusState(
  UpdateDeliveryStatusStateRef ref,
) {
  final event = ref.watch(updateDeliveryStatusEventProvider);
  return event.match(() => const UpdateDeliveryStatusState.idle(), (event) {
    final updateDelivery = event.arg;
    return ref.watch(ordersRepoProvider).updateDeliveryStatus(updateDelivery).then(
          (_) => UpdateDeliveryStatusState.success(
            orderId: updateDelivery.orderId,
            deliveryStatus: updateDelivery.deliveryStatus,
          ),
        );
  });
}

@riverpod
class UpdateDeliveryStatusEvent extends _$UpdateDeliveryStatusEvent with NotifierUpdate {
  @override
  Option<Event<UpdateDeliveryStatus>> build() => const None();
}
