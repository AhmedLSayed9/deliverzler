import 'package:deliverzler/auth/repos/user_repo.dart';
import 'package:deliverzler/core/utils/toasts.dart';
import 'package:deliverzler/modules/home/viewmodels/delivering_orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/widgets/dialog_widget.dart';
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

  showOrderDetailsDialog(
    BuildContext context, {
    required OrderModel orderModel,
  }) {
    DialogWidget.showCustomDialog(
      context: context,
      child: OrderDetailsDialog(
        orderModel: orderModel,
      ),
    );
  }

  showCancelOrderDialog(
    BuildContext context, {
    required OrderModel orderModel,
  }) async {
    if (_confirmDeliveryId(context, orderModel.deliveryId)) {
      await DialogWidget.showCustomDialog(
        context: context,
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
              AppDialogs.showErrorDialog(
                context,
                message: failure.message,
              );
            },
            (isSet) {},
          );
        }
      });
    }
  }

  showDeliverOrderDialog(
    BuildContext context, {
    required OrderModel orderModel,
  }) async {
    bool _confirm = await _confirmChoiceDialog(
      context,
      tr(context).doYouWantToDeliverTheOrder,
    );
    if (_confirm) {
      final _result =
          await _ordersRepo.deliverUserOrder(orderId: orderModel.orderId!);
      _result.fold(
        (failure) {
          AppDialogs.showErrorDialog(
            context,
            message: failure.message,
          );
        },
        (isSet) {
          if (isSet) {
            setSelectedOrderProvidersAndGoToMap(context, orderModel);
            _deliveringOrdersProvider.addOrderToDeliveringOrders(
                orderId: orderModel.orderId!);
          }
        },
      );
    }
  }

  Future<bool> showConfirmOrderDialog(
    BuildContext context, {
    required OrderModel orderModel,
  }) async {
    bool _orderConfirmed = false;
    if (_confirmDeliveryId(context, orderModel.deliveryId)) {
      bool _confirm = await _confirmChoiceDialog(
        context,
        tr(context).doYouWantToConfirmTheOrder,
      );
      if (_confirm) {
        final _result =
            await _ordersRepo.confirmUserOrder(orderId: orderModel.orderId!);
        _result.fold(
          (failure) {
            AppDialogs.showErrorDialog(
              context,
              message: failure.message,
            );
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

  showMapForOrder(BuildContext context, {required OrderModel orderModel}) {
    if (_confirmDeliveryId(context, orderModel.deliveryId)) {
      setSelectedOrderProvidersAndGoToMap(context, orderModel);
      _deliveringOrdersProvider.addOrderToDeliveringOrders(
          orderId: orderModel.orderId!);
    }
  }

  bool _confirmDeliveryId(BuildContext context, String? deliveryId) {
    if (deliveryId == ref.watch(userRepoProvider).uid) {
      return true;
    } else {
      Toasts.showForegroundToast(
        context,
        title: tr(context).youCanNotProceedThisOrder,
        description: tr(context).youCanOnlyProceedOrdersYouDelivering,
      );
      return false;
    }
  }

  Future<bool> _confirmChoiceDialog(
    BuildContext context,
    String message,
  ) async {
    bool _isConfirm = false;
    _isConfirm = await DialogWidget.showCustomDialog(
      context: context,
      child: ConfirmChoiceDialog(
        message: message,
      ),
    ).then((value) {
      if (value == null) return false;
      return value[0];
    });
    return _isConfirm;
  }

  setSelectedOrderProvidersAndGoToMap(
      BuildContext context, OrderModel orderModel) {
    ref.watch(selectedOrderProvider.notifier).state = orderModel;

    final _deliveringOrder = ref
        .read(deliveringOrdersProvider)
        .firstWhereOrNull((order) => order.orderId == orderModel.orderId);
    ref.watch(selectedPlaceGeoPointProvider.notifier).state =
        _deliveringOrder?.orderGeoPoint ?? orderModel.addressModel?.geoPoint;

    NavigationService.push(
      context,
      isNamed: true,
      rootNavigator: true,
      page: RoutePaths.map,
    );
  }
}
