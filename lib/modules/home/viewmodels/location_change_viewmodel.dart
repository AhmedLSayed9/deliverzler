import 'dart:async';

import 'package:deliverzler/core/services/location_service.dart';
import 'package:deliverzler/modules/home/viewmodels/delivering_orders_provider.dart';
import 'package:deliverzler/modules/home/viewmodels/home_state_providers.dart';
import 'package:deliverzler/modules/home/viewmodels/location_service_provider/location_service_provider.dart';
import 'package:deliverzler/modules/map/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final locationChangeViewModel = ChangeNotifierProvider<LocationChangeViewModel>(
    (ref) => LocationChangeViewModel(ref));

class LocationChangeViewModel extends ChangeNotifier {
  LocationChangeViewModel(this.ref) {
    initData();
  }

  final Ref ref;
  late StateController _currentLocation;
  late DeliveringOrdersNotifier _deliveringOrdersProvider;

  StreamSubscription? _currentLocationSubscription;
  Timer? _locationChangeTimer;
  bool _isEnableOnLocationChanged = true;

  Future initData() async {
    _currentLocation = ref.watch(currentLocationProvider.notifier);
    _deliveringOrdersProvider = ref.watch(deliveringOrdersProvider.notifier);

    await ref.watch(locationServiceProvider.notifier).getCurrentLocation();
    if (_currentLocation.state != null) {
      subscribeToLocationChangeStream();
    }
  }

  subscribeToLocationChangeStream() {
    if (_currentLocationSubscription != null) return;

    initLocationChangeTimer();
    _currentLocationSubscription = Geolocator.getPositionStream(
      locationSettings: LocationService.instance.getLocationSettings(),
    ).listen(
      (newLocationData) async {
        if (_isEnableOnLocationChanged) {
          _isEnableOnLocationChanged = false;
          _currentLocation.state = newLocationData;
          _deliveringOrdersProvider.updateDeliveryGeoPointForDeliveringOrders();
          _deliveringOrdersProvider.checkArrivedDeliveringOrders();
        }
      },
      onError: ((error) {
        _currentLocation.state = null;
        initData();
        debugPrint(error.toString());
      }),
    );
  }

  initLocationChangeTimer() {
    _locationChangeTimer =
        Timer.periodic(const Duration(seconds: locationChangeInterval), (_) {
      _isEnableOnLocationChanged = true;
    });
  }

  @override
  void dispose() {
    _currentLocationSubscription?.cancel();
    _locationChangeTimer?.cancel();
    super.dispose();
  }
}
