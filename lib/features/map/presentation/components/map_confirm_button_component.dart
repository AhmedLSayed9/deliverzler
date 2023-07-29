import 'package:flutter/material.dart';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/event.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
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

    bool confirmDeliveryId() {
      final userId = ref.read(currentUserProvider).id;
      final orderId = ref.read(selectedOrderProvider).toNullable()?.id;
      return OrderDialogs.confirmDeliveryId(
        context,
        deliveryId: userId,
        orderDeliveryId: orderId,
      );
    }

    Future<void> confirmOrder() async {
      if (ref.read(mapConfirmOrderStatusProvider).isLoading) return;
      if (confirmDeliveryId() == false) return;

      final confirmChoice = await OrderDialogs.confirmChoiceDialog(
        context,
        tr(context).doYouWantToConfirmTheOrder,
      );
      if (!confirmChoice) return;

      final order = ref.read(selectedOrderProvider);
      order.match(
        () {},
        (order) {
          final params = UpdateDeliveryStatus(
            orderId: order.id,
            deliveryStatus: DeliveryStatus.delivered,
          );
          ref.read(mapConfirmOrderEventProvider.notifier).update((_) => Some(Event.unique(params)));
        },
      );
    }

    return arrivedTargetLocation
        ? Positioned(
            bottom: Sizes.mapConfirmButtonBottom,
            left: Sizes.mapConfirmButtonLeft,
            child: CustomElevatedButton(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 88),
              buttonColor: Theme.of(context).colorScheme.primary,
              elevation: 2,
              onPressed: confirmOrder,
              child: CustomText.f18(
                context,
                tr(context).confirm,
                color: customColors(context).whiteColor,
                weight: FontStyles.fontWeightMedium,
              ),
            ),
          )
        : const SizedBox();
  }
}
