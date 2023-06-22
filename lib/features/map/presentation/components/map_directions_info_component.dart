import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
import '../helpers/map_coordinates_helper.dart';
import '../providers/target_location_providers/target_location_directions_provider.dart';

class MapDirectionsInfoComponent extends ConsumerWidget {
  const MapDirectionsInfoComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetLocationDirections =
        ref.watch(targetLocationDirectionsProvider);

    return targetLocationDirections.fold(
      () => const SizedBox(),
      (directions) => Positioned(
        top: Sizes.mapDirectionsInfoTop,
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(Sizes.mapDirectionsInfoRadius),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.paddingV8,
              horizontal: Sizes.paddingH20,
            ),
            decoration: BoxDecoration(
              color: AppStaticColors.lightBlue,
              borderRadius:
                  BorderRadius.circular(Sizes.mapDirectionsInfoRadius),
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
