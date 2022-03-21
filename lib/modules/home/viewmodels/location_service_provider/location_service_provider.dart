import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';
import 'package:deliverzler/modules/home/viewmodels/home_state_providers.dart';
import 'package:deliverzler/modules/home/viewmodels/location_service_provider/location_service_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationServiceProvider =
    StateNotifierProvider<LocationServiceNotifier, LocationServiceState>((ref) {
  return LocationServiceNotifier(ref);
});

class LocationServiceNotifier extends StateNotifier<LocationServiceState> {
  LocationServiceNotifier(this.ref)
      : super(const LocationServiceState.loading()) {
    _mainCoreProvider = ref.watch(mainCoreProvider);
  }

  final Ref ref;
  late MainCoreProvider _mainCoreProvider;

  Future getCurrentLocation() async {
    state = const LocationServiceState.loadingLocation();

    bool _enabled = await _mainCoreProvider.enableLocationService();
    if (!_enabled) {
      toggleError(tr(NavigationService.context).please_enable_location_service);
      return null;
    }
    bool _granted = await _mainCoreProvider.requestLocationPermission();
    if (!_granted) {
      toggleError(tr(NavigationService.context).location_permission_required);
      return null;
    }

    final _currentLocation = await _mainCoreProvider.getCurrentUserLocation();
    //await Future.delayed(const Duration(seconds: 1));
    if (_currentLocation == null) {
      toggleError(tr(NavigationService.context).location_timeout_error);
    }
    ref.watch(currentLocationProvider.notifier).state = _currentLocation;
    toggleAvailable();
  }

  toggleLoading() {
    state = const LocationServiceState.loading();
  }

  toggleError(String errorText) {
    state = LocationServiceState.error(errorText);
  }

  toggleAvailable() {
    state = const LocationServiceState.available();
  }
}
