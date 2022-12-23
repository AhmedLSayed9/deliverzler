import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/features/map/presentation/helpers/map_coordinates_helper.dart';
import 'package:deliverzler/features/map/presentation/providers/target_location_providers/target_location_directions_provider.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapDirectionsInfoComponent extends ConsumerWidget {
  const MapDirectionsInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final targetLocationDirections =
        ref.watch(targetLocationDirectionsProvider);

    return targetLocationDirections.fold(
      () => const SizedBox(),
      (directions) => Positioned(
        top: Sizes.mapDirectionsInfoTop(context),
        child: Material(
          elevation: 2,
          borderRadius:
              BorderRadius.circular(Sizes.mapDirectionsInfoRadius(context)),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.paddingV6(context),
              horizontal: Sizes.paddingH16(context),
            ),
            decoration: BoxDecoration(
              color: AppStaticColors.lightBlue,
              borderRadius:
                  BorderRadius.circular(Sizes.mapDirectionsInfoRadius(context)),
            ),
            child: CustomText.f14(
              context,
              MapCoordinatesHelper.getDirectionInfoText(directions),
              weight: FontStyles.fontWeightBold,
              color: customColors(context).blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
