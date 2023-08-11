import 'package:flutter/material.dart';

import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:lottie/lottie.dart';

import '../../../../gen/my_assets.dart';
import '../../helpers/localization_helper.dart';
import '../../styles/styles.dart';
import '../full_screen_scaffold.dart';
import 'splash_screen.dart';

class SplashScreenCompact extends StatelessWidget {
  const SplashScreenCompact({
    required this.fadeInController,
    super.key,
  });

  final FadeInController fadeInController;

  @override
  Widget build(BuildContext context) {
    return FullScreenScaffold(
      setOlderAndroidImmersiveMode: SplashScreen.setOlderAndroidImmersiveMode,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            MyAssets.ASSETS_IMAGES_CORE_CUSTOM_SPLASH_PNG,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: FadeIn(
              controller: fadeInController,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.screenPaddingV16,
                  horizontal: Sizes.screenPaddingH28,
                ),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
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
                    Text(
                      tr(context).appName,
                      style: TextStyles.f28(context)
                          .copyWith(fontWeight: FontStyles.fontWeightExtraBold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
