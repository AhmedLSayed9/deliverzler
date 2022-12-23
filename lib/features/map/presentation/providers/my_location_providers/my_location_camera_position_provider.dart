import 'package:deliverzler/features/home/presentation/providers/location_stream_provider.dart';
import 'package:deliverzler/features/map/presentation/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final myLocationCameraPositionProvider =
    StateProvider.autoDispose<CameraPosition>((ref) {
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
});
