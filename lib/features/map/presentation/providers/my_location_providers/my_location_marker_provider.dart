import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/presentation/utils/fp_framework.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../home/presentation/providers/location_stream_provider.dart';
import '../../helpers/map_style_helper.dart';
import 'my_location_camera_position_provider.dart';

part 'my_location_marker_provider.g.dart';

@riverpod
Option<Marker> myLocationMarker(MyLocationMarkerRef ref) {
  final markerIcon = ref.watch(myLocationMarkerIconProvider).valueOrNull;
  if (markerIcon == null) return const None();

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
}

@riverpod
Future<BitmapDescriptor> myLocationMarkerIcon(
  MyLocationMarkerIconRef ref,
) async {
  return MapStyleHelper.getMyLocationMarkerIcon();
}
