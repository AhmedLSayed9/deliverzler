import 'package:flutter/material.dart';

import '../../../core/presentation/helpers/localization_helper.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/widgets/custom_text.dart';
import '../../../gen/my_assets.dart';

class LoginLogoComponent extends StatelessWidget {
  const LoginLogoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          MyAssets.ASSETS_IMAGES_CORE_APP_LOGO_PNG,
          height: Sizes.imageR140,
          width: Sizes.imageR140,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: Sizes.marginV12,
        ),
        CustomText.f28(
          context,
          tr(context).appName,
        ),
      ],
    );
  }
}
