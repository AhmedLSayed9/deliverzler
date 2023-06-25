import 'package:flutter/material.dart';

import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:lottie/lottie.dart';

import '../../../../gen/my_assets.dart';
import '../../helpers/localization_helper.dart';
import '../../styles/font_styles.dart';
import '../../styles/sizes.dart';
import '../../utils/scroll_behaviors.dart';
import '../../widgets/custom_text.dart';
import '../full_screen_platform_scaffold.dart';

class SplashScreenCompact extends StatelessWidget {
  const SplashScreenCompact({
    required this.fadeInController,
    super.key,
  });

  final FadeInController fadeInController;

  @override
  Widget build(BuildContext context) {
    return FullScreenPlatformScaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            MyAssets.ASSETS_IMAGES_CORE_CUSTOM_SPLASH_PNG,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ScrollConfiguration(
            behavior: MainScrollBehavior(),
            child: SingleChildScrollView(
              child: FadeIn(
                controller: fadeInController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.screenMarginV16,
                    horizontal: Sizes.screenMarginH28,
                  ),
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: Sizes.maxWidth600,
                        ),
                        child: FractionallySizedBox(
                          widthFactor: 0.64,
                          child: Lottie.asset(
                            MyAssets.ASSETS_IMAGES_CORE_CUSTOM_SPLASH_ANIMATION_JSON,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.marginV12,
                      ),
                      CustomText.f28(
                        context,
                        tr(context).appName,
                        weight: FontStyles.fontWeightExtraBold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
