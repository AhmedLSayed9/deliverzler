import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/modules/home/repos/orders_repo.dart';
import 'package:deliverzler/modules/home/viewmodels/order_dialogs_viewmodel.dart';

final notificationOrderViewModel =
    ChangeNotifierProvider.family<NotificationOrderViewModel, String?>(
        (ref, orderId) => NotificationOrderViewModel(ref, orderId));

class NotificationOrderViewModel with ChangeNotifier {
  NotificationOrderViewModel(this.ref, this.notificationOrderId) {
    if (notificationOrderId != null) {
      navigateToNotificationOrder();
    }
  }

  Ref ref;
  String? notificationOrderId;

  navigateToNotificationOrder() async {
    try {
      final _order =
          await OrdersRepo.instance.getOrderById(orderId: notificationOrderId!);
      if (_order != null) {
        //Few delay to ensure dispose of old map viewmodels.
        await Future.delayed(const Duration(seconds: 1));
        ref
            .read(orderDialogsViewModel)
            .setSelectedOrderProvidersAndGoToMap(_order);
      }
    } catch (e) {
      debugPrint(e.toString());
      AppDialogs.showDefaultErrorDialog();
    }
  }
}
