import 'package:deliverzler/core/hooks/platform_brightness_hook.dart';
import 'package:deliverzler/modules/map/viewmodels/current_location_providers/current_loc_camera_position_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/map_overlays_providers/map_circles_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/map_overlays_providers/map_markers_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/map_overlays_providers/map_polylines_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:deliverzler/modules/map/viewmodels/main_map_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleMapComponent extends HookConsumerWidget {
  const GoogleMapComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useOnPlatformBrightnessChange((previous, current) {
      ref
          .read(mainMapViewModel)
          .changeMapStyle(isDarkMode: current == Brightness.dark);
    });

    return GoogleMap(
      initialCameraPosition: ref.watch(currentLocCameraPositionProvider),
      mapType: MapType.normal,
      markers: ref.watch(mapMarkersProvider),
      circles: ref.watch(mapCirclesProvider),
      polylines: ref.watch(mapPolylinesProvider),
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: ref.watch(mainMapViewModel.notifier).onMapCreated,
    );
  }
}
