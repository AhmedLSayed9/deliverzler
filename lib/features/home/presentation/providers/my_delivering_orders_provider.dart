import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:deliverzler/features/home/presentation/utils/enums.dart';
import 'package:deliverzler/features/home/presentation/providers/upcoming_orders_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_delivering_orders_provider.g.dart';

@riverpod
List<AppOrder> myDeliveringOrders(MyDeliveringOrdersRef ref) {
  final userId = ref.watch(currentUserProvider.select((user) => user.id));
  final orders = ref.watch(
    upcomingOrdersProvider.select(
      (orders) => orders.valueOrNull
          ?.where((order) =>
              order.deliveryId == userId &&
              order.deliveryStatus == DeliveryStatus.onTheWay)
          .toList(),
    ),
  );
  return orders ?? [];
}
