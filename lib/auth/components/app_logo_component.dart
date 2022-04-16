import 'package:flutter/material.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_image.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class AppLogoComponent extends StatelessWidget {
  const AppLogoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImage(
          context,
          AppImages.appLogoIcon,
          height: Sizes.loginLogoSize(context),
          width: Sizes.loginLogoSize(context),
          fit: BoxFit.cover,
          imageAndTitleAlignment: MainAxisAlignment.start,
        ),
        SizedBox(
          height: Sizes.vMarginSmallest(context),
        ),
        CustomText.h1(
          context,
          tr(context).appName,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
