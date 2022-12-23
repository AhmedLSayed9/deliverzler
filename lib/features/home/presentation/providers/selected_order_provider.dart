import 'package:deliverzler/features/home/domain/entities/order.dart' as app;
import 'package:deliverzler/features/home/presentation/providers/my_delivering_orders_provider.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

final selectedOrderIdProvider =
    StateProvider.autoDispose<Option<String>>((ref) => const None());

final selectedOrderProvider = Provider.autoDispose<Option<app.Order>>((ref) {
  final selectedOrderId = ref.watch(selectedOrderIdProvider);
  return selectedOrderId.match(
    () => const None(),
    (id) => ref.watch(
      myDeliveringOrdersProvider.select(
        (orders) => Option<app.Order>.fromNullable(
          orders.firstWhereOrNull((order) => order.orderId == id),
        ),
      ),
    ),
  );
});
