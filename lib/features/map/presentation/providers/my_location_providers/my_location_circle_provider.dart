import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../home/presentation/providers/location_stream_provider.dart';
import '../../helpers/map_style_helper.dart';
import '../../utils/constants.dart';
import 'my_location_camera_position_provider.dart';

part 'my_location_circle_provider.g.dart';

@riverpod
Circle myLocationCircle(MyLocationCircleRef ref) {
  final cameraTarget = ref.watch(
    myLocationCameraPositionProvider.select((camera) => camera.target),
  );
  final myLocationAccuracy = ref.watch(
    locationStreamProvider.select((position) => position.valueOrNull?.accuracy),
  );

  return MapStyleHelper.getMyLocationCircle(
    position: cameraTarget,
    radius: myLocationAccuracy ?? defaultCircleRadius,
  );
}
