import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/widgets/custom_snack_bar.dart';
import 'package:deliverzler/modules/home/viewmodels/main_orders_viewmodel.dart';
import 'package:deliverzler/modules/home/viewmodels/selected_order_providers.dart';
import 'package:deliverzler/modules/map/models/place_directions_model.dart';
import 'package:deliverzler/modules/map/utils/constants.dart';
import 'package:deliverzler/modules/map/models/place_details_model.dart';
import 'package:deliverzler/modules/map/models/place_search_model.dart';
import 'package:deliverzler/modules/map/repos/map_repo.dart';
import 'package:deliverzler/modules/map/services/map_service.dart';
import 'package:deliverzler/modules/map/viewmodels/main_map_viewmodel.dart';
import 'package:deliverzler/modules/map/viewmodels/map_current_location_viewmodel.dart';

final mapSelectedPlaceViewModel =
    ChangeNotifierProvider.autoDispose<MapSelectedPlaceViewModel>(
        (ref) => MapSelectedPlaceViewModel(ref));

class MapSelectedPlaceViewModel extends ChangeNotifier {
  MapSelectedPlaceViewModel(this.ref) {
    _mainMapVM = ref.read(mainMapViewModel);
  }

  Ref ref;
  late MainMapViewModel _mainMapVM;
  bool _disposed = false;

  PlaceSearchModel? selectedPlaceSearch;
  PlaceDetailsModel? selectedPlaceDetails;
  late CameraPosition selectedPlaceCameraPosition;
  late Marker selectedPlaceMarker;
  PlaceDirectionsModel? selectedPlaceDirections;
  String? selectedPlaceDistance;
  String? selectedPlaceDuration;
  bool isArrivedSelectedPlace = false;

  initSelectedPlaceByGeoPoint() async {
    final _geoPoint = ref.read(selectedOrderGeoPointProvider);
    if (_geoPoint != null) {
      selectedPlaceDetails = PlaceDetailsModel(
          geoPoint: GeoPoint(
        _geoPoint.latitude,
        _geoPoint.longitude,
      ));
      await addSelectedPlaceToMap();
    } else {
      CustomSnackBar.showDefaultSnackBar(
        NavigationService.context,
        title: tr(NavigationService.context).pleaseSearchForLocation,
        description: tr(NavigationService.context).userHasNotProvidedLocation,
      );
    }
  }

  initSelectedPlaceBySearch({
    required PlaceSearchModel placeSearchModel,
    required String sessionToken,
  }) async {
    selectedPlaceSearch = placeSearchModel;
    selectedPlaceDetails = await MapRepo.instance.getPlaceGeometry(
      placeId: placeSearchModel.placeId,
      sessionToken: sessionToken,
    );
    if (selectedPlaceDetails != null) {
      addSelectedPlaceToMap();
    }
  }

  addSelectedPlaceToMap() async {
    getSelectedPlaceCameraPosition();
    addSelectedPlaceMarker();
    await addSelectedPlaceDirections();
    addLocationToDeliveringOrder();
  }

  getSelectedPlaceCameraPosition() {
    selectedPlaceCameraPosition = CameraPosition(
      target: LatLng(
        selectedPlaceDetails!.geoPoint.latitude,
        selectedPlaceDetails!.geoPoint.longitude,
      ),
      bearing: 0.0,
      tilt: 0.0,
      zoom: mediumMapZoom,
    );
  }

  addSelectedPlaceMarker() {
    selectedPlaceMarker = MapService.instance.getSelectedPlaceMarker(
      position: selectedPlaceCameraPosition.target,
      description: selectedPlaceSearch?.description ?? 'User Location',
      onDragEnd: (newPosition) {
        ref.read(selectedOrderGeoPointProvider.notifier).state =
            GeoPoint(newPosition.latitude, newPosition.longitude);
        initSelectedPlaceByGeoPoint();
      },
    );
    _mainMapVM.addMarker(selectedPlaceMarker);
  }

  addSelectedPlaceDirections() async {
    selectedPlaceDirections = await MapRepo.instance.getPlaceDirections(
      origin: LatLng(
        ref.read(mapCurrentLocationViewModel).currentLocation!.latitude!,
        ref.read(mapCurrentLocationViewModel).currentLocation!.longitude!,
      ),
      destination: LatLng(
        selectedPlaceDetails!.geoPoint.latitude,
        selectedPlaceDetails!.geoPoint.longitude,
      ),
    );
    if (selectedPlaceDirections != null) {
      addSelectedPlacePolyline();
      addSelectedPlaceBounds();
      addSelectedPlaceDistanceAndDuration();
      checkIfArrivedSelectedPlace(selectedPlaceDirections!.distance);
    }
  }

  addSelectedPlacePolyline() {
    _mainMapVM.addPolyline(
      MapService.instance.getPolylineFromRouteCoordinates(
        polylinePoints: selectedPlaceDirections!.polylinePoints,
      ),
    );
  }

  addSelectedPlaceBounds() {
    _mainMapVM.addMarkersBounds(selectedPlaceDirections!.bounds);
  }

  addSelectedPlaceDistanceAndDuration() {
    selectedPlaceDistance = MapService.instance.convertMeterToDistanceString(
      selectedPlaceDirections!.distance,
    );
    selectedPlaceDuration = selectedPlaceDirections!.duration;
    notifyListeners();
  }

  checkIfArrivedSelectedPlace(int distance) {
    if (distance < locationArriveDistance) {
      isArrivedSelectedPlace = true;
      notifyListeners();
    }
  }

  addLocationToDeliveringOrder() {
    ref.read(mainOrdersViewModel).addLocationToDeliveringOrder(
          orderId: ref.read(selectedOrderProvider)!.orderId!,
          orderGeoPoint: selectedPlaceDetails!.geoPoint,
        );
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
