import 'package:flutter/material.dart';

import '../../../core/presentation/helpers/localization_helper.dart';
import '../../../core/presentation/styles/styles.dart';
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
          height: 140,
          width: 140,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: Sizes.marginV12,
        ),
        Text(
          tr(context).appName,
          style: TextStyles.f28(context),
        ),
      ],
    );
  }
}
