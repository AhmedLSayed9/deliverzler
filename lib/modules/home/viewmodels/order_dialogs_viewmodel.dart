import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/services/navigation_service.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/core/utils/routes.dart';
import 'package:deliverzler/core/viewmodels/main_core_viewmodel.dart';
import 'package:deliverzler/core/widgets/dialog_widget.dart';
import 'package:deliverzler/core/widgets/snack_bar.dart';
import 'package:deliverzler/modules/home/components/dialogs/cancel_order_dialog.dart';
import 'package:deliverzler/modules/home/components/dialogs/confirm_choice_dialog.dart';
import 'package:deliverzler/modules/home/components/dialogs/order_details_dialog.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:deliverzler/modules/home/repos/orders_repo.dart';
import 'package:deliverzler/modules/home/viewmodels/main_orders_viewmodel.dart';
import 'package:deliverzler/modules/home/viewmodels/selected_order_providers.dart';

final orderDialogsViewModel = ChangeNotifierProvider<OrderDialogsViewModel>(
    (ref) => OrderDialogsViewModel(ref));

class OrderDialogsViewModel extends ChangeNotifier {
  OrderDialogsViewModel(this.ref) {
    _ordersVM = ref.read(mainOrdersViewModel);
  }

  Ref ref;
  late MainOrdersViewModel _ordersVM;

  String cancelNote = '';

  showOrderDetailsDialog({required OrderModel orderModel}) {
    DialogWidget.showCustomDialog(
      context: Get.context!,
      child: OrderDetailsDialog(
        orderModel: orderModel,
      ),
    );
  }

  showCancelOrderDialog({required OrderModel orderModel}) async {
    if (_confirmDeliveryId(orderModel.deliveryId)) {
      await DialogWidget.showCustomDialog(
        context: Get.context!,
        child: CancelOrderDialog(
          orderModel: orderModel,
        ),
      ).then((value) async {
        if (value != null && value[0] == true) {
          try {
            await OrdersRepo.instance.cancelUserOrder(
              orderId: orderModel.orderId!,
              employeeCancelNote: cancelNote,
            );
            _ordersVM.deleteOrderFromDeliveringOrders(
              orderId: orderModel.orderId!,
            );
          } catch (e) {
            debugPrint(e.toString());
            AppDialogs.showDefaultErrorDialog();
          }
        }
      });
    }
  }

  showDeliverOrderDialog({required OrderModel orderModel}) async {
    bool _confirm =
        await _confirmChoiceDialog(tr('doYouWantToDeliverTheOrder'));
    if (_confirm) {
      try {
        setSelectedOrderProvidersAndGoToMap(orderModel);
        await OrdersRepo.instance
            .deliverUserOrder(orderId: orderModel.orderId!);
        _ordersVM.addOrderToDeliveringOrders(orderId: orderModel.orderId!);
      } catch (e) {
        debugPrint(e.toString());
        AppDialogs.showDefaultErrorDialog();
      }
    }
  }

  Future<bool> showConfirmOrderDialog({required OrderModel orderModel}) async {
    if (_confirmDeliveryId(orderModel.deliveryId)) {
      bool _confirm =
          await _confirmChoiceDialog(tr('doYouWantToConfirmTheOrder'));
      if (_confirm) {
        try {
          await OrdersRepo.instance
              .confirmUserOrder(orderId: orderModel.orderId!);
          _ordersVM.deleteOrderFromDeliveringOrders(
            orderId: orderModel.orderId!,
          );
          return true;
        } catch (e) {
          debugPrint(e.toString());
          AppDialogs.showDefaultErrorDialog();
        }
      }
    }
    return false;
  }

  showMapForOrder({required OrderModel orderModel}) {
    if (_confirmDeliveryId(orderModel.deliveryId)) {
      setSelectedOrderProvidersAndGoToMap(orderModel);
      _ordersVM.addOrderToDeliveringOrders(orderId: orderModel.orderId!);
    }
  }

  bool _confirmDeliveryId(String? deliveryId) {
    if (deliveryId == ref.read(mainCoreViewModel).getCurrentUser()!.uId) {
      return true;
    } else {
      CustomSnackBar.showCommonRawSnackBar(
        Get.context!,
        title: tr('youCanNotProceedThisOrder'),
        description: tr('youCanOnlyProceedOrdersYouDelivering'),
      );
      return false;
    }
  }

  Future<bool> _confirmChoiceDialog(String message) async {
    bool _isConfirm = false;
    _isConfirm = await DialogWidget.showCustomDialog(
      context: Get.context!,
      child: ConfirmChoiceDialog(
        message: message,
      ),
    ).then((value) {
      if (value == null) return false;
      return value[0];
    });
    return _isConfirm;
  }

  setSelectedOrderProvidersAndGoToMap(OrderModel orderModel) {
    ref.read(selectedOrderProvider.notifier).state = orderModel;
    final _deliveringOrder = _ordersVM.deliveringOrdersList
        .firstWhereOrNull((order) => order.orderId == orderModel.orderId);
    ref.read(selectedOrderGeoPointProvider.notifier).state =
        _deliveringOrder?.orderGeoPoint ?? orderModel.addressModel?.geoPoint;
    NavigationService.navigateTo(
      navigationMethod: NavigationMethod.push,
      isNamed: true,
      page: RoutePaths.map,
    );
  }
}
