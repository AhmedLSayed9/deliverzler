import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/modules/notifications/models/notification_model.dart';
import 'package:deliverzler/core/services/init_services/local_notification_service.dart';
import 'package:deliverzler/core/services/location_service.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:deliverzler/modules/home/repos/orders_repo.dart';
import 'package:deliverzler/modules/map/models/delivering_order_model.dart';
import 'package:deliverzler/modules/map/services/map_service.dart';
import 'package:deliverzler/modules/map/utils/constants.dart';

final upcomingOrdersStreamProvider = StreamProvider<List<OrderModel>>((ref) {
  return ref.read(ordersRepoProvider).getUpcomingOrdersStream();
});

final mainOrdersViewModel = ChangeNotifierProvider<MainOrdersViewModel>(
    (ref) => MainOrdersViewModel(ref));

class MainOrdersViewModel extends ChangeNotifier {
  MainOrdersViewModel(this.ref) {
    init();
  }

  Ref ref;
  StreamSubscription? _currentLocationSubscription;
  LocationData? _currentLocation;

  List<DeliveringOrderModel> deliveringOrdersList = [];

  init() async {
    await requestForCurrentLocationAndBgMode();
    subscribeToLocationChangeStream();
  }

  Future requestForCurrentLocationAndBgMode() async {
    await ref.read(mainCoreProvider).enableLocationAndRequestPermission();
    await ref.read(mainCoreProvider).enableBackgroundMode();
    await ref.read(mainCoreProvider).initLocationSettings();
  }

  subscribeToLocationChangeStream() {
    _currentLocationSubscription = LocationService
        .instance.location.onLocationChanged
        .listen((newCurrentLocation) {
      if (_currentLocation != null) {
        handleCurrentLocationChange(newCurrentLocation);
        handleOrdersLocationChange(newCurrentLocation);
      }
      _currentLocation = newCurrentLocation;
    });
  }

  /// Current Location Change, To Update at the backend.

  handleCurrentLocationChange(LocationData newCurrentLocation) {
    final _distance = MapService.instance.getDistanceBetweenTwoCoordinates(
      firstLocation: LatLng(
        _currentLocation!.latitude!,
        _currentLocation!.longitude!,
      ),
      secondLocation: LatLng(
        newCurrentLocation.latitude!,
        newCurrentLocation.longitude!,
      ),
    );
    if (_distance > locationChangeDistance) {
      updateOrdersDeliveryGeoPoint(
        deliveryGeoPoint: GeoPoint(
          newCurrentLocation.latitude!,
          newCurrentLocation.longitude!,
        ),
      );
    }
  }

  updateOrdersDeliveryGeoPoint({required GeoPoint deliveryGeoPoint}) {
    try {
      for (var order in deliveringOrdersList) {
        ref.read(ordersRepoProvider).updateDeliveryGeoPoint(
              orderId: order.orderId,
              deliveryGeoPoint: deliveryGeoPoint,
            );
      }
    } catch (e) {
      debugPrint(e.toString());
      AppDialogs.showErrorDialog();
    }
  }

  /// Orders Location Change, To send local notification when arrive.

  handleOrdersLocationChange(LocationData newCurrentLocation) {
    for (var order in deliveringOrdersList) {
      if (order.orderGeoPoint != null &&
          order.showedArriveNotification == false) {
        final _distance = MapService.instance.getDistanceBetweenTwoCoordinates(
          firstLocation: LatLng(
            order.orderGeoPoint!.latitude,
            order.orderGeoPoint!.longitude,
          ),
          secondLocation: LatLng(
            newCurrentLocation.latitude!,
            newCurrentLocation.longitude!,
          ),
        );
        if (_distance < locationArriveDistance) {
          showOrderArrivedNotification(order.orderId);
          order.showedArriveNotification = true;
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

  /// Delivering Orders

  addOrderToDeliveringOrders({required String orderId}) {
    final _productExist = deliveringOrdersList
        .firstWhereOrNull((order) => order.orderId == orderId);
    if (_productExist == null) {
      deliveringOrdersList.add(DeliveringOrderModel(orderId: orderId));
    }
  }

  addLocationToDeliveringOrder({
    required String orderId,
    required GeoPoint orderGeoPoint,
  }) {
    deliveringOrdersList
        .firstWhereOrNull((order) => order.orderId == orderId)
        ?.orderGeoPoint = orderGeoPoint;
  }

  deleteOrderFromDeliveringOrders({required String orderId}) {
    deliveringOrdersList.removeWhere((order) => order.orderId == orderId);
  }

  @override
  void dispose() {
    _currentLocationSubscription?.cancel();
    super.dispose();
  }
}
