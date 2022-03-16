import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_image.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class MainDrawerBottomComponent extends ConsumerWidget {
  const MainDrawerBottomComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: LocalizationService.instance.isAr(context)
          ? EdgeInsets.only(
              right: Sizes.mainDrawerHPadding(context),
            )
          : EdgeInsets.only(
              left: Sizes.mainDrawerHPadding(context),
            ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomText.h3(
            context,
            tr(context).appName,
            weight: FontStyles.fontWeightExtraBold,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            width: Sizes.hMarginComment(context),
          ),
          CustomImage.s4(
            context,
            AppImages.appLogoIcon,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
