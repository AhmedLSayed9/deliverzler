import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/presentation/utils/functional.dart';
import '../../helpers/map_style_helper.dart';
import '../place_details_provider.dart';
import 'target_location_camera_position_provider.dart';
import 'target_location_geo_point_provider.dart';

part 'target_location_marker_provider.g.dart';

@riverpod
Marker targetLocationMarker(TargetLocationMarkerRef ref) {
  final cameraTarget = ref.watch(
    targetLocationCameraPositionProvider.select((camera) => camera.target),
  );
  final targetDescription = ref.watch(
    selectedPlaceAutocompleteProvider.select(
      (value) => value.match(() => 'User Location', (p) => p.description),
    ),
  );

  final targetMarker = MapStyleHelper.getSelectedPlaceMarker(
    position: cameraTarget,
    description: targetDescription,
    onDragEnd: (newPosition) {
      final position =
          Some(GeoPoint(newPosition.latitude, newPosition.longitude));
      ref
          .watch(targetLocationGeoPointProvider.notifier)
          .update((_) => position);
    },
  );
  return targetMarker;
}
