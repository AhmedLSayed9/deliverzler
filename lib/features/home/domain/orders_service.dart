import '../../../core/presentation/utils/riverpod_framework.dart';
import '../presentation/providers/update_delivery_status_provider/update_delivery_status_provider.dart';

part 'orders_service.g.dart';

@Riverpod(keepAlive: true)
OrdersService ordersService(OrdersServiceRef ref) {
  return OrdersService(
    ref: ref,
  );
}

class OrdersService {
  OrdersService({required this.ref});

  final OrdersServiceRef ref;

  ({bool canProceed, bool isLoading}) orderAuthority({
    required String userId,
    required String? orderDeliveryId,
  }) {
    final canProceed = userId == orderDeliveryId;
    final isLoading = ref.read(updateDeliveryStatusControllerProvider).isLoading;
    return (canProceed: canProceed, isLoading: isLoading);
  }
}
