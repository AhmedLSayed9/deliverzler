import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:deliverzler/features/home/presentation/providers/my_delivering_orders_provider.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

part 'selected_order_provider.g.dart';

final selectedOrderIdProvider =
    StateProvider.autoDispose<Option<String>>((ref) => const None());

@riverpod
Option<AppOrder> selectedOrder(SelectedOrderRef ref) {
  final selectedOrderId = ref.watch(selectedOrderIdProvider);
  return selectedOrderId.match(
    () => const None(),
    (id) => ref.watch(
      myDeliveringOrdersProvider.select(
        (orders) => Option<AppOrder>.fromNullable(
          orders.firstWhereOrNull((order) => order.id == id),
        ),
      ),
    ),
  );
}
