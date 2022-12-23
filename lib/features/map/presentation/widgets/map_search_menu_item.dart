import 'package:deliverzler/features/map/domain/entities/place_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

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
          children: [
            Icon(
              Icons.place,
              size: Sizes.icon24(context),
            ),
          ],
        ),
        title: Column(
          children: [
            CustomText.f18(
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
