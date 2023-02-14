import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/presentation/providers/provider_utils.dart';
import '../../../../../core/presentation/utils/functional.dart';
import '../../../domain/use_cases/update_delivery_status_uc.dart';
import 'update_delivery_status_state.dart';

part 'update_delivery_status_provider.g.dart';

@riverpod
AsyncValue<UpdateDeliveryStatusState> updateDeliveryStatusState(
    UpdateDeliveryStatusStateRef ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(updateDeliveryStatusEventProvider),
      data: (state) {
        state.mapOrNull(
          success: (_) => ref.invalidate(updateDeliveryStatusEventProvider),
        );
      },
    );
  });

  final event = ref.watch(updateDeliveryStatusEventProvider);
  return event.match(
    () => const AsyncData(UpdateDeliveryStatusState.initial()),
    (params) => ref.watch(updateDeliveryStatusProvider(params)),
  );
}

@riverpod
class UpdateDeliveryStatusEvent extends _$UpdateDeliveryStatusEvent
    with NotifierUpdate {
  @override
  Option<UpdateDeliveryStatusParams> build() => const None();
}

@riverpod
Future<UpdateDeliveryStatusState> updateDeliveryStatus(
  UpdateDeliveryStatusRef ref,
  UpdateDeliveryStatusParams params,
) async {
  await ref.watch(updateDeliveryStatusUCProvider).call(params);
  return UpdateDeliveryStatusState.success(
    orderId: params.orderId,
    deliveryStatus: params.deliveryStatus,
  );
}
