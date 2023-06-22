import 'package:flutter/material.dart';

import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/utils/dialogs.dart';
import '../../../../core/presentation/utils/toasts.dart';
import '../../domain/order.dart';
import '../components/dialogs/cancel_order_dialog.dart';
import '../components/dialogs/confirm_choice_dialog.dart';
import '../components/dialogs/order_details_dialog.dart';

abstract class OrderDialogHelper {
  static void showOrderDetailsDialog(
    BuildContext context, {
    required AppOrder order,
  }) {
    Dialogs.showCustomDialog(
      context,
      child: OrderDetailsDialog(
        order: order,
      ),
    );
  }

  static Future<String?> showCancelOrderDialog(BuildContext context) async {
    return Dialogs.showCustomDialog(
      context,
      child: const CancelOrderDialog(),
    ).then((result) async {
      final res = result as List<String>?;
      return res?[0];
    });
  }

  static bool confirmDeliveryId(
    BuildContext context, {
    required String deliveryId,
    required String? orderDeliveryId,
  }) {
    if (deliveryId == orderDeliveryId) {
      return true;
    } else {
      Toasts.showTitledToast(
        context,
        title: tr(context).youCanNotProceedThisOrder,
        description: tr(context).youCanOnlyProceedOrdersYouDelivering,
      );
      return false;
    }
  }

  static Future<bool> confirmChoiceDialog(
    BuildContext context,
    String message,
  ) async {
    return Dialogs.showCustomDialog(
      context,
      child: ConfirmChoiceDialog(
        message: message,
      ),
    ).then((result) {
      final res = result as List<String>?;
      if (res == null) return false;
      return res[0] as bool;
    });
  }
}
