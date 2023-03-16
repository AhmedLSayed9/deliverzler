// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/entities/order.dart';
import 'my_delivering_orders_provider.dart';

part 'selected_order_provider.g.dart';

@riverpod
class SelectedOrderId extends _$SelectedOrderId with NotifierUpdate {
  @override
  Option<String> build() => const None();
}

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
