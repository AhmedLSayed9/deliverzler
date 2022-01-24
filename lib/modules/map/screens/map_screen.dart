import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/widgets/loading_indicators.dart';
import 'package:deliverzler/modules/map/components/google_map_component.dart';
import 'package:deliverzler/modules/map/components/map_confirm_button_component.dart';
import 'package:deliverzler/modules/map/components/map_directions_info_component.dart';
import 'package:deliverzler/modules/map/components/map_floating_action_button.dart';
import 'package:deliverzler/modules/map/components/map_floating_search_bar.dart';
import 'package:deliverzler/modules/map/components/map_phone_call_component.dart';
import 'package:deliverzler/modules/map/viewmodels/main_map_viewmodel.dart';
import 'package:deliverzler/modules/map/viewmodels/map_current_location_viewmodel.dart';
import 'package:deliverzler/modules/map/viewmodels/map_selected_place_viewmodel.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //To avoid AutoDispose until we pop.
    ref.watch(mainMapViewModel.notifier);
    ref.watch(mapSelectedPlaceViewModel.notifier);
    final mapIsLoading = ref.watch(
      mapCurrentLocationViewModel.select((vm) => vm.isLoading),
    );

    return PopUpPage(
      floatingActionButton:
          mapIsLoading ? null : const MapFloatingActionButton(),
      child: mapIsLoading
          ? LoadingIndicators.instance.smallLoadingAnimation(context)
          : Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.expand,
              children: const [
                GoogleMapComponent(),
                MapDirectionsInfoComponent(),
                MapPhoneCallComponent(),
                MapConfirmButtonComponent(),
                MapFloatingSearchBar(),
              ],
            ),
    );
  }
}
