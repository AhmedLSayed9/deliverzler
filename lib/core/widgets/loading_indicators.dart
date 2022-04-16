import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/widgets/platform_widgets/platform_circluar_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/sizes.dart';

class LoadingIndicators {
  LoadingIndicators._();

  static final instance = LoadingIndicators._();

  Widget defaultLoadingIndicator(
    BuildContext context, {
    String? message,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const PlatformCircularProgressIndicator(
            strokeWidth: 3,
            backgroundColor: Colors.transparent,
            color: AppColors.lightThemePrimary,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.lightThemePrimary,
            ),
            radius: 20,
          ),
          if (message != null)
            CustomText.h5(
              context,
              message,
              alignment: Alignment.center,
              weight: FontStyles.fontWeightMedium,
              color: Theme.of(context).textTheme.headline4!.color,
              margin: EdgeInsets.only(top: Sizes.vMarginHigh(context)),
            ),
        ],
      ),
    );
  }

  Widget smallLoadingAnimation(
    BuildContext context, {
    double? height,
    double? width,
  }) {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Lottie.asset(
          AppImages.loadingAnimation,
          height: height ?? Sizes.loadingAnimationDefaultHeight(context),
          width: width ?? Sizes.loadingAnimationDefaultWidth(context),
        ),
      ),
    );
  }
}
