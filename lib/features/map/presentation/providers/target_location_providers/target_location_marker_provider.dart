import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/features/map/presentation/helpers/map_style_helper.dart';
import 'package:deliverzler/features/map/presentation/providers/place_details_provider.dart';
import 'package:deliverzler/features/map/presentation/providers/target_location_providers/target_location_camera_position_provider.dart';
import 'package:deliverzler/features/map/presentation/providers/target_location_providers/target_location_geo_point_provider.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final targetLocationMarkerProvider = StateProvider.autoDispose<Marker>((ref) {
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
      ref.watch(targetLocationGeoPointProvider.notifier).state = position;
    },
  );
  return targetMarker;
});
