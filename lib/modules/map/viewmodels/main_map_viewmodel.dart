import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:deliverzler/modules/map/services/map_service.dart';

final mainMapViewModel = ChangeNotifierProvider.autoDispose<MainMapViewModel>(
    (ref) => MainMapViewModel());

class MainMapViewModel extends ChangeNotifier {
  bool _disposed = false;

  GoogleMapController? mapController;
  Set<Marker> mapMarkers = {};
  Set<Circle> mapCircles = {};
  Set<Polyline> mapPolylines = {};
  LatLngBounds? mapMarkersBounds;

  onMapCreated({
    required GoogleMapController controller,
    required bool isDarkMode,
  }) async {
    await controller
        .setMapStyle(await MapService.instance.mapStyle(isDarkMode));
    mapController = controller;
  }

  changeMapStyle({required bool isDarkMode}) async {
    await mapController
        ?.setMapStyle(await MapService.instance.mapStyle(isDarkMode));
  }

  addMarker(Marker marker) {
    mapMarkers.removeWhere((m) => m.markerId == marker.markerId);
    mapMarkers.add(marker);
    notifyListeners();
  }

  addCircle(Circle circle) {
    mapCircles.removeWhere((c) => c.circleId == circle.circleId);
    mapCircles.add(circle);
    notifyListeners();
  }

  addPolyline(Polyline polyline) {
    mapPolylines.removeWhere((p) => p.polylineId == polyline.polylineId);
    mapPolylines.add(polyline);
    notifyListeners();
  }

  addMarkersBounds(LatLngBounds bounds) {
    mapMarkersBounds = bounds;
    animateToMarkersBounds();
  }

  animateToMarkersBounds() {
    mapController?.animateCamera(
      CameraUpdate.newLatLngBounds(
        mapMarkersBounds!,
        60,
      ),
    );
  }

  animateToLocation(CameraPosition cameraPosition) {
    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  @override
  void dispose() {
    _disposed = true;
    mapController?.dispose();
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
