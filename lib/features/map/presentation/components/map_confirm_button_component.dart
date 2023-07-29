import 'package:flutter/material.dart';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/event.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../home/domain/orders_service.dart';
import '../../../home/domain/update_delivery_status.dart';
import '../../../home/domain/value_objects.dart';
import '../../../home/presentation/providers/selected_order_provider.dart';
import '../../../home/presentation/widgets/order_dialogs.dart';
import '../providers/is_arrived_target_location_provider.dart';
import '../providers/map_confirm_order_provider.dart';

class MapConfirmButtonComponent extends ConsumerWidget {
  const MapConfirmButtonComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arrivedTargetLocation = ref.watch(isArrivedTargetLocationProvider);

    Future<void> confirmOrder() async {
      final authority = ref.read(ordersServiceProvider).orderAuthority(
            userId: ref.read(currentUserProvider).id,
            orderDeliveryId: ref.read(selectedOrderProvider).toNullable()?.id,
          );

      switch (authority) {
        case (canProceed: true, isEnabled: true):
          final confirmChoice = await OrderDialogs.confirmChoiceDialog(
            context,
            tr(context).doYouWantToConfirmTheOrder,
          );
          if (confirmChoice) {
            final order = ref.read(selectedOrderProvider);
            order.match(
              () {},
              (order) {
                final params = UpdateDeliveryStatus(
                  orderId: order.id,
                  deliveryStatus: DeliveryStatus.delivered,
                );
                ref
                    .read(mapConfirmOrderEventProvider.notifier)
                    .update((_) => Some(Event.unique(params)));
              },
            );
          }
        case (canProceed: false, isEnabled: _):
          OrderDialogs.showCanNotProceedDialog(context);
        case _:
          return;
      }
    }

    return arrivedTargetLocation
        ? Positioned(
            bottom: 36,
            left: 36,
            child: CustomElevatedButton(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 88),
              buttonColor: Theme.of(context).colorScheme.primary,
              elevation: 2,
              onPressed: confirmOrder,
              child: Text(
                tr(context).confirm,
                style: TextStyles.coloredElevatedButton(context).copyWith(fontSize: Sizes.font18),
              ),
            ),
          )
        : const SizedBox();
  }
}
