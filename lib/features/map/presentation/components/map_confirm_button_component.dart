import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../auth/presentation/providers/user_provider.dart';
import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
import '../../../home/domain/use_cases/update_delivery_status_uc.dart';
import '../../../home/presentation/providers/selected_order_provider.dart';
import '../../../home/presentation/utils/enums.dart';
import '../../../home/presentation/utils/order_dialog_helper.dart';
import '../providers/is_arrived_target_location_provider.dart';
import '../providers/map_confirm_order_provider.dart';

class MapConfirmButtonComponent extends HookConsumerWidget {
  const MapConfirmButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final arrivedTargetLocation = ref.watch(isArrivedTargetLocationProvider);

    final confirmDeliveryId = useCallback(() {
      final userId = ref.read(currentUserProvider).id;
      final orderId = ref.read(selectedOrderProvider).toNullable()?.id;
      return OrderDialogHelper.confirmDeliveryId(
        context,
        deliveryId: userId,
        orderDeliveryId: orderId,
      );
    }, []);

    final confirmOrder = useCallback(() async {
      if (ref.read(mapConfirmOrderStatusProvider).isLoading) return;
      if (confirmDeliveryId() == false) return;

      final bool confirmChoice = await OrderDialogHelper.confirmChoiceDialog(
        context,
        tr(context).doYouWantToConfirmTheOrder,
      );
      if (!confirmChoice) return;

      final order = ref.read(selectedOrderProvider);
      order.match(
        () {},
        (order) {
          final params = UpdateDeliveryStatusParams(
            orderId: order.id,
            deliveryStatus: DeliveryStatus.delivered,
          );
          ref
              .read(mapConfirmOrderEventProvider.notifier)
              .update((_) => Some(params));
        },
      );
    }, []);

    return arrivedTargetLocation
        ? Positioned(
            bottom: Sizes.mapConfirmButtonBottom,
            left: Sizes.mapConfirmButtonLeft,
            child: CustomButton(
              height: Sizes.buttonHeight48,
              width: Sizes.buttonWidth240,
              buttonColor: Theme.of(context).colorScheme.primary,
              elevation: 2,
              onPressed: confirmOrder,
              child: CustomText.f18(
                context,
                tr(context).confirm,
                color: customColors(context).whiteColor,
                weight: FontStyles.fontWeightMedium,
                //alignment: Alignment.center,
              ),
            ),
          )
        : const SizedBox();
  }
}
