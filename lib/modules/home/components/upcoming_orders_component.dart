import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/widgets/loading_indicators.dart';
import 'package:deliverzler/modules/home/components/card_item_component.dart';
import 'package:deliverzler/modules/home/viewmodels/upcoming_orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpcomingOrdersComponent extends ConsumerWidget {
  const UpcomingOrdersComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final upcomingOrdersStream = ref.watch(upcomingOrdersStreamProvider);
    return upcomingOrdersStream.when(
      data: (upcomingOrders) {
        return upcomingOrders.isEmpty
            ? CustomText.h4(
                context,
                tr(context).thereAreNoOrders,
                color: AppColors.grey,
                alignment: Alignment.center,
              )
            : ListView.separated(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.screenVPaddingDefault(context),
                  horizontal: Sizes.screenHPaddingMedium(context),
                ),
                itemBuilder: (context, index) {
                  return CardItemComponent(
                    orderModel: upcomingOrders[index],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: Sizes.vMarginHigh(context),
                ),
                itemCount: upcomingOrders.length,
              );
      },
      error: (err, stack) => CustomText.h4(
        context,
        tr(context).somethingWentWrong + '\n' + tr(context).pleaseTryAgainLater,
        color: AppColors.grey,
        alignment: Alignment.center,
        textAlign: TextAlign.center,
      ),
      loading: () => LoadingIndicators.instance.smallLoadingAnimation(context),
    );
  }
}
