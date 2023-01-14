import 'package:deliverzler/core/presentation/screens/nested_screen_wrapper.dart';
import 'package:deliverzler/features/home/presentation/components/retry_again_component.dart';
import 'package:deliverzler/features/home/presentation/components/upcoming_orders_component.dart';
import 'package:deliverzler/features/home/presentation/utils/location_error.dart';
import 'package:deliverzler/features/home/presentation/providers/location_stream_provider.dart';
import 'package:deliverzler/features/home/presentation/providers/update_delivery_geo_point_provider.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/widgets/loading_indicators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreenCompact extends HookConsumerWidget {
  const HomeScreenCompact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final locationAsync = ref.watch(
      //Using select to avoid rebuilding when location change
      locationStreamProvider.select((value) => value.whenData((value) => true)),
    );

    ref.listen(updateDeliveryGeoPointStateProvider, (previous, next) {});

    return NestedScreenWrapper(
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
        data: (_) => const UpcomingOrdersComponent(),
      ),
    );
  }
}
