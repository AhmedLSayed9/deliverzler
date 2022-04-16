import 'package:deliverzler/modules/map/services/map_service.dart';
import 'package:deliverzler/modules/map/viewmodels/selected_place_providers/selected_place_directions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class MapDirectionsInfoComponent extends ConsumerWidget {
  const MapDirectionsInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _selectedPlaceDirection = ref.watch(selectedPlaceDirectionsProvider);

    return _selectedPlaceDirection != null
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
                  MapService.instance
                      .getDirectionInfoText(_selectedPlaceDirection),
                  weight: FontStyles.fontWeightBold,
                  color: AppColors.lightBlack,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
