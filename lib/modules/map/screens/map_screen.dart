import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/modules/home/components/retry_again_component.dart';
import 'package:deliverzler/modules/home/utils/location_error.dart';
import 'package:deliverzler/modules/home/viewmodels/location_service_provider/location_service_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/current_location_providers/current_loc_marker_provider/current_loc_marker_provider.dart';
import 'package:deliverzler/modules/map/viewmodels/main_map_viewmodel.dart';
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

class MapScreen extends ConsumerWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(mainMapViewModel.notifier);
    final _locationServiceProvider = ref.watch(locationServiceProvider);
    final _currentLocationMarker = ref.watch(currentLocMarkerProvider);

    return PopUpPage(
      floatingActionButton: _locationServiceProvider.maybeWhen(
        available: (_) => _currentLocationMarker.whenOrNull(
          available: (_, __) => const MapFloatingActionButton(),
        ),
        orElse: () => null,
      ),
      body: _locationServiceProvider.when(
        loading: () => LoadingIndicators.instance.defaultLoadingIndicator(
          context,
          message: tr(context).determine_location,
        ),
        error: (error) => RetryAgainComponent(
          description: getLocationErrorText(context, error),
        ),
        available: (_) => _currentLocationMarker.when(
          loading: () => LoadingIndicators.instance.defaultLoadingIndicator(
            context,
            message: tr(context).please_wait,
          ),
          available: (_, __) => Stack(
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
        ),
      ),
    );
  }
}
