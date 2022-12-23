import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/routing/route_paths.dart';
import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:deliverzler/features/home/domain/use_cases/update_delivery_status_uc.dart';
import 'package:deliverzler/features/home/presentation/components/card_button_component.dart';
import 'package:deliverzler/features/home/presentation/components/card_details_button_component.dart';
import 'package:deliverzler/features/home/presentation/components/card_order_details_component.dart';
import 'package:deliverzler/features/home/presentation/components/card_user_details_component.dart';
import 'package:deliverzler/features/home/presentation/utils/enums.dart';
import 'package:deliverzler/features/home/presentation/utils/order_dialog_helper.dart';
import 'package:deliverzler/features/home/presentation/providers/selected_order_provider.dart';
import 'package:deliverzler/features/home/presentation/providers/update_delivery_status_provider/update_delivery_status_provider.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardItemComponent extends HookConsumerWidget {
  const CardItemComponent({
    required this.order,
    Key? key,
  }) : super(key: key);

  final Order order;

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
      final sub = container.listen<fp.Option<String>>(
          selectedOrderIdProvider, (prev, value) {});
      ref.read(selectedOrderIdProvider.notifier).state = fp.Some(order.orderId);
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
          orderId: order.orderId,
          deliveryStatus: DeliveryStatus.delivered,
        );
        ref.read(updateDeliveryStatusParamsProvider.notifier).state =
            fp.Some(params);
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
          orderId: order.orderId,
          deliveryStatus: DeliveryStatus.onTheWay,
          deliveryId: userId,
        );
        ref.read(updateDeliveryStatusParamsProvider.notifier).state =
            fp.Some(params);
      }
    }, []);

    final cancelOrder = useCallback(() async {
      if (ref.read(updateDeliveryStatusStateProvider).isLoading) return;
      if (confirmDeliveryId() == false) return;

      final cancelNote = await OrderDialogHelper.showCancelOrderDialog(context);
      if (cancelNote != null) {
        final params = UpdateDeliveryStatusParams(
          orderId: order.orderId,
          deliveryStatus: DeliveryStatus.canceled,
          employeeCancelNote: cancelNote,
        );
        ref.read(updateDeliveryStatusParamsProvider.notifier).state =
            fp.Some(params);
      }
    }, []);

    return Card(
      elevation: 6,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.cardRadius14(context)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.cardPaddingV16(context),
          horizontal: Sizes.cardPaddingH20(context),
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
            SizedBox(
              height: Sizes.marginV10(context),
            ),
            CardUserDetailsComponent(
              order: order,
            ),
            SizedBox(
              height: Sizes.marginV10(context),
            ),
            if (!isUpcomingOrder)
              CardButtonComponent(
                title: tr(context).showMap,
                isColored: true,
                onPressed: showMap,
              ),
            SizedBox(
              height: Sizes.marginV8(context),
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
