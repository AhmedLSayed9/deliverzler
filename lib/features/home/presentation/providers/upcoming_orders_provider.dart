import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/order.dart';
import '../../infrastructure/repos/orders_repo.dart';

part 'upcoming_orders_provider.g.dart';

@riverpod
Stream<List<AppOrder>> upcomingOrders(UpcomingOrdersRef ref) {
  final userId = ref.watch(currentUserProvider.select((user) => user.id));
  final ordersStream = ref.watch(ordersRepoProvider).getUpcomingOrders(userId);
  return ordersStream.distinct((previous, next) {
    //Compare prev,next streams by deep equals and skip if they're not equal,
    //while ignoring deliveryGeoPoint in Order entity's equality implementation.
    //This avoid updating the stream when the delivery updates his own deliveryGeoPoint
    //which will lead to unnecessary api calls.
    return previous.lock == next.lock;
  });
}
