import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../helpers/map_coordinates_helper.dart';
import '../providers/target_location_providers/target_location_directions_provider.dart';

class MapDirectionsInfoComponent extends ConsumerWidget {
  const MapDirectionsInfoComponent({super.key});

  static final BorderRadius _mapDirectionsInfoRadius = BorderRadius.circular(20);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetLocationDirections = ref.watch(targetLocationDirectionsProvider);

    return targetLocationDirections.fold(
      () => const SizedBox(),
      (directions) => Positioned(
        top: Sizes.mapDirectionsInfoTop,
        child: Material(
          elevation: 2,
          borderRadius: _mapDirectionsInfoRadius,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.paddingV8,
              horizontal: Sizes.paddingH20,
            ),
            decoration: BoxDecoration(
              color: AppStaticColors.lightBlue,
              borderRadius: _mapDirectionsInfoRadius,
            ),
            child: Text(
              MapCoordinatesHelper.getDirectionInfoText(directions),
              style: TextStyles.f14(context).copyWith(
                color: customColors(context).blackColor,
                fontWeight: FontStyles.fontWeightBold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
