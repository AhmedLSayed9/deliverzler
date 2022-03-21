import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:deliverzler/modules/home/viewmodels/delivering_orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/widgets/dialog_widget.dart';
import 'package:deliverzler/core/widgets/custom_snack_bar.dart';
import 'package:deliverzler/modules/home/components/dialogs/cancel_order_dialog.dart';
import 'package:deliverzler/modules/home/components/dialogs/confirm_choice_dialog.dart';
import 'package:deliverzler/modules/home/components/dialogs/order_details_dialog.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:deliverzler/modules/home/repos/orders_repo.dart';
import 'package:deliverzler/modules/home/viewmodels/home_state_providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

final orderDialogsViewModel =
    Provider<OrderDialogsViewModel>((ref) => OrderDialogsViewModel(ref));

class OrderDialogsViewModel {
  OrderDialogsViewModel(this.ref) {
    _ordersRepo = ref.watch(ordersRepoProvider);
    _deliveringOrdersProvider = ref.watch(deliveringOrdersProvider.notifier);
  }

  Ref ref;
  late OrdersRepo _ordersRepo;
  late DeliveringOrdersNotifier _deliveringOrdersProvider;

  showOrderDetailsDialog({required OrderModel orderModel}) {
    DialogWidget.showCustomDialog(
      context: NavigationService.context,
      child: OrderDetailsDialog(
        orderModel: orderModel,
      ),
    );
  }

  showCancelOrderDialog({required OrderModel orderModel}) async {
    if (_confirmDeliveryId(orderModel.deliveryId)) {
      await DialogWidget.showCustomDialog(
        context: NavigationService.context,
        child: CancelOrderDialog(
          orderModel: orderModel,
        ),
      ).then((value) async {
        if (value != null && value[0] == true) {
          final _result = await _ordersRepo.cancelUserOrder(
            orderId: orderModel.orderId!,
            employeeCancelNote: value[1],
          );
          _result.fold(
            (failure) {
              debugPrint(failure?.message);
              AppDialogs.showErrorDialog(message: failure?.message);
            },
            (isSet) {},
          );
        }
      });
    }
  }

  showDeliverOrderDialog({required OrderModel orderModel}) async {
    bool _confirm = await _confirmChoiceDialog(
        tr(NavigationService.context).doYouWantToDeliverTheOrder);
    if (_confirm) {
      final _result =
          await _ordersRepo.deliverUserOrder(orderId: orderModel.orderId!);
      _result.fold(
        (failure) {
          debugPrint(failure?.message);
          AppDialogs.showErrorDialog(message: failure?.message);
        },
        (isSet) {
          if (isSet) {
            setSelectedOrderProvidersAndGoToMap(orderModel);
            _deliveringOrdersProvider.addOrderToDeliveringOrders(
                orderId: orderModel.orderId!);
          }
        },
      );
    }
  }

  Future<bool> showConfirmOrderDialog({required OrderModel orderModel}) async {
    bool _orderConfirmed = false;

    if (_confirmDeliveryId(orderModel.deliveryId)) {
      bool _confirm = await _confirmChoiceDialog(
          tr(NavigationService.context).doYouWantToConfirmTheOrder);
      if (_confirm) {
        final _result =
            await _ordersRepo.confirmUserOrder(orderId: orderModel.orderId!);
        _result.fold(
          (failure) {
            debugPrint(failure?.message);
            AppDialogs.showErrorDialog(message: failure?.message);
          },
          (isSet) {
            if (isSet) {
              _deliveringOrdersProvider.deleteOrderFromDeliveringOrders(
                orderId: orderModel.orderId!,
              );
              _orderConfirmed = true;
            }
          },
        );
      }
    }
    return _orderConfirmed;
  }

  showMapForOrder({required OrderModel orderModel}) {
    if (_confirmDeliveryId(orderModel.deliveryId)) {
      setSelectedOrderProvidersAndGoToMap(orderModel);
      _deliveringOrdersProvider.addOrderToDeliveringOrders(
          orderId: orderModel.orderId!);
    }
  }

  bool _confirmDeliveryId(String? deliveryId) {
    if (deliveryId == ref.watch(userRepoProvider).uid) {
      return true;
    } else {
      CustomSnackBar.showDefaultSnackBar(
        NavigationService.context,
        title: tr(NavigationService.context).youCanNotProceedThisOrder,
        description:
            tr(NavigationService.context).youCanOnlyProceedOrdersYouDelivering,
      );
      return false;
    }
  }

  Future<bool> _confirmChoiceDialog(String message) async {
    bool _isConfirm = false;
    _isConfirm = await DialogWidget.showCustomDialog(
      context: NavigationService.context,
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
    ref.watch(selectedOrderProvider.notifier).state = orderModel;

    final _deliveringOrder = ref
        .read(deliveringOrdersProvider)
        .firstWhereOrNull((order) => order.orderId == orderModel.orderId);
    ref.watch(selectedOrderGeoPointProvider.notifier).state =
        _deliveringOrder?.orderGeoPoint ?? orderModel.addressModel?.geoPoint;

    NavigationService.push(
      isNamed: true,
      page: RoutePaths.map,
    );
  }
}
