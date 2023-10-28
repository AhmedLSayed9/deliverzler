import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../domain/update_delivery_status.dart';
import '../../../infrastructure/repos/orders_repo.dart';
import 'update_delivery_status_state.dart';

part 'update_delivery_status_provider.g.dart';

@riverpod
class UpdateDeliveryStatusController extends _$UpdateDeliveryStatusController {
  @override
  FutureOr<UpdateDeliveryStatusState> build() => const UpdateDeliveryStatusState.idle();

  Future<void> updateStatus(UpdateDeliveryStatus params) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(ordersRepoProvider).updateDeliveryStatus(params);

      return UpdateDeliveryStatusState.success(
        orderId: params.orderId,
        deliveryStatus: params.deliveryStatus,
      );
    });
  }
}
