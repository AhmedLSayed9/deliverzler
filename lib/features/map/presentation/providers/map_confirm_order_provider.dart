import 'package:deliverzler/features/home/domain/use_cases/update_delivery_status_uc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum MapConfirmOrderState {
  initial,
  success,
}

final mapConfirmOrderStatusProvider =
    Provider.autoDispose<AsyncValue<MapConfirmOrderState>>((ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(mapConfirmOrderParamsProvider),
      data: (state) {
        if (state == MapConfirmOrderState.success) {
          ref.invalidate(mapConfirmOrderParamsProvider);
        }
      },
    );
  });

  final params = ref.watch(mapConfirmOrderParamsProvider);
  return params.match(
    () => const AsyncData(MapConfirmOrderState.initial),
    (params) => ref.watch(mapConfirmOrderProvider(params)),
  );
});

final mapConfirmOrderParamsProvider =
    StateProvider.autoDispose<Option<UpdateDeliveryStatusParams>>((ref) {
  return const None();
});

final mapConfirmOrderProvider = FutureProvider.autoDispose
    .family<MapConfirmOrderState, UpdateDeliveryStatusParams>(
        (ref, params) async {
  await ref.watch(updateDeliveryStatusUCProvider).call(params);
  return MapConfirmOrderState.success;
});
