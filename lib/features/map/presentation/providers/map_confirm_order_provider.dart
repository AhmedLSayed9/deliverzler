import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../../home/domain/use_cases/update_delivery_status_uc.dart';

part 'map_confirm_order_provider.g.dart';

enum MapConfirmOrderState {
  idle,
  success,
}

@riverpod
AsyncValue<MapConfirmOrderState> mapConfirmOrderStatus(
  MapConfirmOrderStatusRef ref,
) {
  final event = ref.watch(mapConfirmOrderEventProvider);
  return event.match(
    () => const AsyncData(MapConfirmOrderState.idle),
    (event) => ref.watch(mapConfirmOrderProvider(event)),
  );
}

@riverpod
class MapConfirmOrderEvent extends _$MapConfirmOrderEvent with NotifierUpdate {
  @override
  Option<Event<UpdateDeliveryStatusParams>> build() => const None();
}

@riverpod
Future<MapConfirmOrderState> mapConfirmOrder(
  MapConfirmOrderRef ref,
  Event<UpdateDeliveryStatusParams> event,
) async {
  await ref.watch(updateDeliveryStatusUCProvider).call(event.arg);
  return MapConfirmOrderState.success;
}
