import 'package:deliverzler/core/screens/popup_page_nested.dart';
import 'package:deliverzler/modules/home/components/retry_again_component.dart';
import 'package:deliverzler/modules/home/components/upcoming_orders_component.dart';
import 'package:deliverzler/modules/home/utils/location_error.dart';
import 'package:deliverzler/modules/home/viewmodels/location_service_provider/location_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/widgets/loading_indicators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrdersScreen extends HookConsumerWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _locationServiceProvider = ref.watch(locationServiceProvider);

    return PopUpPageNested(
      body: _locationServiceProvider.when(
        loading: () => LoadingIndicators.instance.defaultLoadingIndicator(
          context,
          message: tr(context).determine_location,
        ),
        error: (error) => RetryAgainComponent(
          description: getLocationErrorText(context, error),
        ),
        available: (loc) => const UpcomingOrdersComponent(),
      ),
    );
  }
}
