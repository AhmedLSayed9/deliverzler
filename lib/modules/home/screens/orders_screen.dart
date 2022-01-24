import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/components/main_drawer.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/widgets/loading_indicators.dart';
import 'package:deliverzler/modules/home/components/card_item_component.dart';
import 'package:deliverzler/modules/home/viewmodels/notification_order_viewmodel.dart';
import 'package:deliverzler/modules/home/viewmodels/main_orders_viewmodel.dart';

class OrdersScreen extends ConsumerWidget {
  final String? notificationOrderId;

  OrdersScreen({
    this.notificationOrderId,
    Key? key,
  }) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ref) {
    ref.watch(mainOrdersViewModel.notifier);
    ref.watch(notificationOrderViewModel(notificationOrderId).notifier);

    return PopUpPage(
      scaffoldKey: scaffoldKey,
      appBarWithMenu: true,
      appbarItems: [
        CustomText.h2(
          context,
          tr('appName'),
          color: AppColors.primaryColor,
        ),
      ],
      drawer: MainDrawer(
        scaffoldKey: scaffoldKey,
      ),
      child: Consumer(
        builder: (context, ref, child) {
          final upcomingOrdersStream = ref.watch(upcomingOrdersStreamProvider);
          return upcomingOrdersStream.when(
            data: (upcomingOrders) {
              return upcomingOrders.isEmpty
                  ? CustomText.h4(
                      context,
                      tr('thereAreNoOrders'),
                      color: AppColors.grey,
                      alignment: Alignment.center,
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.screenVPaddingDefault,
                        horizontal: Sizes.screenHPaddingMedium,
                      ),
                      itemBuilder: (context, index) {
                        return CardItemComponent(
                          orderModel: upcomingOrders[index],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: Sizes.vMarginHigh,
                      ),
                      itemCount: upcomingOrders.length,
                    );
            },
            error: (err, stack) => CustomText.h4(
              context,
              tr('somethingWentWrong') + '\n' + tr('pleaseTryAgainLater'),
              color: AppColors.grey,
              alignment: Alignment.center,
              textAlign: TextAlign.center,
            ),
            loading: () =>
                LoadingIndicators.instance.smallLoadingAnimation(context),
          );
        },
      ),
    );
  }
}
