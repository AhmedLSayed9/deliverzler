import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/widgets/custom_image.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class WelcomeComponent extends StatelessWidget {
  const WelcomeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText.h2(
              context,
              tr(context).welcome,
              color: AppColors.primaryColor,
              textAlign: TextAlign.start,
            ),
            CustomImage.s3(
              context,
              AppImages.hiHand,
              padding: EdgeInsets.only(bottom: Sizes.vPaddingTiny(context)),
            ),
          ],
        ),
        SizedBox(
          height: Sizes.vMarginSmall(context),
        ),
        CustomText.h4(
          context,
          tr(context).signInToYourAccount,
          color: AppColors.grey,
          weight: FontStyles.fontWeightMedium,
        ),
      ],
    );
  }
}
