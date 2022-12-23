import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapStyleHelper {
  static Future<String> getMapStyle(bool isDarkMode) async {
    return await rootBundle.loadString(
      isDarkMode ? AppImages.mapDarkStyle : AppImages.mapLightStyle,
    );
  }

  static Future<BitmapDescriptor> getMyLocationMarkerIcon() async {
    return await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      AppImages.mapDeliveryIcon,
    );
  }

  static Marker getMyLocationMarker({
    required LatLng position,
    required double rotation,
    required BitmapDescriptor markerIcon,
  }) {
    return Marker(
      markerId: const MarkerId('currentLocation'),
      position: position,
      rotation: rotation,
      zIndex: 2,
      flat: true,
      infoWindow: const InfoWindow(title: 'My current location'),
      anchor: const Offset(0.5, 0.5),
      icon: markerIcon,
    );
  }

  static Circle getMyLocationCircle({
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

  static Marker getSelectedPlaceMarker({
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
}
