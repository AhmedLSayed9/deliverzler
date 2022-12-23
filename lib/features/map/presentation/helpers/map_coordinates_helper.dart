import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:deliverzler/features/map/domain/entities/place_directions.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart' as gl;
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapCoordinatesHelper {
  static double getDistanceBetweenTwoCoordinates({
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

  static Polyline getPolylineFromRouteCoordinates({
    required List<PointLatLng>? polylinePoints,
  }) {
    return Polyline(
      polylineId: const PolylineId('mapPolyline'),
      width: 4,
      geodesic: true,
      startCap: Cap.roundCap,
      endCap: Cap.buttCap,
      color: AppStaticColors.blue,
      points: polylinePoints!
          .map((polylinePoint) =>
              LatLng(polylinePoint.latitude, polylinePoint.longitude))
          .toList(),
    );
  }

  static String getDirectionInfoText(PlaceDirections placeDirections) {
    final distance = convertMeterToDistanceString(
      placeDirections.distance,
    );
    final duration = placeDirections.duration;
    return '$distance, $duration';
  }

  static String convertMeterToDistanceString(int distance) {
    if (distance < 1000) {
      return '$distance m';
    } else {
      double distanceInKM = (distance / 1000);
      return '${distanceInKM.toStringAsFixed(2)} km';
    }
  }
}
