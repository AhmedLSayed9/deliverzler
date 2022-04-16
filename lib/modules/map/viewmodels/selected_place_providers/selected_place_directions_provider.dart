import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/utils/toasts.dart';
import 'package:deliverzler/modules/home/viewmodels/delivering_orders_provider.dart';
import 'package:deliverzler/modules/home/viewmodels/home_state_providers.dart';
import 'package:deliverzler/modules/home/viewmodels/location_service_provider/location_service_provider.dart';
import 'package:deliverzler/modules/map/models/place_directions_model.dart';
import 'package:deliverzler/modules/map/models/place_search_model.dart';
import 'package:deliverzler/modules/map/repos/map_repo.dart';
import 'package:deliverzler/modules/map/services/map_service.dart';
import 'package:deliverzler/modules/map/utils/constants.dart';
import 'package:deliverzler/modules/map/viewmodels/map_overlays_providers/map_markers_bounds_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/map_overlays_providers/map_polylines_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/map_state_providers.dart';
import 'package:deliverzler/modules/map/viewmodels/selected_place_providers/selected_place_marker_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedPlaceDirectionsProvider = StateNotifierProvider.autoDispose<
    SelectedPlaceDirectionsNotifier,
    PlaceDirectionsModel?>((ref) => SelectedPlaceDirectionsNotifier(ref));

class SelectedPlaceDirectionsNotifier
    extends StateNotifier<PlaceDirectionsModel?> {
  SelectedPlaceDirectionsNotifier(this.ref) : super(null) {
    _selectedOrderGeoPointProvider =
        ref.watch(selectedPlaceGeoPointProvider.notifier);
  }

  final Ref ref;
  late StateController<GeoPoint?> _selectedOrderGeoPointProvider;

  setSelectedPlaceByGeoPoint() async {
    final _geoPoint = _selectedOrderGeoPointProvider.state;
    if (_geoPoint == null) {
      Toasts.showBackgroundToast(
        message: tr(NavigationService.context).pleaseSearchForLocation +
            '\n' +
            tr(NavigationService.context).userHasNotProvidedLocation,
      );
    } else {
      await addSelectedPlaceToMap();
    }
  }

  setSelectedPlaceBySearch({
    required PlaceSearchModel placeSearchModel,
    required String sessionToken,
  }) async {
    final _result = await MapRepo.instance.getPlaceDetails(
      placeId: placeSearchModel.placeId,
      sessionToken: sessionToken,
    );
    _result.fold(
      (failure) {},
      (placeSearchDetails) {
        _selectedOrderGeoPointProvider.state = placeSearchDetails.geoPoint;
        addSelectedPlaceToMap(markerDescription: placeSearchModel.description);
      },
    );
  }

  addSelectedPlaceToMap({String? markerDescription}) async {
    ref.read(selectedPlaceMarkerProvider.notifier).updateMarker(
          markerDescription: markerDescription,
          onDragEnd: (newPosition) {
            _selectedOrderGeoPointProvider.state =
                GeoPoint(newPosition.latitude, newPosition.longitude);
            setSelectedPlaceByGeoPoint();
          },
        );
    await updateSelectedPlaceDirections();
    updateDeliveringOrderGeoPoint();
  }

  updateSelectedPlaceDirections() async {
    ref.read(locationServiceProvider).whenOrNull(
      available: (loc) async {
        final _result = await MapRepo.instance.getPlaceDirections(
          origin: loc,
          destination: _selectedOrderGeoPointProvider.state!,
        );
        _result.fold(
          (failure) {},
          (placeDirections) {
            state = placeDirections;
            addSelectedPlacePolyline();
            addSelectedPlaceBounds();
            checkIfArrivedSelectedPlace();
          },
        );
      },
    );
  }

  addSelectedPlacePolyline() {
    ref.read(mapPolylinesProvider.notifier).addPolyline(
          MapService.instance.getPolylineFromRouteCoordinates(
            polylinePoints: state!.polylinePoints,
          ),
        );
  }

  addSelectedPlaceBounds() {
    ref.read(mapMarkersBoundsProvider.notifier).addMarkersBounds(state!.bounds);
  }

  checkIfArrivedSelectedPlace() {
    if (state!.distance < locationArriveDistance) {
      ref.watch(isArrivedSelectedPlaceProvider.notifier).state = true;
    }
  }

  updateDeliveringOrderGeoPoint() {
    ref.watch(deliveringOrdersProvider.notifier).updateDeliveringOrderGeoPoint(
          orderId: ref.watch(selectedOrderProvider.notifier).state!.orderId!,
          orderGeoPoint: _selectedOrderGeoPointProvider.state!,
        );
  }
}
