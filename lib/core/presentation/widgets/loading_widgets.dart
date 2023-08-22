import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:lottie/lottie.dart';

import '../../../gen/my_assets.dart';
import '../../core_features/theme/presentation/utils/custom_colors.dart';
import '../styles/styles.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({this.padding, super.key});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: padding,
      child: PlatformCircularProgressIndicator(
        material: (_, __) {
          return MaterialProgressIndicatorData(
            strokeWidth: 3,
            backgroundColor: Colors.transparent,
            color: customColors(context).loadingIndicatorColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              customColors(context).loadingIndicatorColor!,
            ),
          );
        },
        cupertino: (_, __) {
          return CupertinoProgressIndicatorData(
            color: customColors(context).loadingIndicatorColor,
            radius: 20,
          );
        },
      ),
    );
  }
}

class TitledLoadingIndicator extends StatelessWidget {
  const TitledLoadingIndicator({this.message, super.key});

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
          const LoadingIndicator(),
          if (message case final message?) ...[
            const SizedBox(
              height: Sizes.marginV20,
            ),
            Text(
              message,
              style: TextStyles.f16SemiBold(context),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

class DeliveryLoadingAnimation extends StatelessWidget {
  const DeliveryLoadingAnimation({
    this.height = 150,
    this.width = 150,
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
