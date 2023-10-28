import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../home/domain/update_delivery_status.dart';
import '../../../home/infrastructure/repos/orders_repo.dart';

part 'map_confirm_order_provider.g.dart';

@riverpod
class MapConfirmOrderStatus extends _$MapConfirmOrderStatus {
  @override
  FutureOr<Option<Unit>> build() => const None();

  Future<void> confirmOrder(UpdateDeliveryStatus params) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(ordersRepoProvider).updateDeliveryStatus(params);
      return const Some(unit);
    });
  }
}
