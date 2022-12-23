import 'package:deliverzler/features/map/presentation/providers/target_location_providers/target_location_geo_point_provider.dart';
import 'package:deliverzler/features/map/presentation/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final targetLocationCameraPositionProvider =
    StateProvider.autoDispose<CameraPosition>((ref) {
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
});
