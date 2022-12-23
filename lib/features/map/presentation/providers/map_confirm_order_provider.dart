import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../home/domain/update_delivery_status.dart';
import '../../../home/infrastructure/repos/orders_repo.dart';

part 'map_confirm_order_provider.g.dart';

enum MapConfirmOrderState {
  idle,
  success,
}

@riverpod
FutureOr<MapConfirmOrderState> mapConfirmOrderStatus(
  MapConfirmOrderStatusRef ref,
) {
  final event = ref.watch(mapConfirmOrderEventProvider);
  return event.match(
    () => MapConfirmOrderState.idle,
    (event) => ref
        .watch(ordersRepoProvider)
        .updateDeliveryStatus(event.arg)
        .then((_) => MapConfirmOrderState.success),
  );
}

@riverpod
class MapConfirmOrderEvent extends _$MapConfirmOrderEvent with NotifierUpdate {
  @override
  Option<Event<UpdateDeliveryStatus>> build() => const None();
}
