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
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV28,
        horizontal: Sizes.dialogPaddingH20,
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
          if (message != null) ...[
            const SizedBox(
              height: Sizes.marginV20,
            ),
            CustomText.f16(
              context,
              message,
              weight: FontStyles.fontWeightSemiBold,
              textAlign: TextAlign.center,
            ),
          ]
        ],
      ),
    );
  }
}

class SmallLoadingAnimation extends StatelessWidget {
  const SmallLoadingAnimation(
      {this.height = Sizes.loadingIndicatorR150,
      this.width = Sizes.loadingIndicatorR150,
      Key? key})
      : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Lottie.asset(
          AppImages.loadingAnimation,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
