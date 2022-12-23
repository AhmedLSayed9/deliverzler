import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_circluar_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';

abstract class LoadingIndicators {
  static Widget defaultLoadingIndicator(
    BuildContext context, {
    String? message,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV30(context),
        horizontal: Sizes.dialogPaddingH20(context),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PlatformCircularProgressIndicator(
            color: customColors(context).loadingIndicatorColor,
            materialData: MaterialProgressIndicatorData(
              strokeWidth: 3,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                customColors(context).loadingIndicatorColor!,
              ),
            ),
            cupertinoData: const CupertinoActivityIndicatorData(
              radius: 20,
            ),
          ),
          if (message != null)
            CustomText.f16(
              context,
              message,
              alignment: Alignment.center,
              weight: FontStyles.fontWeightSemiBold,
              margin: EdgeInsets.only(top: Sizes.marginV22(context)),
            ),
        ],
      ),
    );
  }

  static Widget smallLoadingAnimation(
    BuildContext context, {
    double? height,
    double? width,
  }) {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Lottie.asset(
          AppImages.loadingAnimation,
          height: height ?? Sizes.loadingIndicatorRadius150(context),
          width: width ?? Sizes.loadingIndicatorRadius150(context),
        ),
      ),
    );
  }
}
