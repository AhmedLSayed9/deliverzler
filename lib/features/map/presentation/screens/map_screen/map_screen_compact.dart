import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/core_features/theme/presentation/providers/current_app_theme_provider.dart';
import '../../../../../core/core_features/theme/presentation/utils/app_theme.dart';
import '../../../../../core/presentation/extensions/app_error_extension.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/helpers/theme_helper.dart';
import '../../../../../core/presentation/routing/navigation_service.dart';
import '../../../../../core/presentation/screens/nested_screen_wrapper.dart';
import '../../../../../core/presentation/services/local_notfication_service/show_local_notification_provider.dart';
import '../../../../../core/presentation/utils/dialogs.dart';
import '../../../../../core/presentation/utils/functional.dart';
import '../../../../../core/presentation/utils/toasts.dart';
import '../../../../../core/presentation/widgets/loading_indicators.dart';
import '../../../../home/presentation/components/retry_again_component.dart';
import '../../../../home/presentation/providers/location_stream_provider.dart';
import '../../../../home/presentation/utils/location_error.dart';
import '../../components/google_map_component.dart';
import '../../components/map_confirm_button_component.dart';
import '../../components/map_directions_info_component.dart';
import '../../components/map_floating_action_button.dart';
import '../../components/map_floating_search_bar.dart';
import '../../components/map_phone_call_component.dart';
import '../../providers/is_arrived_target_location_provider.dart';
import '../../providers/map_confirm_order_provider.dart';
import '../../providers/target_location_providers/target_location_geo_point_provider.dart';

class MapScreenCompact extends HookConsumerWidget {
  const MapScreenCompact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final currentTheme = ref.watch(currentAppThemeProvider);
    final locationAsync = ref.watch(locationStreamProvider);

    useEffect(() {
      if (ref.read(targetLocationGeoPointProvider) is None<GeoPoint>) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Toasts.showTitledToast(
            context,
            title: tr(context).pleaseSearchForLocation,
            description: tr(context).userHasNotProvidedLocation,
          );
        });
      }
      return null;
    }, []);

    ref.listen<bool>(isArrivedTargetLocationProvider, (previous, next) {
      if (next == true) {
        final params = ShowLocalNotificationParams(
          title: tr(context).arrivedLocation,
          body: tr(context).youAreCloseToLocationArea,
        );
        ref.read(showLocalNotificationProvider(params));
      }
    });

    ref.listen<AsyncValue<MapConfirmOrderState>>(
      mapConfirmOrderStatusProvider,
      (prevState, newState) {
        prevState?.unwrapPrevious().whenOrNull(
          loading: () {
            NavigationService.dismissDialog(context);
          },
        );
        newState.unwrapPrevious().whenOrNull(
              loading: () => Dialogs.showLoadingDialog(context),
              error: (err, st) {
                Dialogs.showErrorDialog(
                  context,
                  message: err.errorMessage(context),
                );
              },
              data: (state) {
                if (state == MapConfirmOrderState.success) {
                  NavigationService.goBack(context);
                }
              },
            );
      },
    );

    return AnnotatedRegion(
      value: getFullScreenOverlayStyle(
        context,
        darkOverlays: currentTheme == AppTheme.light,
      ),
      child: NestedScreenWrapper(
        hasAppBar: false,
        body: locationAsync.when(
          skipLoadingOnReload: true,
          skipLoadingOnRefresh: !locationAsync.hasError,
          loading: () => LoadingIndicators.defaultLoadingIndicator(
            context,
            message: tr(context).determine_location,
          ),
          error: (error, st) => RetryAgainComponent(
            description: (error as LocationError).getErrorText(context),
            onPressed: () {
              ref.invalidate(locationStreamProvider);
            },
          ),
          data: (_) => Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: const [
              GoogleMapComponent(),
              MapDirectionsInfoComponent(),
              MapPhoneCallComponent(),
              MapConfirmButtonComponent(),
              MapFloatingSearchBar(),
              MapFloatingActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}
