import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/styles.dart';
import '../../domain/place_autocomplete.dart';

class MapSearchMenuItem extends StatelessWidget {
  const MapSearchMenuItem({
    required this.placeAutocomplete,
    super.key,
  });
  final PlaceAutocomplete placeAutocomplete;

  @override
  Widget build(BuildContext context) {
    final title = placeAutocomplete.mainText;
    final subTitle = placeAutocomplete.secondaryText;

    return ListTile(
      horizontalTitleGap: 0,
      leading: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.place,
            size: Sizes.icon24,
          ),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.f16(context).copyWith(fontWeight: FontStyles.fontWeightBold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subTitle,
            style: TextStyles.f14(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
