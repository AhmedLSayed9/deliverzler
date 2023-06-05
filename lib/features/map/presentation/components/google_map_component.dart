import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/core_features/theme/presentation/providers/current_app_theme_provider.dart';
import '../../../../core/core_features/theme/presentation/utils/app_theme.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../helpers/map_style_helper.dart';
import '../providers/map_controller_provider.dart';
import '../providers/map_overlays_providers/map_circles_providers.dart';
import '../providers/map_overlays_providers/map_markers_providers.dart';
import '../providers/map_overlays_providers/map_polylines_provider.dart';
import '../providers/my_location_providers/my_location_camera_position_provider.dart';

class GoogleMapComponent extends HookConsumerWidget {
  const GoogleMapComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen<GoogleMapController?>(
      mapControllerProvider,
      (previous, next) {},
    );

    return GoogleMap(
      initialCameraPosition: ref.watch(myLocationCameraPositionProvider),
      mapType: MapType.normal,
      markers: ref.watch(mapMarkersProvider),
      circles: ref.watch(mapCirclesProvider),
      polylines: ref.watch(mapPolylinesProvider),
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (controller) async {
        final isDark = ref.read(currentAppThemeProvider) == AppTheme.dark;
        final mapStyle = await MapStyleHelper.getMapStyle(isDark);
        await controller.setMapStyle(mapStyle);
        ref
            .read(currentMapControllerProvider.notifier)
            .update((_) => controller);
      },
    );
  }
}
