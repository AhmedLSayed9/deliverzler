import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
import '../../domain/entities/place_autocomplete.dart';

class MapSearchMenuItem extends StatelessWidget {
  final PlaceAutocomplete placeAutocomplete;

  const MapSearchMenuItem({
    required this.placeAutocomplete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = placeAutocomplete.mainText;
    final subTitle = placeAutocomplete.secondaryText;

    return Material(
      child: ListTile(
        horizontalTitleGap: 0,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.place,
              size: Sizes.icon24,
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.f16(
              context,
              title,
              weight: FontStyles.fontWeightBold,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            CustomText.f14(
              context,
              subTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
