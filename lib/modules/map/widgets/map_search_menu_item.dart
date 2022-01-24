import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/modules/map/models/place_search_model.dart';

class MapSearchMenuItem extends StatelessWidget {
  final PlaceSearchModel placeSearchModel;

  const MapSearchMenuItem({
    required this.placeSearchModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = placeSearchModel.mainText;
    final subTitle = placeSearchModel.secondaryText;
    return ListTile(
      horizontalTitleGap: 0,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.place,
            size: Sizes.iconsSizes['s5'],
          ),
        ],
      ),
      title: Column(
        children: [
          CustomText.h4(
            context,
            title,
            weight: FontStyles.fontWeightBold,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          CustomText.h5(
            context,
            subTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
