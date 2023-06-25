import 'package:flutter/material.dart';

import '../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../core/presentation/helpers/localization_helper.dart';
import '../../../core/presentation/styles/font_styles.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/widgets/custom_icon.dart';
import '../../../core/presentation/widgets/custom_text.dart';
import '../../../gen/my_assets.dart';

class WelcomeComponent extends StatelessWidget {
  const WelcomeComponent({super.key});

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
              MyAssets.ASSETS_IMAGES_LOGIN_HI_HAND_PNG,
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
