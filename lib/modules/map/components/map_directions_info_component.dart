import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/modules/map/viewmodels/map_selected_place_viewmodel.dart';

class MapDirectionsInfoComponent extends ConsumerWidget {
  const MapDirectionsInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final infoText = ref.watch(
      mapSelectedPlaceViewModel.select((vm) {
        if (vm.selectedPlaceDistance != null &&
            vm.selectedPlaceDuration != null) {
          return vm.selectedPlaceDistance! + ', ' + vm.selectedPlaceDuration!;
        }
      }),
    );

    return infoText != null
        ? Positioned(
            top: Sizes.mapDirectionsInfoTop(context),
            child: Material(
              elevation: 2,
              borderRadius:
                  BorderRadius.circular(Sizes.mapDirectionsInfoRadius(context)),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.vPaddingTiny(context),
                  horizontal: Sizes.hPaddingSmall(context),
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(
                      Sizes.mapDirectionsInfoRadius(context)),
                ),
                child: CustomText.h5(
                  context,
                  infoText,
                  weight: FontStyles.fontWeightBold,
                  color: AppColors.lightBlack,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
