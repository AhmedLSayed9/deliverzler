import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:deliverzler/modules/home/repos/orders_repo.dart';

final upcomingOrdersStreamProvider = StreamProvider<List<OrderModel>>((ref) {
  return ref.watch(ordersRepoProvider).getUpcomingOrdersStream();
});
