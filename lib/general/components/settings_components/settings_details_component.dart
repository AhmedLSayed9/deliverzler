import 'package:flutter/material.dart';
import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/cached_network_image_circular.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class SettingsDetailsComponent extends StatelessWidget {
  const SettingsDetailsComponent({
    required this.userModel,
    Key? key,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText.h2(
                context,
                userModel.name!.isEmpty
                    ? 'User${userModel.uId.substring(0, 6)}'
                    : userModel.name!,
                weight: FontStyles.fontWeightBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              CustomText.h4(
                context,
                userModel.email,
                color: Theme.of(context).textTheme.headline5!.color,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(
          width: Sizes.hMarginDot(context),
        ),
        CachedNetworkImageCircular(
          imageUrl: userModel.image,
          radius: Sizes.userImageSmallRadius(context),
        ),
      ],
    );
  }
}
