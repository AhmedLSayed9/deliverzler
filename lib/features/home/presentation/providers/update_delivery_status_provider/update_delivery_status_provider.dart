import 'package:deliverzler/features/home/domain/use_cases/update_delivery_status_uc.dart';
import 'package:deliverzler/features/home/presentation/providers/update_delivery_status_provider/update_delivery_status_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateDeliveryStatusStateProvider =
    Provider.autoDispose<AsyncValue<UpdateDeliveryStatusState>>((ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(updateDeliveryStatusParamsProvider),
      data: (state) {
        state.mapOrNull(
          success: (_) => ref.invalidate(updateDeliveryStatusParamsProvider),
        );
      },
    );
  });

  final params = ref.watch(updateDeliveryStatusParamsProvider);
  return params.match(
    () => const AsyncData(UpdateDeliveryStatusState.initial()),
    (params) => ref.watch(updateDeliveryStatusProvider(params)),
  );
});

final updateDeliveryStatusParamsProvider =
    StateProvider.autoDispose<Option<UpdateDeliveryStatusParams>>((ref) {
  return const None();
});

final updateDeliveryStatusProvider = FutureProvider.autoDispose
    .family<UpdateDeliveryStatusState, UpdateDeliveryStatusParams>(
        (ref, params) async {
  await ref.watch(updateDeliveryStatusUCProvider).call(params);
  return UpdateDeliveryStatusState.success(
    orderId: params.orderId,
    deliveryStatus: params.deliveryStatus,
  );
});
