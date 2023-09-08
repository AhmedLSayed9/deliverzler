import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../utils/constants.dart';
import 'target_location_geo_point_provider.dart';

part 'target_location_camera_position_provider.g.dart';

@riverpod
CameraPosition targetLocationCameraPosition(
  TargetLocationCameraPositionRef ref,
) {
  final targetLocation = ref.watch(targetLocationGeoPointProvider);

  return CameraPosition(
    target: LatLng(
      targetLocation.match(() => defaultLatLng.latitude, (t) => t.latitude),
      targetLocation.match(() => defaultLatLng.longitude, (t) => t.longitude),
    ),
    zoom: defaultMapZoom,
  );
}
