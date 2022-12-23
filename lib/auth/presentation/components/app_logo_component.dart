import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class AppLogoComponent extends StatelessWidget {
  const AppLogoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.appLogoIcon,
          height: Sizes.imageRadius126(context),
          width: Sizes.imageRadius126(context),
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: Sizes.marginV10(context),
        ),
        CustomText.f32(
          context,
          tr(context).appName,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
