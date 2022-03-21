import 'package:deliverzler/modules/home/components/retry_again_component.dart';
import 'package:deliverzler/modules/home/components/upcoming_orders_component.dart';
import 'package:deliverzler/modules/home/viewmodels/location_change_viewmodel.dart';
import 'package:deliverzler/modules/home/viewmodels/location_service_provider/location_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/components/main_drawer.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/widgets/loading_indicators.dart';

class OrdersScreen extends ConsumerWidget {
  OrdersScreen({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(locationChangeViewModel.notifier);
    final _locationServiceProvider = ref.watch(locationServiceProvider);

    return PopUpPage(
      scaffoldKey: scaffoldKey,
      appBarWithMenu: true,
      appbarItems: [
        CustomText.h2(
          context,
          tr(context).appName,
          color: AppColors.lightThemePrimary,
          alignment: Alignment.center,
        ),
      ],
      drawer: MainDrawer(
        scaffoldKey: scaffoldKey,
      ),
      child: _locationServiceProvider.when(
        loading: () => LoadingIndicators.instance.defaultLoadingIndicator(
          context,
          message: tr(context).please_wait,
        ),
        loadingLocation: () =>
            LoadingIndicators.instance.defaultLoadingIndicator(
          context,
          message: tr(context).determine_location,
        ),
        error: (error) => RetryAgainComponent(
          description: error,
        ),
        available: () => const UpcomingOrdersComponent(),
      ),
    );
  }
}
