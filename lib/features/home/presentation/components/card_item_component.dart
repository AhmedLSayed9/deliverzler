import 'package:flutter/material.dart';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/event.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/order.dart';
import '../../domain/update_delivery_status.dart';
import '../../domain/value_objects.dart';
import '../providers/selected_order_provider.dart';
import '../providers/update_delivery_status_provider/update_delivery_status_provider.dart';
import '../utils/order_dialog_helper.dart';
import 'card_button_component.dart';
import 'card_details_button_component.dart';
import 'card_order_details_component.dart';
import 'card_user_details_component.dart';

class CardItemComponent extends ConsumerWidget {
  const CardItemComponent({
    required this.order,
    super.key,
  });

  final AppOrder order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(currentUserProvider.select((user) => user.id));
    final isUpcomingOrder = order.deliveryStatus == DeliveryStatus.upcoming;

    bool confirmDeliveryId() {
      return OrderDialogHelper.confirmDeliveryId(
        context,
        deliveryId: userId,
        orderDeliveryId: order.deliveryId,
      );
    }

    Future<void> showMap() async {
      if (ref.read(updateDeliveryStatusStateProvider).isLoading) return;
      if (confirmDeliveryId() == false) return;

      ref.read(selectedOrderIdProvider.notifier).update((_) => Some(order.id));
      const MapRoute().go(context);
    }

    Future<void> confirmOrder() async {
      if (ref.read(updateDeliveryStatusStateProvider).isLoading) return;
      if (confirmDeliveryId() == false) return;

      final confirmChoice = await OrderDialogHelper.confirmChoiceDialog(
        context,
        tr(context).doYouWantToConfirmTheOrder,
      );
      if (confirmChoice) {
        final params = UpdateDeliveryStatus(
          orderId: order.id,
          deliveryStatus: DeliveryStatus.delivered,
        );
        ref
            .read(updateDeliveryStatusEventProvider.notifier)
            .update((_) => Some(Event.unique(params)));
      }
    }

    Future<void> deliverOrder() async {
      if (ref.read(updateDeliveryStatusStateProvider).isLoading) return;

      final confirmChoice = await OrderDialogHelper.confirmChoiceDialog(
        context,
        tr(context).doYouWantToDeliverTheOrder,
      );
      if (confirmChoice) {
        final params = UpdateDeliveryStatus(
          orderId: order.id,
          deliveryStatus: DeliveryStatus.onTheWay,
          deliveryId: userId,
        );
        ref
            .read(updateDeliveryStatusEventProvider.notifier)
            .update((_) => Some(Event.unique(params)));
      }
    }

    Future<void> cancelOrder() async {
      if (ref.read(updateDeliveryStatusStateProvider).isLoading) return;
      if (confirmDeliveryId() == false) return;

      final cancelNote = await OrderDialogHelper.showCancelOrderDialog(context);
      if (cancelNote != null) {
        final params = UpdateDeliveryStatus(
          orderId: order.id,
          deliveryStatus: DeliveryStatus.canceled,
          employeeCancelNote: cancelNote,
        );
        ref
            .read(updateDeliveryStatusEventProvider.notifier)
            .update((_) => Some(Event.unique(params)));
      }
    }

    return Card(
      elevation: 6,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.cardR12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.cardPaddingV16,
          horizontal: Sizes.cardPaddingH20,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CardOrderDetailsComponent(
                    order: order,
                  ),
                ),
                CardDetailsButtonComponent(
                  title: tr(context).details,
                  onPressed: () {
                    OrderDialogHelper.showOrderDetailsDialog(
                      context,
                      order: order,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: Sizes.marginV8,
            ),
            CardUserDetailsComponent(
              order: order,
            ),
            const SizedBox(
              height: Sizes.marginV8,
            ),
            if (!isUpcomingOrder)
              CardButtonComponent(
                title: tr(context).showMap,
                isColored: true,
                onPressed: showMap,
              ),
            const SizedBox(
              height: Sizes.marginV6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardButtonComponent(
                  title: tr(context).cancel,
                  isColored: false,
                  onPressed: cancelOrder,
                ),
                if (isUpcomingOrder)
                  CardButtonComponent(
                    title: tr(context).deliver,
                    isColored: true,
                    onPressed: deliverOrder,
                  )
                else
                  CardButtonComponent(
                    title: tr(context).confirm,
                    isColored: true,
                    onPressed: confirmOrder,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
