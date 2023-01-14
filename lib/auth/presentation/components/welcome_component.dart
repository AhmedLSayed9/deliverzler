import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/widgets/custom_icon.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class WelcomeComponent extends StatelessWidget {
  const WelcomeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: CustomText.f20(
                context,
                tr(context).welcome,
                color: Theme.of(context).colorScheme.primary,
                textAlign: TextAlign.start,
              ),
            ),
            CustomIcon.i48(
              AppImages.hiHand,
              padding: const EdgeInsetsDirectional.only(
                bottom: Sizes.marginV6,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: Sizes.marginV12,
        ),
        CustomText.f16(
          context,
          tr(context).signInToYourAccount,
          color: customColors(context).greyColor,
          weight: FontStyles.fontWeightSemiBold,
        ),
      ],
    );
  }
}
