import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
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
            bottom: Sizes.mapConfirmButtonBottom(context),
            left: Sizes.mapConfirmButtonLeft(context),
            child: CustomButton(
              child: CustomText.h4(
                context,
                tr(context).confirm,
                color: AppColors.white,
                weight: FontStyles.fontWeightMedium,
                alignment: Alignment.center,
              ),
              height: Sizes.roundedButtonDefaultHeight(context),
              width: Sizes.roundedButtonHighWidth(context),
              buttonColor: AppColors.lightThemePrimary,
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
