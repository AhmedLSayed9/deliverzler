import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../home/presentation/providers/location_stream_provider.dart';
import '../../utils/constants.dart';

part 'my_location_camera_position_provider.g.dart';

@riverpod
CameraPosition myLocationCameraPosition(MyLocationCameraPositionRef ref) {
  final myLocation = ref.watch(locationStreamProvider.select((value) => value.valueOrNull));

  return CameraPosition(
    target: LatLng(
      myLocation?.latitude ?? defaultLatLng.latitude,
      myLocation?.longitude ?? defaultLatLng.longitude,
    ),
    zoom: defaultMapZoom,
  );
}
