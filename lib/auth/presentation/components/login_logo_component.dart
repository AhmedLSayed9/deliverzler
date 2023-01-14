import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class LoginLogoComponent extends StatelessWidget {
  const LoginLogoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.appLogoIcon,
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
