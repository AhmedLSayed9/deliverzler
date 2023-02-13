import 'package:deliverzler/features/home/presentation/providers/location_stream_provider.dart';
import 'package:deliverzler/features/map/presentation/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_location_camera_position_provider.g.dart';

@riverpod
CameraPosition myLocationCameraPosition(MyLocationCameraPositionRef ref) {
  final myLocation =
      ref.watch(locationStreamProvider.select((value) => value.valueOrNull));

  return CameraPosition(
    target: LatLng(
      myLocation?.latitude ?? defaultLatLng.latitude,
      myLocation?.longitude ?? defaultLatLng.longitude,
    ),
    bearing: 0.0,
    tilt: 0.0,
    zoom: defaultMapZoom,
  );
}
