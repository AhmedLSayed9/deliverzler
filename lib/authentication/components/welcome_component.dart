import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
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
              tr('welcome'),
              color: AppColors.primaryColor,
              textAlign: TextAlign.start,
            ),
            CustomImage.s3(
              AppImages.hiHand,
              padding: EdgeInsets.only(bottom: Sizes.vPaddingTiny),
            ),
          ],
        ),
        SizedBox(
          height: Sizes.vMarginSmall,
        ),
        CustomText.h4(
          context,
          tr('signInToYourAccount'),
          color: AppColors.grey,
          weight: FontStyles.fontWeightMedium,
        ),
      ],
    );
  }
}
