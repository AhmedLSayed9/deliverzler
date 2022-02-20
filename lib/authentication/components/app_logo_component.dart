import 'package:flutter/material.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
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
          AppImages.appLogoIcon,
          height: Sizes.loginLogoSize,
          width: Sizes.loginLogoSize,
          fit: BoxFit.cover,
          imageAndTitleAlignment: MainAxisAlignment.start,
        ),
        SizedBox(
          height: Sizes.vMarginSmallest,
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
