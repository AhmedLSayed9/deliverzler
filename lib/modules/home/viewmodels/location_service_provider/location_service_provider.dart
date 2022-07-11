import 'dart:developer';
import 'dart:async';

import 'package:deliverzler/core/services/location_service/i_location_service.dart';
import 'package:deliverzler/core/services/location_service/location_service.dart';
import 'package:deliverzler/core/utils/constants.dart';
import 'package:deliverzler/modules/home/utils/location_error.dart';
import 'package:deliverzler/modules/home/viewmodels/location_change_callbacks_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';
import 'package:deliverzler/modules/home/viewmodels/location_service_provider/location_service_state.dart';
import 'package:geolocator/geolocator.dart';

final locationServiceProvider =
    StateNotifierProvider<LocationServiceNotifier, LocationServiceState>((ref) {
  return LocationServiceNotifier(ref);
});

class LocationServiceNotifier extends StateNotifier<LocationServiceState> {
  LocationServiceNotifier(this.ref)
      : super(const LocationServiceState.loading()) {
    _mainCoreProvider = ref.watch(mainCoreProvider);
    _locationService = ref.watch(locationService);
    getCurrentLocation();
  }

  final Ref ref;
  late MainCoreProvider _mainCoreProvider;
  late ILocationService _locationService;

  StreamSubscription? _currentLocationSubscription;
  Timer? _locationChangeTimer;
  bool _isEnableOnLocationChanged = true;

  Future getCurrentLocation() async {
    state = const LocationServiceState.loading();

    bool _enabled = await _mainCoreProvider.enableLocationService();
    if (!_enabled) {
      toggleError(LocationError.notEnabledLocation);
      return;
    }
    bool _locationGranted = await _mainCoreProvider.requestLocationPermission();
    if (!_locationGranted) {
      toggleError(LocationError.notGrantedLocationPermission);
      return;
    }

    final _currentLocation = await _mainCoreProvider.getCurrentUserLocation();
    if (_currentLocation == null) {
      toggleError(LocationError.getLocationTimeout);
      return;
    } else {
      state = LocationServiceState.available(_currentLocation);
      handleSuccessfulGetLocation();
    }
  }

  handleSuccessfulGetLocation() async {
    initLocationStream();
  }

  initLocationStream() {
    if (_currentLocationSubscription != null) return;

    initLocationChangeTimer();
    _currentLocationSubscription = Geolocator.getPositionStream(
      locationSettings: _locationService.getLocationSettings(),
    ).listen(
      (newLoc) async {
        if (_isEnableOnLocationChanged) {
          _isEnableOnLocationChanged = false;
          state = LocationServiceState.available(newLoc);
          ref.watch(locationChangeCallbacksViewModel).executeCallBacks(newLoc);
        }
      },
      onError: ((error) {
        toggleError(LocationError.notEnabledLocation);
        log(error.toString());
      }),
    );
  }

  initLocationChangeTimer() {
    _locationChangeTimer = Timer.periodic(
      const Duration(seconds: locationChangeInterval),
      (_) {
        _isEnableOnLocationChanged = true;
      },
    );
  }

  toggleError(LocationError error) {
    state = LocationServiceState.error(error);
  }

  @override
  void dispose() {
    _currentLocationSubscription?.cancel();
    _locationChangeTimer?.cancel();
    super.dispose();
  }
}
