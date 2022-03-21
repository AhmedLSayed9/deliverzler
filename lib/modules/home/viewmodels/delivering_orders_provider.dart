import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/services/init_services/local_notification_service.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/modules/home/repos/orders_repo.dart';
import 'package:deliverzler/modules/home/viewmodels/home_state_providers.dart';
import 'package:deliverzler/modules/map/models/delivering_order_model.dart';
import 'package:deliverzler/modules/map/services/map_service.dart';
import 'package:deliverzler/modules/map/utils/constants.dart';
import 'package:deliverzler/modules/notifications/models/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deliveringOrdersProvider =
    StateNotifierProvider<DeliveringOrdersNotifier, List<DeliveringOrderModel>>(
        (ref) => DeliveringOrdersNotifier(ref));

class DeliveringOrdersNotifier
    extends StateNotifier<List<DeliveringOrderModel>> {
  DeliveringOrdersNotifier(this.ref) : super([]);

  final Ref ref;

  addOrderToDeliveringOrders({required String orderId}) {
    final isExist = state.firstWhereOrNull((order) => order.orderId == orderId);
    if (isExist == null) {
      state.add(DeliveringOrderModel(orderId: orderId));
    }
  }

  addLocationToDeliveringOrder({
    required String orderId,
    required GeoPoint orderGeoPoint,
  }) {
    state.firstWhereOrNull((order) => order.orderId == orderId)?.orderGeoPoint =
        orderGeoPoint;
  }

  deleteOrderFromDeliveringOrders({required String orderId}) {
    state.removeWhere((order) => order.orderId == orderId);
  }

  updateDeliveryGeoPointForDeliveringOrders() async {
    for (var order in state) {
      final _result =
          await ref.watch(ordersRepoProvider).updateDeliveryGeoPoint(
                orderId: order.orderId,
                deliveryGeoPoint: GeoPoint(
                  ref.watch(currentLocationProvider.notifier).state!.latitude,
                  ref.watch(currentLocationProvider.notifier).state!.longitude,
                ),
              );
      _result.fold(
        (failure) {
          debugPrint(failure?.message);
          AppDialogs.showErrorDialog(message: failure?.message);
        },
        (isSet) {},
      );
    }
  }

  //Send local notification when any order arrive.
  checkArrivedDeliveringOrders() {
    for (var order in state) {
      if (order.orderGeoPoint != null && order.didShowNotification == false) {
        final _distance = MapService.instance.getDistanceBetweenTwoCoordinates(
          firstLocation: LatLng(
            order.orderGeoPoint!.latitude,
            order.orderGeoPoint!.longitude,
          ),
          secondLocation: LatLng(
            ref.watch(currentLocationProvider.notifier).state!.latitude,
            ref.watch(currentLocationProvider.notifier).state!.longitude,
          ),
        );
        if (_distance < locationArriveDistance) {
          showOrderArrivedNotification(order.orderId);
          order.didShowNotification = true;
        }
      }
    }
  }

  showOrderArrivedNotification(String orderId) {
    final _notificationModel = NotificationModel(
      route: RoutePaths.home,
      data: {'orderId': orderId},
    );
    LocalNotificationService.instance.showInstantNotification(
      title: tr(NavigationService.context).arrivedLocation,
      body: tr(NavigationService.context).youAreCloseToLocationArea,
      payload: _notificationModel.toJsonString(),
    );
  }
}
