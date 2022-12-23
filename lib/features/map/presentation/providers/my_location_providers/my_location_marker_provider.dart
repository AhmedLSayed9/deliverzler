import 'package:deliverzler/features/home/presentation/providers/location_stream_provider.dart';
import 'package:deliverzler/features/map/presentation/helpers/map_style_helper.dart';
import 'package:deliverzler/features/map/presentation/providers/my_location_providers/my_location_camera_position_provider.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_location_marker_provider.g.dart';

final myLocationMarkerProvider =
    StateProvider.autoDispose<Option<Marker>>((ref) {
  final markerIcon = ref.watch(myLocationMarkerIconProvider).valueOrNull;
  if (markerIcon == null) return const None<Marker>();

  final cameraTarget = ref.watch(
    myLocationCameraPositionProvider.select((camera) => camera.target),
  );
  final myLocationHeading = ref.watch(
    locationStreamProvider.select((position) => position.valueOrNull?.heading),
  );
  final myMarker = MapStyleHelper.getMyLocationMarker(
    position: cameraTarget,
    rotation: myLocationHeading ?? 0,
    markerIcon: markerIcon,
  );
  return Some<Marker>(myMarker);
});

@riverpod
Future<BitmapDescriptor> myLocationMarkerIcon(
    MyLocationMarkerIconRef ref) async {
  return MapStyleHelper.getMyLocationMarkerIcon();
}
