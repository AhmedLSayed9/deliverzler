import 'package:deliverzler/features/map/presentation/providers/target_location_providers/target_location_geo_point_provider.dart';
import 'package:deliverzler/features/map/presentation/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'target_location_camera_position_provider.g.dart';

@riverpod
CameraPosition targetLocationCameraPosition(
    TargetLocationCameraPositionRef ref) {
  final targetLocation = ref.watch(targetLocationGeoPointProvider);

  return CameraPosition(
    target: LatLng(
      targetLocation.match(() => defaultLatLng.latitude, (t) => t.latitude),
      targetLocation.match(() => defaultLatLng.longitude, (t) => t.longitude),
    ),
    bearing: 0.0,
    tilt: 0.0,
    zoom: defaultMapZoom,
  );
}
