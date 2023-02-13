import 'package:deliverzler/features/home/presentation/providers/location_stream_provider.dart';
import 'package:deliverzler/features/map/presentation/helpers/map_style_helper.dart';
import 'package:deliverzler/features/map/presentation/providers/my_location_providers/my_location_camera_position_provider.dart';
import 'package:deliverzler/features/map/presentation/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
