import 'package:deliverzler/modules/home/viewmodels/delivering_orders_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final locationChangeCallbacksViewModel =
    Provider<LocationChangeCallBacksViewModel>(
        (ref) => LocationChangeCallBacksViewModel(ref));

class LocationChangeCallBacksViewModel {
  LocationChangeCallBacksViewModel(this.ref) {
    init();
  }

  final Ref ref;

  final Map<String, Function(Position location)> _locationChangeCallbacks = {};

  init() {
    _locationChangeCallbacks.addAll(
      {'init': ref.watch(deliveringOrdersProvider.notifier).handleNewLocation},
    );
  }

  executeCallBacks(Position newLocation) {
    for (final fn in _locationChangeCallbacks.values) {
      fn.call(newLocation);
    }
  }

  addCallBack(String key, Function(Position location) function) {
    _locationChangeCallbacks.addAll({key: function});
  }

  removeCallBack(String key) {
    _locationChangeCallbacks.remove(key);
  }
}
