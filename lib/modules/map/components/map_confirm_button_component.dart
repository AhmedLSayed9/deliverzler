import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/services/navigation_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/modules/home/viewmodels/order_dialogs_viewmodel.dart';
import 'package:deliverzler/modules/home/viewmodels/selected_order_providers.dart';
import 'package:deliverzler/modules/map/viewmodels/map_selected_place_viewmodel.dart';

class MapConfirmButtonComponent extends ConsumerWidget {
  const MapConfirmButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isArrivedSelectedPlace = ref.watch(mapSelectedPlaceViewModel
        .select((selectedPlaceVM) => selectedPlaceVM.isArrivedSelectedPlace));
    final orderDialogsVM = ref.watch(orderDialogsViewModel.notifier);

    return isArrivedSelectedPlace
        ? Positioned(
            bottom: Sizes.mapConfirmButtonBottom,
            left: Sizes.mapConfirmButtonLeft,
            child: CustomButton(
              child: CustomText.h4(
                context,
                tr('confirm'),
                color: AppColors.white,
                weight: FontStyles.fontWeightMedium,
                alignment: Alignment.center,
              ),
              height: Sizes.roundedButtonDefaultHeight,
              width: Sizes.roundedButtonHighWidth,
              buttonColor: AppColors.primaryColor,
              elevation: 2,
              onPressed: () async {
                final _orderConfirmed =
                    await orderDialogsVM.showConfirmOrderDialog(
                  orderModel: ref.read(selectedOrderProvider)!,
                );
                if (_orderConfirmed) {
                  NavigationService.goBack();
                }
              },
            ),
          )
        : const SizedBox();
  }
}
