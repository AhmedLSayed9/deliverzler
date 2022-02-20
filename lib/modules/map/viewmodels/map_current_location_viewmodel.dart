import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';
import 'package:deliverzler/core/services/location_service.dart';
import 'package:deliverzler/modules/map/utils/constants.dart';
import 'package:deliverzler/modules/map/services/map_service.dart';
import 'package:deliverzler/modules/map/viewmodels/main_map_viewmodel.dart';
import 'package:deliverzler/modules/map/viewmodels/map_selected_place_viewmodel.dart';

final mapCurrentLocationViewModel =
    ChangeNotifierProvider.autoDispose<MapCurrentLocationViewModel>(
        (ref) => MapCurrentLocationViewModel(ref));

class MapCurrentLocationViewModel extends ChangeNotifier {
  MapCurrentLocationViewModel(this.ref) {
    _mainCoreProvider = ref.read(mainCoreProvider);
    _mainMapVM = ref.read(mainMapViewModel);
    initData();
  }

  Ref ref;
  late MainCoreProvider _mainCoreProvider;
  late MainMapViewModel _mainMapVM;
  bool isLoading = true;
  bool _disposed = false;

  LocationData? currentLocation;
  late CameraPosition currentLocationCameraPosition;
  late Marker currentLocationMarker;
  late Circle currentLocationCircle;
  StreamSubscription? _currentLocationSubscription;

  initData() async {
    await getCurrentLocation();
    getCurrentLocationCameraPosition();
    await addCurrentLocationMarkerAndCircle();
    isLoading = false;
    notifyListeners();
    await ref.read(mapSelectedPlaceViewModel).initSelectedPlaceByGeoPoint();
    subscribeToLocationChangeStream();
  }

  getCurrentLocation() async {
    bool isLocationPermissionGranted =
        await _mainCoreProvider.enableLocationAndRequestPermission();
    if (isLocationPermissionGranted) {
      currentLocation = await _mainCoreProvider.getCurrentUserLocation();
    }
  }

  getCurrentLocationCameraPosition() {
    currentLocationCameraPosition = CameraPosition(
      target: LatLng(
        currentLocation?.latitude ?? defaultLatLng.latitude,
        currentLocation?.longitude ?? defaultLatLng.longitude,
      ),
      bearing: 0.0,
      tilt: 0.0,
      zoom: defaultMapZoom,
    );
  }

  addCurrentLocationMarkerAndCircle() async {
    currentLocationMarker = await MapService.instance.getMyLocationMarker(
      position: currentLocationCameraPosition.target,
      rotation: currentLocation?.heading ?? 0,
    );
    currentLocationCircle = MapService.instance.getMyLocationCircle(
      position: currentLocationCameraPosition.target,
      radius: currentLocation?.accuracy ?? 0,
    );
    _mainMapVM.addMarker(currentLocationMarker);
    _mainMapVM.addCircle(currentLocationCircle);
  }

  subscribeToLocationChangeStream() {
    _currentLocationSubscription = LocationService
        .instance.location.onLocationChanged
        .listen((newLocationData) async {
      currentLocation = newLocationData;
      getCurrentLocationCameraPosition();
      await addCurrentLocationMarkerAndCircle();
      await updateSelectedPlaceDirections();
    });
  }

  updateSelectedPlaceDirections() async {
    if (_mainMapVM.mapPolylines.isNotEmpty) {
      await ref.read(mapSelectedPlaceViewModel).addSelectedPlaceDirections();
    }
  }

  animateToCurrentLocation() {
    _mainMapVM.animateToLocation(currentLocationCameraPosition);
  }

  @override
  void dispose() {
    _disposed = true;
    if (_currentLocationSubscription != null) {
      _currentLocationSubscription!.cancel();
    }
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
