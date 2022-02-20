import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:deliverzler/modules/map/viewmodels/main_map_viewmodel.dart';
import 'package:deliverzler/modules/map/viewmodels/map_current_location_viewmodel.dart';

class GoogleMapComponent extends ConsumerStatefulWidget {
  const GoogleMapComponent({Key? key}) : super(key: key);

  @override
  _GoogleMapComponentState createState() => _GoogleMapComponentState();
}

class _GoogleMapComponentState extends ConsumerState<GoogleMapComponent>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    final brightness = WidgetsBinding.instance!.window.platformBrightness;
    ref
        .read(mainMapViewModel)
        .changeMapStyle(isDarkMode: brightness == Brightness.dark);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainMapVM = ref.watch(mainMapViewModel);
    final currentLocationCameraPosition = ref.watch(mapCurrentLocationViewModel
        .select((vm) => vm.currentLocationCameraPosition));

    return GoogleMap(
      initialCameraPosition: currentLocationCameraPosition,
      mapType: MapType.normal,
      markers: mainMapVM.mapMarkers,
      circles: mainMapVM.mapCircles,
      polylines: mainMapVM.mapPolylines,
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) async {
        mainMapVM.onMapCreated(
          controller: controller,
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
        );
      },
    );
  }
}
