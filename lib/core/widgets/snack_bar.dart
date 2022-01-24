import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static showCommonRawSnackBar(
    BuildContext context, {
    String title = '',
    String description = '',
    Gradient? backgroundGradient,
    double? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Duration duration = const Duration(seconds: 4),
    SnackPosition snackPosition = SnackPosition.TOP,
    bool isDismissible = true,
    DismissDirection dismissDirection = DismissDirection.up,
    Function? onTap,
  }) {
    Get.rawSnackbar(
      titleText: CustomText.h4(
        context,
        title,
        weight: FontStyles.fontWeightMedium,
        color: AppColors.lightBlack,
      ),
      messageText: CustomText.h5(
        context,
        description,
        color: AppColors.lightBlack,
      ),
      backgroundGradient:
          backgroundGradient ?? AppColors.primaryIngredientColor,
      borderRadius: borderRadius ?? Sizes.snackBarRadius,
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: Sizes.vPaddingSmall,
            horizontal: Sizes.hPaddingMedium,
          ),
      margin: margin ??
          EdgeInsets.symmetric(
            horizontal: Sizes.hMarginComment,
          ),
      duration: duration,
      snackPosition: snackPosition,
      dismissDirection: dismissDirection,
      isDismissible: isDismissible,
      onTap: (data) {},
    );
  }
}
