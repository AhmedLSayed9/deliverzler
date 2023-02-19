import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/domain/entities/event.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/routing/navigation_service.dart';
import '../../../../core/presentation/routing/route_paths.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../domain/entities/order.dart';
import '../../domain/use_cases/update_delivery_status_uc.dart';
import '../providers/selected_order_provider.dart';
import '../providers/update_delivery_status_provider/update_delivery_status_provider.dart';
import '../utils/enums.dart';
import '../utils/order_dialog_helper.dart';
import 'card_button_component.dart';
import 'card_details_button_component.dart';
import 'card_order_details_component.dart';
import 'card_user_details_component.dart';

class CardItemComponent extends HookConsumerWidget {
  const CardItemComponent({
    required this.order,
    Key? key,
  }) : super(key: key);

  final AppOrder order;

  @override
  Widget build(BuildContext context, ref) {
    final userId = ref.watch(currentUserProvider.select((user) => user.id));
    final bool isUpcomingOrder =
        order.deliveryStatus == DeliveryStatus.upcoming;

    final confirmDeliveryId = useCallback(() {
      return OrderDialogHelper.confirmDeliveryId(
        context,
        deliveryId: userId,
        orderDeliveryId: order.deliveryId,
      );
    }, []);

    final showMap = useCallback(() async {
      if (ref.read(updateDeliveryStatusStateProvider).isLoading) return;
      if (confirmDeliveryId() == false) return;

      final container = ProviderScope.containerOf(context);
      final sub = container.listen(selectedOrderIdProvider, (prev, value) {});
      ref.read(selectedOrderIdProvider.notifier).update((_) => Some(order.id));
      await NavigationService.push(
        context,
        isNamed: true,
        page: RoutePaths.map,
      );
      sub.close();
    }, []);

    final confirmOrder = useCallback(() async {
      if (ref.read(updateDeliveryStatusStateProvider).isLoading) return;
      if (confirmDeliveryId() == false) return;

      final bool confirmChoice = await OrderDialogHelper.confirmChoiceDialog(
        context,
        tr(context).doYouWantToConfirmTheOrder,
      );
      if (confirmChoice) {
        final params = UpdateDeliveryStatusParams(
          orderId: order.id,
          deliveryStatus: DeliveryStatus.delivered,
        );
        ref
            .read(updateDeliveryStatusEventProvider.notifier)
            .update((_) => Some(Event.unique(params)));
      }
    }, []);

    final deliverOrder = useCallback(() async {
      if (ref.read(updateDeliveryStatusStateProvider).isLoading) return;

      final bool confirmChoice = await OrderDialogHelper.confirmChoiceDialog(
        context,
        tr(context).doYouWantToDeliverTheOrder,
      );
      if (confirmChoice) {
        final params = UpdateDeliveryStatusParams(
          orderId: order.id,
          deliveryStatus: DeliveryStatus.onTheWay,
          deliveryId: userId,
        );
        ref
            .read(updateDeliveryStatusEventProvider.notifier)
            .update((_) => Some(Event.unique(params)));
      }
    }, []);

    final cancelOrder = useCallback(() async {
      if (ref.read(updateDeliveryStatusStateProvider).isLoading) return;
      if (confirmDeliveryId() == false) return;

      final cancelNote = await OrderDialogHelper.showCancelOrderDialog(context);
      if (cancelNote != null) {
        final params = UpdateDeliveryStatusParams(
          orderId: order.id,
          deliveryStatus: DeliveryStatus.canceled,
          employeeCancelNote: cancelNote,
        );
        ref
            .read(updateDeliveryStatusEventProvider.notifier)
            .update((_) => Some(Event.unique(params)));
      }
    }, []);

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
                isUpcomingOrder
                    ? CardButtonComponent(
                        title: tr(context).deliver,
                        isColored: true,
                        onPressed: deliverOrder,
                      )
                    : CardButtonComponent(
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
