import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../../gen/my_assets.dart';
import '../../core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import 'custom_text.dart';
import 'platform_widgets/platform_circluar_progress_indicator.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV28,
        horizontal: Sizes.dialogPaddingH20,
      ),
      child: Column(
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
          if (message case final message?) ...[
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

class DeliveryLoadingAnimation extends StatelessWidget {
  const DeliveryLoadingAnimation({
    this.height = Sizes.loadingIndicatorR150,
    this.width = Sizes.loadingIndicatorR150,
    super.key,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColoredBox(
        color: Colors.transparent,
        child: Lottie.asset(
          MyAssets.ASSETS_IMAGES_CORE_LOADING_ANIMATION_JSON,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
