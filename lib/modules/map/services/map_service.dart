import 'dart:typed_data';

import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/modules/map/models/place_directions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart' as gl;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/app_images.dart';

class MapService {
  MapService._();

  static final instance = MapService._();

  static Uint8List? _deliveryIcon;

  Future<Uint8List> get deliveryIcon async {
    if (_deliveryIcon != null) return _deliveryIcon!;
    _deliveryIcon = await getDeliveryIcon();
    return _deliveryIcon!;
  }

  getDeliveryIcon() async {
    ByteData _byteData = await DefaultAssetBundle.of(NavigationService.context)
        .load(AppImages.mapDeliveryIcon);
    return _byteData.buffer.asUint8List();
  }

  Future<String> mapStyle(bool isDarkMode) async {
    return await rootBundle.loadString(
      isDarkMode ? AppImages.mapDarkStyle : AppImages.mapLightStyle,
    );
  }

  Future<Marker> getMyLocationMarker({
    required LatLng position,
    required double rotation,
  }) async {
    final _markerIcon = await deliveryIcon;
    return Marker(
      markerId: const MarkerId('currentLocation'),
      position: position,
      rotation: rotation,
      zIndex: 2,
      flat: true,
      infoWindow: InfoWindow(
        title: tr(NavigationService.context).myCurrentLocation,
      ),
      anchor: const Offset(0.5, 0.5),
      icon: BitmapDescriptor.fromBytes(_markerIcon),
    );
  }

  Circle getMyLocationCircle({
    required LatLng position,
    required double radius,
  }) {
    return Circle(
      circleId: const CircleId('currentLocationCircle'),
      center: position,
      radius: radius,
      zIndex: 1,
      strokeWidth: 2,
      strokeColor: Colors.blue,
      fillColor: Colors.blue.withAlpha(70),
    );
  }

  Marker getSelectedPlaceMarker({
    required LatLng position,
    required String description,
    required Function(LatLng) onDragEnd,
  }) {
    return Marker(
      markerId: const MarkerId('selectedPlace'),
      position: position,
      infoWindow: InfoWindow(
        title: description,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      draggable: true,
      onDragEnd: onDragEnd,
    );
  }

  double getDistanceBetweenTwoCoordinates({
    required LatLng firstLocation,
    required LatLng secondLocation,
  }) {
    return gl.Geolocator.distanceBetween(
      firstLocation.latitude,
      firstLocation.longitude,
      secondLocation.latitude,
      secondLocation.longitude,
    );
  }

  Polyline getPolylineFromRouteCoordinates({
    required List<PointLatLng>? polylinePoints,
  }) {
    return Polyline(
      polylineId: const PolylineId('mapPolyline'),
      width: 4,
      geodesic: true,
      startCap: Cap.roundCap,
      endCap: Cap.buttCap,
      color: AppColors.blue,
      points: polylinePoints!
          .map((polylinePoint) =>
              LatLng(polylinePoint.latitude, polylinePoint.longitude))
          .toList(),
    );
  }

  String getDirectionInfoText(PlaceDirectionsModel placeDirectionsModel) {
    final _distance = MapService.instance.convertMeterToDistanceString(
      placeDirectionsModel.distance,
    );
    final _duration = placeDirectionsModel.duration;
    return _distance + ', ' + _duration;
  }

  String convertMeterToDistanceString(int distance) {
    if (distance < 1000) {
      return distance.toString() + ' m';
    } else {
      double _distanceInKM = (distance / 1000);
      return _distanceInKM.toStringAsFixed(2) + ' km';
    }
  }
}
