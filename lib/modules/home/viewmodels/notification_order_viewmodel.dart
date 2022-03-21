import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/modules/home/repos/orders_repo.dart';
import 'package:deliverzler/modules/home/viewmodels/order_dialogs_viewmodel.dart';

final notificationOrderViewModel = Provider<NotificationOrderViewModel>(
    (ref) => NotificationOrderViewModel(ref));

class NotificationOrderViewModel {
  NotificationOrderViewModel(this.ref);

  Ref ref;

  navigateToNotificationOrder(String notificationOrderId) async {
    try {
      final _order = await ref
          .watch(ordersRepoProvider)
          .getOrderById(orderId: notificationOrderId);
      if (_order != null) {
        //Few delay to ensure dispose of old map viewmodels.
        await Future.delayed(const Duration(seconds: 1));
        ref
            .watch(orderDialogsViewModel)
            .setSelectedOrderProvidersAndGoToMap(_order);
      }
    } catch (e) {
      debugPrint(e.toString());
      AppDialogs.showErrorDialog();
    }
  }
}
