import 'package:deliverzler/modules/home/components/card_details_button_component.dart';
import 'package:deliverzler/modules/home/components/card_user_details_component.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/modules/home/components/card_button_component.dart';
import 'package:deliverzler/modules/home/components/card_order_details_component.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:deliverzler/modules/home/utils/enums.dart';
import 'package:deliverzler/modules/home/viewmodels/order_dialogs_viewmodel.dart';

class CardItemComponent extends ConsumerWidget {
  const CardItemComponent({
    required this.orderModel,
    Key? key,
  }) : super(key: key);

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context, ref) {
    final orderDialogsVM = ref.watch(orderDialogsViewModel.notifier);
    final bool _isUpcomingOrder = orderModel.orderDeliveryStatus ==
        describeEnum(OrderDeliveryStatus.upcoming);

    return Card(
      elevation: 6,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.cardRadius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.cardVPadding,
          horizontal: Sizes.cardHRadius,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CardOrderDetailsComponent(
                    orderModel: orderModel,
                  ),
                ),
                CardDetailsButtonComponent(
                  title: tr('details'),
                  onPressed: () {
                    orderDialogsVM.showOrderDetailsDialog(
                      orderModel: orderModel,
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: Sizes.vMarginSmallest,
            ),
            CardUserDetailsComponent(
              orderModel: orderModel,
            ),
            SizedBox(
              height: Sizes.vMarginSmallest,
            ),
            if (!_isUpcomingOrder)
              CardButtonComponent(
                title: tr('showMap'),
                isColored: true,
                onPressed: () {
                  orderDialogsVM.showMapForOrder(
                    orderModel: orderModel,
                  );
                },
              ),
            SizedBox(
              height: Sizes.vMarginComment,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardButtonComponent(
                  title: tr('cancel'),
                  isColored: false,
                  onPressed: () {
                    orderDialogsVM.showCancelOrderDialog(
                      orderModel: orderModel,
                    );
                  },
                ),
                _isUpcomingOrder
                    ? CardButtonComponent(
                        title: tr('deliver'),
                        isColored: true,
                        onPressed: () {
                          orderDialogsVM.showDeliverOrderDialog(
                            orderModel: orderModel,
                          );
                        },
                      )
                    : CardButtonComponent(
                        title: tr('confirm'),
                        isColored: true,
                        onPressed: () {
                          orderDialogsVM.showConfirmOrderDialog(
                            orderModel: orderModel,
                          );
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
