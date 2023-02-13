import 'package:deliverzler/core/presentation/providers/provider_utils.dart';
import 'package:deliverzler/features/home/domain/use_cases/update_delivery_status_uc.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_confirm_order_provider.g.dart';

enum MapConfirmOrderState {
  initial,
  success,
}

@riverpod
AsyncValue<MapConfirmOrderState> mapConfirmOrderStatus(
  MapConfirmOrderStatusRef ref,
) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(mapConfirmOrderEventProvider),
      data: (state) {
        if (state == MapConfirmOrderState.success) {
          ref.invalidate(mapConfirmOrderEventProvider);
        }
      },
    );
  });

  final event = ref.watch(mapConfirmOrderEventProvider);
  return event.match(
    () => const AsyncData(MapConfirmOrderState.initial),
    (params) => ref.watch(mapConfirmOrderProvider(params)),
  );
}

@riverpod
class MapConfirmOrderEvent extends _$MapConfirmOrderEvent with NotifierUpdate {
  @override
  Option<UpdateDeliveryStatusParams> build() => const None();
}

@riverpod
Future<MapConfirmOrderState> mapConfirmOrder(
  MapConfirmOrderRef ref,
  UpdateDeliveryStatusParams params,
) async {
  await ref.watch(updateDeliveryStatusUCProvider).call(params);
  return MapConfirmOrderState.success;
}
