import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/features/home/domain/use_cases/update_delivery_status_uc.dart';
import 'package:deliverzler/features/home/presentation/utils/enums.dart';
import 'package:deliverzler/features/home/presentation/utils/order_dialog_helper.dart';
import 'package:deliverzler/features/home/presentation/providers/selected_order_provider.dart';
import 'package:deliverzler/features/map/presentation/providers/is_arrived_target_location_provider.dart';
import 'package:deliverzler/features/map/presentation/providers/map_confirm_order_provider.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_button.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapConfirmButtonComponent extends HookConsumerWidget {
  const MapConfirmButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final arrivedTargetLocation = ref.watch(isArrivedTargetLocationProvider);

    final confirmDeliveryId = useCallback(() {
      final userId = ref.read(currentuserControllerProvider).id;
      final orderId = ref.read(selectedOrderProvider).toNullable()?.orderId;
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
            orderId: order.orderId,
            deliveryStatus: DeliveryStatus.delivered,
          );
          ref.read(mapConfirmOrderParamsProvider.notifier).state = Some(params);
        },
      );
    }, []);

    return arrivedTargetLocation
        ? Positioned(
            bottom: Sizes.mapConfirmButtonBottom(context),
            left: Sizes.mapConfirmButtonLeft(context),
            child: CustomButton(
              height: Sizes.buttonHeight50(context),
              width: Sizes.buttonWidth264(context),
              buttonColor: Theme.of(context).colorScheme.primary,
              elevation: 2,
              onPressed: confirmOrder,
              child: CustomText.f18(
                context,
                tr(context).confirm,
                color: customColors(context).whiteColor,
                weight: FontStyles.fontWeightMedium,
                alignment: Alignment.center,
              ),
            ),
          )
        : const SizedBox();
  }
}
